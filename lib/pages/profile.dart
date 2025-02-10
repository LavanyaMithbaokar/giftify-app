import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:giftify/pages/homepage.dart';
import 'package:giftify/pages/login.dart';
import 'package:giftify/pages/nav.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(107, 219, 227, 100),
        title: Text(
          " My Profile",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                // CircleAvatar(
                //   radius: 40,
                //   backgroundImage: AssetImage(assetName), // Replace with user image
                // ),
                // SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Matilda Brown',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'matildabrown@mail.com',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Divider(),
                    ProfileOption(title: "My Order"),
                    Divider(),
                    ProfileOption(title: "Wishlist"),
                    Divider(),
                    ProfileOption(title: "Reminders"),
                    Divider(),
                    ProfileOption(title: "Shipping Address"),
                    Divider(),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Login()));
                      },
                      child: Text("Logout"),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileOption extends StatelessWidget {
  final String title;
  // final String subtitle;
  // final VoidCallback onTap;

  ProfileOption({
    required this.title,
    // required this.subtitle,
    // required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 320,
              child: Text(
                title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
