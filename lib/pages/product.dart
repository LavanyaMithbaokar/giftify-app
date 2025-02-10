import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:giftify/pages/ProductInfo.dart';
import 'package:giftify/pages/cart.dart';
import 'package:giftify/pages/homepage.dart';

class product extends StatefulWidget {
  const product({super.key});

  @override
  State<product> createState() => _productState();
}

class _productState extends State<product> {
  TextEditingController search = TextEditingController();

  final List<Map<String, dynamic>> cakes = [
    {
      "name": "Chocolate Truffle Cake | 1kg",
      "price": "Rs 500",
      "rating": 4.8,
      "image": "assets/category/c1.png", // Replace with actual images
    },
    {
      "name": "Vanilla Bento Cake | 250gms",
      "price": "Rs 350",
      "rating": 4.8,
      "image": "assets/category/c2.png",
    },
    {
      "name": "Red Velvet Cake | 600gms",
      "price": "Rs 500",
      "rating": 4.8,
      "image": "assets/category/c3.png",
    },
    {
      "name": "Peanut Butter Chocolate Cake",
      "price": "Rs 600",
      "rating": 4.8,
      "image": "assets/category/c4.png",
    },
    {
      "name": "Chocolate Fudge Cake",
      "price": "Rs 470",
      "rating": 4.8,
      "image": "assets/category/c5.png",
    },
    {
      "name": "Designer Cakes | 1.5kg",
      "price": "Rs 1600",
      "rating": 4.8,
      "image": "assets/category/c6.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        title: TextField(
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
        backgroundColor: Color.fromRGBO(107, 219, 227, 100),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.7,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemCount: cakes.length,
            itemBuilder: (context, index) {
              final cake = cakes[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductInfo(),
                      ));
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(12)),
                          child: Image.asset(
                            cake["image"],
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              cake["name"],
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 4),
                            Row(
                              children: [
                                Icon(Icons.star, color: Colors.amber, size: 16),
                                SizedBox(width: 4),
                                Text("${cake["rating"]}"),
                              ],
                            ),
                            SizedBox(height: 4),
                            Text(
                              cake["price"],
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
      // // bottomNavigationBar: Container(
      // //   color: Colors.black,
      // //   child: BottomNavigationBar(
      // //     unselectedItemColor: Colors.black,
      // //     backgroundColor: Colors.transparent,
      // //     fixedColor: Colors.black,
      // //     items: [
      // //       BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
      // //       BottomNavigationBarItem(
      // //           icon: Icon(Icons.shopping_cart), label: "Cart"),
      // //       BottomNavigationBarItem(
      // //           icon: Icon(Icons.favorite), label: "Favourite"),
      // //       BottomNavigationBarItem(icon: Icon(Icons.person), label: "You")
      // //     ],
      // //     onTap: (value) {
      // //       if (value == 0) {
      // //         Navigator.pushReplacement(
      // //             context,
      // //             MaterialPageRoute(
      // //               builder: (context) => HomePage(),
      // //             ));
      // //       }
      // //       if (value == 1) {
      // //         Navigator.pushReplacement(
      // //             context,
      // //             MaterialPageRoute(
      // //               builder: (context) => cart(),
      // //             ));
      // //       }
      // //       if (value == 2) {}
      // //       if (value == 3) {}
      // //     },
      // //   ),
      // ),
    );
  }
}
