import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:giftify/data/model/userManager.dart';
import 'package:giftify/pages/signup.dart';

class AuthProvider extends StateNotifier<Usermanager> {
  AuthProvider() : super(Usermanager(id: "2", email: "", name: ""));

  Future<void> SignUpState(
      String email, String password, BuildContext context) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Signup Successful")));
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
