import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:giftify/logic/controller/authCont.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final List<Map<String, String>> imgList = [
    {'image': 'assets/images/b1.png'},
    {'image': 'assets/images/b2.png'},
    {'image': 'assets/images/b3.png'},
  ];

  TextEditingController search = TextEditingController();

  AuthController _authController = AuthController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.location_on),
          ),
          // IconButton(
          //   onPressed: () {},
          //   icon: Icon(Icons.location_on),
          // ),
        ],
        leading: null,
        title: Row(
          children: [
            Icon(
              Icons.gif_box,
              color: Colors.pink,
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              'Giftify',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.cyan,
      ),
      body: SingleChildScrollView(
        child: GetBuilder(
            init: _authController,
            builder: (ctrl) {
              return Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                // decoration: const BoxDecoration(
                //   image: DecorationImage(
                //       image: AssetImage("assets/images/bg.png"), fit: BoxFit.cover),
                // ),
                child: Form(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //const Gap(10),
                      Container(
                        color: Colors.cyan,
                        height: 70,
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                        child: TextFormField(
                          controller: search,
                          decoration: InputDecoration(
                            hintText: "What are you looking for?",
                            prefixIcon: Icon(Icons.search),
                            prefixIconColor: Colors.black,
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                      ),
                      Gap(20),
                      CarouselSlider(
                        items: imgList.map(
                          (e) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                width: 550,
                                height: 200,
                                '${e["image"]}',
                                fit: BoxFit.cover,
                              ),
                            );
                          },
                        ).toList(),
                        options: CarouselOptions(
                          height: 180.0,
                          enlargeCenterPage: true,
                          autoPlay: true,
                          aspectRatio: 16 / 9,
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enableInfiniteScroll: true,
                          autoPlayAnimationDuration:
                              Duration(milliseconds: 800),
                          viewportFraction: 0.8,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
      bottomNavigationBar: Container(
        color: Colors.black,
        child: BottomNavigationBar(
          unselectedItemColor: Colors.black,
          backgroundColor: Colors.transparent,
          fixedColor: Colors.black,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home")
          ],
          onTap: (value) {
            if (value == 0) {
              _authController.signOut(ref, context);
            }
          },
        ),
      ),
    );
  }
}
