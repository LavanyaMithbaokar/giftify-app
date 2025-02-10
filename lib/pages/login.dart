import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:giftify/logic/controller/authCont.dart';
import 'package:giftify/pages/signup.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends ConsumerStatefulWidget {
  const Login({super.key});

  @override
  ConsumerState<Login> createState() => _LoginState();
}

class _LoginState extends ConsumerState<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    email.dispose();
    password.dispose();
  }

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Sample data to insert

  Future<void> _login() async {
    try {
      // Fetch user document from Firestore
      QuerySnapshot querySnapshot = await _firestore
          .collection('login')
          .where('email', isEqualTo: email.text)
          .where('password', isEqualTo: password.text)
          .get();

      // Check if user exists
      if (querySnapshot.docs.isNotEmpty) {
        // Successful login
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Login successful!')),
        );
        // Navigate to another page or perform any action
      } else {
        // Invalid credentials
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Invalid username or password.')),
        );
      }
    } catch (e) {
      print('Error during login: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('An error occurred. Please try again.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder(
          init: AuthController(),
          builder: (ctrl) {
            return SingleChildScrollView(
              child: Container(
                color: Colors.cyan[100],
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                // decoration: const BoxDecoration(
                //   image: DecorationImage(
                //       image: AssetImage("assets/images/bg.png"),
                //       fit: BoxFit.cover),
                // ),
                child: Form(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Gap(150),
                    Image.asset(
                      "assets/images/logo1.png",
                      width: (MediaQuery.of(context).size.width / 2) - 60,
                      height: (MediaQuery.of(context).size.height / 2) - 320,
                    ),
                    // const Text(
                    //   "Login",
                    //   style: TextStyle(
                    //     fontSize: 40,
                    //     fontWeight: FontWeight.w900,
                    //   ),
                    // ),
                    const Gap(20),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: TextField(
                        controller: email,
                        decoration: InputDecoration(
                          hintText: "Email",
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
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: TextField(
                        controller: password,
                        decoration: InputDecoration(
                          hintText: "password",
                          prefixIcon: const Icon(Icons.lock),
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
                    SizedBox(
                        width: (MediaQuery.of(context).size.width / 2) - 60,
                        child: ElevatedButton(
                          onPressed: () {
                            ctrl.signIn(
                                email.text, password.text, ref, context);
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        )),
                    Gap(20),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 90),
                      child: Row(
                        children: [
                          Text("Don't have and account? "),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignUp(),
                                  ));
                            },
                            child: Text(
                              "Sign Up",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // SizedBox(
                    //   width: (MediaQuery.of(context).size.width / 2) - 60,
                    //   child: ElevatedButton(
                    //     onPressed: () {
                    //       Navigator.push(
                    //           context,
                    //           MaterialPageRoute(
                    //             builder: (context) => SignUp(),
                    //           ));
                    //     },
                    //     child: const Text(
                    //       "Sign Up",
                    //       style: TextStyle(
                    //         color: Colors.black,
                    //         fontSize: 20,
                    //         fontWeight: FontWeight.w300,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    Gap(20),
                    // Text("Or login with"),
                    IconButton(
                      icon: Image.asset(
                        'assets/images/google.png',
                        width: 50,
                        height: 50,
                      ),
                      color: Colors.blue,
                      iconSize: 30.0,
                      tooltip: 'Like',
                      onPressed: () {
                        ctrl.googleSignin(context);
                      },
                    ),
                  ],
                )),
              ),
            );
          }),
    );
  }
}
