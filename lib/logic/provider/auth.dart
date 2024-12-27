import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:giftify/data/model/userManager.dart';
import 'package:giftify/pages/signup.dart';

class AuthProvider extends StateNotifier<Usermanager> {
  AuthProvider() : super(Usermanager(id: "2", email: "", name: ""));

  Future<Map<String, dynamic>> SignUpState(
      String email, String password, BuildContext context) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Signup Successful")));
      return {"state": "success"};
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message.toString())));
      return {"state": "fail"};
    }
  }

  Future<Map<String, dynamic>> signIn(
      String email, String password, BuildContext context) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("SignIn Successful")));
      return {"state": "success"};
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message.toString())));
      return {"state": "fail"};
    }
  }

  Future<void> signOut(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("SignOut Successful")));
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message.toString())));
    }
  }
}

final authProvider = StateNotifierProvider<AuthProvider, Usermanager>(
  (ref) {
    return AuthProvider();
  },
);
