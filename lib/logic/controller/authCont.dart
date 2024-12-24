import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:giftify/data/model/userManager.dart';
import 'package:giftify/logic/provider/auth.dart';
import 'package:giftify/pages/homepage.dart';

class AuthController extends GetxController {
  Future<void> signup(String email, String password, WidgetRef ref,
      BuildContext context) async {
    await ref
        .watch(authProvider.notifier)
        .SignUpState(email, password, context);

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }
}
