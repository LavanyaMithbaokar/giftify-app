import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Giftify',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w300,
            )),
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(10),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                  controller: search,
                  decoration: InputDecoration(
                    labelText: "What are you looking for?",
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

              //   CarouselSlider(
              //   items: [

              //     //1st Image of Slider
              //     Container(
              //       margin: EdgeInsets.all(6.0),
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(8.0),
              //         image: DecorationImage(
              //           image: NetworkImage("asests/images/b1.png"),
              //           fit: BoxFit.cover,
              //         ),
              //       ),
              //     ),

              //2nd Image of Slider
              // Container(
              //   margin: EdgeInsets.all(6.0),
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(8.0),
              //     image: DecorationImage(
              //       image: NetworkImage("assets/images.b2.png"),
              //       fit: BoxFit.cover,
              //     ),
              //   ),
              // ),

              //     //3rd Image of Slider
              //     Container(
              //       margin: EdgeInsets.all(6.0),
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(8.0),
              //         image: DecorationImage(
              //           image: NetworkImage("assets/images/b3.png"),
              //           fit: BoxFit.cover,
              //         ),
              //       ),
              //     ),

              //   ],
              //   options: CarouselOptions(
              //     height: 180.0,
              //     enlargeCenterPage: true,
              //     autoPlay: true,
              //     aspectRatio: 16 / 9,
              //     autoPlayCurve: Curves.fastOutSlowIn,
              //     enableInfiniteScroll: true,
              //     autoPlayAnimationDuration: Duration(milliseconds: 800),
              //     viewportFraction: 0.8,
              //   ),

              // ),
            ],
          ),
        ),
      ),
    );
  }
}
