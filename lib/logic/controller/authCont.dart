import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:giftify/data/model/auth.dart';
import 'package:giftify/data/model/userManager.dart';
import 'package:giftify/data/repositories/googleServices.dart';
import 'package:giftify/logic/provider/auth.dart';
import 'package:giftify/logic/provider/user.dart';
import 'package:giftify/pages/homepage.dart';
import 'package:giftify/pages/signup.dart';

class AuthController extends GetxController {
  Future<void> signup(String email, String password, String phone, String name,
      WidgetRef ref, BuildContext context) async {
    try {
      await ref
          .watch(authProvider.notifier)
          .SignUpState(email, password, context)
          .then(
        (value) async {
          if (value["state"] == "success") {
            final userModel = UserModel(
              email: email,
              name: name,
              password: password,
              phone: phone,
              image: "",
            );

            await ref
                .watch(userStateProvider.notifier)
                .updateDataState(userModel);

            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ));
          }
        },
      );
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("no data")));
    }
  }

  Future<void> signIn(String email, String password, WidgetRef ref,
      BuildContext context) async {
    await ref
        .watch(authProvider.notifier)
        .signIn(email, password, context)
        .then(
      (value) async {
        if (value["state"] == "success") {
          final userModel = UserModel(
            email: email,
            name: "",
            password: password,
            phone: "",
            image: "",
          );

          await ref
              .watch(userStateProvider.notifier)
              .updateDataState(userModel);

          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ));
        }
      },
    );

    // Navigator.push(
    //     context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  Future<void> signOut(WidgetRef ref, BuildContext context) async {
    await ref.watch(authProvider.notifier).signOut(context);
    await ref.watch(userStateProvider.notifier).deleteDataState();

    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) {
        return SignUp();
      },
    ));
  }

  Future<void> googleSignin(BuildContext context) async {
    try {
      UserCredential data = await AuthService().signWithGoogle();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Google signin Successful")));

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ));
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message.toString())));
    }
  }
}
