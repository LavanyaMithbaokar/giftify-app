import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:giftify/data/model/home.dart';
import 'package:giftify/logic/controller/authCont.dart';
import 'package:giftify/pages/product.dart';
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
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchDataCategory();
  }

  Future<void> fetchDataCategory() async {
    final DatabaseReference _database = FirebaseDatabase.instance.ref();

    _database.child("data").onValue.listen((event) {
      final data = event.snapshot.value;

      if (data != null && data is Map) {
        // Ensure data is a Map before casting
        HomeModel homeModel =
            HomeModel.fromJson(Map<String, dynamic>.from(data));
        print(homeModel.toJson().toString());
      } else {
        print("Error: Data is null or not in expected format");
      }
    }, onError: (error) {
      print("Firebase Database Error: $error");
    });
  }

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

        leading: Image.asset(
          'assets/images/logo1.png',
        ),
        leadingWidth: 100,
        // title: Text(
        //   'Giftify',
        //   style: TextStyle(
        //     color: Colors.black,
        //     fontSize: 20,
        //     fontWeight: FontWeight.w300,
        //   ),
        // ),
        backgroundColor: Color.fromRGBO(107, 219, 227, 100),
      ),
      body: SingleChildScrollView(
        child: GetBuilder(
            init: _authController,
            builder: (ctrl) {
              return Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Form(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //const Gap(10),
                      Container(
                        color: Color.fromRGBO(107, 219, 227, 100),
                        height: 70,
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                      Gap(20),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Explore Gifts',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            // TextButton(onPressed: () {}, child: Text('View All'))
                          ],
                        ),
                      ),
                      Gap(20),

                      //CATEGORIES
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(width: 20),
                              CircleAvatar(
                                radius: 30, // Size of the circle
                                backgroundColor:
                                    const Color.fromARGB(255, 246, 145, 179),
                                child: IconButton(
                                  icon: Image.asset(
                                    'assets/images/bday.png',
                                    width: 50,
                                    height: 50,
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                              SizedBox(width: 20),
                              CircleAvatar(
                                radius: 30, // Size of the circle
                                backgroundColor:
                                    const Color.fromARGB(255, 246, 145, 179),
                                child: IconButton(
                                  icon: Image.asset(
                                    'assets/images/anniversary.png',
                                    width: 50,
                                    height: 50,
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                              SizedBox(width: 20),
                              CircleAvatar(
                                radius: 30, // Size of the circle
                                backgroundColor:
                                    const Color.fromARGB(255, 246, 145, 179),
                                child: IconButton(
                                  icon: Image.asset(
                                    'assets/images/ring.png',
                                    width: 50,
                                    height: 50,
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                              SizedBox(width: 20),
                              CircleAvatar(
                                radius: 30, // Size of the circle
                                backgroundColor:
                                    const Color.fromARGB(255, 246, 145, 179),
                                child: IconButton(
                                  icon: Image.asset(
                                    'assets/images/basket.png',
                                    width: 50,
                                    height: 50,
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                              SizedBox(width: 20),
                              CircleAvatar(
                                radius: 30, // Size of the circle
                                backgroundColor:
                                    const Color.fromARGB(255, 246, 145, 179),
                                child: IconButton(
                                  icon: Image.asset(
                                    'assets/images/anniversary.png',
                                    width: 50,
                                    height: 50,
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                              SizedBox(width: 20),
                              CircleAvatar(
                                radius: 30, // Size of the circle
                                backgroundColor:
                                    const Color.fromARGB(255, 246, 145, 179),
                                child: IconButton(
                                  icon: Image.asset(
                                    'assets/images/anniversary.png',
                                    width: 50,
                                    height: 50,
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Gap(20),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        child: Text(
                          'Shop by category',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 12),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        child: GridView.count(
                          crossAxisCount: 2,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                          shrinkWrap: true,
                          //physics: NeverScrollableScrollPhysics(),
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => product(),
                                    ));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromRGBO(107, 219, 227, 100),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment
                                      .center, // Vertically center the children
                                  crossAxisAlignment: CrossAxisAlignment
                                      .center, // Horizontally center the children
                                  children: [
                                    ClipRRect(
                                      child: Image.asset(
                                        "assets/category/cake.png", // Replace with your image path
                                        width: 120, // Image width
                                        height: 120, // Image height
                                        fit: BoxFit
                                            .contain, // Maintain image aspect ratio
                                      ),
                                    ),
                                    Gap(10), // Adds space between the image and text
                                    Text(
                                      'Cake', // Replace with your desired text
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16, // Text size
                                        fontWeight:
                                            FontWeight.bold, // Text weight
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(107, 219, 227, 100),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment
                                    .center, // Vertically center the children
                                crossAxisAlignment: CrossAxisAlignment
                                    .center, // Horizontally center the children
                                children: [
                                  ClipRRect(
                                    child: Image.asset(
                                      "assets/category/bouquet.png", // Replace with your image path
                                      width: 120, // Image width
                                      height: 120, // Image height
                                      fit: BoxFit
                                          .contain, // Maintain image aspect ratio
                                    ),
                                  ),
                                  Gap(10), // Adds space between the image and text
                                  Text(
                                    'Bouquet', // Replace with your desired text
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16, // Text size
                                      fontWeight:
                                          FontWeight.bold, // Text weight
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
      // bottomNavigationBar: Container(
      //   color: Colors.black,
      //   child: BottomNavigationBar(
      //     unselectedItemColor: Colors.black,
      //     backgroundColor: Colors.transparent,
      //     fixedColor: Colors.black,
      //     items: [
      //       BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
      //       BottomNavigationBarItem(
      //           icon: Icon(Icons.shopping_cart), label: "Cart"),
      //       BottomNavigationBarItem(
      //           icon: Icon(Icons.favorite), label: "Favourite"),
      //       BottomNavigationBarItem(icon: Icon(Icons.person), label: "You")
      //     ],
      //     onTap: (value) {
      //       if (value == 0) {
      //         _authController.signOut(ref, context);
      //       }
      //       if (value == 1) {}
      //       if (value == 2) {}
      //       if (value == 3) {}
      //     },
      //   ),
      // ),
    );
  }
}
