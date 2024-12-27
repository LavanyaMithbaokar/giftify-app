import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:giftify/logic/controller/authCont.dart';
import 'package:giftify/logic/provider/auth.dart';
import 'package:giftify/pages/homepage.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUp extends ConsumerStatefulWidget {
  const SignUp({super.key});

  @override
  ConsumerState<SignUp> createState() => _SignUpState();
}

class _SignUpState extends ConsumerState<SignUp> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPass = TextEditingController();
  TextEditingController phone = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    name.dispose();
    email.dispose();
    password.dispose();
    confirmPass.dispose();
    phone.dispose();
  }

  //final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder(
        init: AuthController(),
        builder: (ctrl) {
          return SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/bg.png"),
                    fit: BoxFit.cover),
              ),
              child: Form(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Gap(150),
                  const Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const Gap(20),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: TextFormField(
                      controller: name,
                      decoration: InputDecoration(
                        hintText: "Full Name",
                        prefixIcon: Icon(Icons.person),
                        prefixIconColor: Colors.amber[500],
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                  const Gap(20),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: TextField(
                      controller: email,
                      decoration: InputDecoration(
                        hintText: "Username",
                        prefixIcon: Icon(Icons.person),
                        prefixIconColor: Colors.amber[500],
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                  const Gap(20),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: TextField(
                      controller: phone,
                      decoration: InputDecoration(
                        hintText: "Phone no.",
                        prefixIcon: Icon(Icons.call),
                        prefixIconColor: Colors.amber[500],
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                  const Gap(20),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: TextField(
                      controller: password,
                      decoration: InputDecoration(
                        hintText: "Password",
                        prefixIcon: Icon(Icons.lock),
                        prefixIconColor: Colors.amber[500],
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                  const Gap(20),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: TextField(
                      controller: confirmPass,
                      decoration: InputDecoration(
                        hintText: "Confirm Password",
                        prefixIcon: Icon(Icons.lock),
                        prefixIconColor: Colors.amber[500],
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                  Gap(20),
                  ElevatedButton(
                    onPressed: () async {
                      await ctrl.signup(email.text, password.text, phone.text,
                          name.text, ref, context);
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  Gap(20),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUp(),
                          ));
                    },
                    child: Text("Login"),
                  )
                ],
              )),
            ),
          );
        },
      ),
    );
  }
}
