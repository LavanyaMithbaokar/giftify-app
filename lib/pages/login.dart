import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:gap/gap.dart';
import 'package:giftify/pages/signup.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    username.dispose();
    password.dispose();
  }

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Sample data to insert
  Future<void> _login() async {
    try {
      // Fetch user document from Firestore
      QuerySnapshot querySnapshot = await _firestore
          .collection('login')
          .where('username', isEqualTo: username.text)
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
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/background.png"),
                fit: BoxFit.cover),
          ),
          child: Form(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Gap(150),
              Image.asset(
                "assets/images/logo.png",
                width: (MediaQuery.of(context).size.width / 2) - 80,
                height: (MediaQuery.of(context).size.height / 2) - 240,
              ),
              const Text(
                "GIFTIFY",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const Gap(20),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                  controller: username,
                  decoration: InputDecoration(
                    labelText: "username",
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
                    labelText: "password",
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
                  height: (MediaQuery.of(context).size.height / 2) - 310,
                  child: ElevatedButton(
                    onPressed: _login,
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  )),
              Gap(40),
              SizedBox(
                  width: (MediaQuery.of(context).size.width / 2) - 60,
                  height: (MediaQuery.of(context).size.height / 2) - 310,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUp(),
                          ));
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  )),
            ],
          )),
        ),
      ),
    );
  }
}
