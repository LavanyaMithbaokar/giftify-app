import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:giftify/pages/cart.dart';
import 'package:giftify/pages/homepage.dart';

class ProductInfo extends StatefulWidget {
  const ProductInfo({super.key});

  @override
  State<ProductInfo> createState() => _ProductInfoState();
}

class _ProductInfoState extends State<ProductInfo> {
  int a = 1, total = 600;
  String? id;

  TextEditingController search = TextEditingController();

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
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Image
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  //BorderRadius.vertical(bottom: Radius.circular(16)),
                  child: Image.asset(
                    'assets/category/c1.png', // Replace with actual image path
                    height: 300,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Product Title
                    //       Text(
                    //         'Chocolate Truffle Cake | 600gm',
                    //         style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    //       ),
                    //       SizedBox(height: 8),
                    //       // Rating and Reviews
                    //       Row(
                    //         children: [
                    //           Icon(Icons.star, color: Colors.amber, size: 20),
                    //           SizedBox(width: 4),
                    //           Text(
                    //             '4.8',
                    //             style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                    //           ),
                    //           // SizedBox(width: 240),
                    //           // Icon(Icons.check_circle, color: Colors.green, size: 20),
                    //           // SizedBox(width: 4),
                    //           // Text(
                    //           //   'Eggless',
                    //           //   style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                    //           // ),
                    //         ],
                    //       ),
                    //       SizedBox(
                    //   height: 15.0,
                    // ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Chocolate Truffle Cake",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            if (a > 1) {
                              --a;
                              total = total - int.parse("600");
                            }
                            setState(() {});
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(8)),
                            child: Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Text(
                          a.toString(),
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        GestureDetector(
                          onTap: () {
                            ++a;
                            total = total + int.parse("600");
                            setState(() {});
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(8)),
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(width: 16),
                    Row(
                      children: [
                        Text(
                          "600gm",
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        // SizedBox(width: 100),
                        // Icon(Icons.star, color: Colors.amber, size: 20),
                        // SizedBox(width: 4),
                        // Text(
                        //   '4.8',
                        //   style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                        // ),
                        // SizedBox(width: 100),
                        // Icon(Icons.circle, color: Colors.green, size: 20),
                        // SizedBox(width: 4),
                        // Text(
                        //   'Eggless',
                        //   style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                        // ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Chocolate Truffle Cake with moist chocolate sponge, whipped dark chocolate truffle mousse filling, and chocolate ganache glaze.',
                      style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                    ),
                    SizedBox(height: 16),
                    // Eggless Tag
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 20),
                        SizedBox(width: 4),
                        Text(
                          '4.8',
                          style:
                              TextStyle(fontSize: 14, color: Colors.grey[700]),
                        ),
                        SizedBox(width: 240),
                        Icon(Icons.circle, color: Colors.green, size: 20),
                        SizedBox(width: 4),
                        Text(
                          'Eggless',
                          style:
                              TextStyle(fontSize: 14, color: Colors.grey[700]),
                        ),
                      ],
                    ),
                    // Row(
                    //   children: [
                    //     Icon(Icons.check_circle, color: Colors.green, size: 20),
                    //     SizedBox(width: 4),
                    //     Text(
                    //       'Eggless',
                    //       style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                    //     ),
                    //   ],
                    // ),
                    SizedBox(height: 16),
                    // Price
                    // Text(
                    //   'Rs 500',
                    //   style: TextStyle(
                    //       fontSize: 18,
                    //       fontWeight: FontWeight.bold,
                    //       color: Colors.green),
                    // ),
                    SizedBox(height: 150),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 40.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Total Price",
                                style: TextStyle(
                                    fontSize: 14, color: Colors.grey[700]),
                              ),
                              Text(
                                "\Rs " + total.toString(),
                                style: TextStyle(
                                    fontSize: 14, color: Colors.grey[700]),
                              )
                            ],
                          ),
                          GestureDetector(
                            onTap: () async {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => cart(),
                                  ));
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width / 2,
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    "Add to cart",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.0,
                                        fontFamily: 'Poppins'),
                                  ),
                                  SizedBox(
                                    width: 30.0,
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(3),
                                    decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Icon(
                                      Icons.shopping_cart_outlined,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),

                    // SizedBox(height: 24),
                    // Add to Cart Button
                    // Center(
                    //   child: ElevatedButton.icon(
                    //     onPressed: () {
                    //       Navigator.pushReplacement(
                    //           context,
                    //           MaterialPageRoute(
                    //             builder: (context) => cart(),
                    //           ));
                    //     },
                    //     icon: Icon(Icons.shopping_cart),
                    //     label: Text('Add To Cart'),
                    //     style: ElevatedButton.styleFrom(
                    //       backgroundColor: Colors.lightBlueAccent,
                    //       foregroundColor: Colors.white,
                    //       padding:
                    //           EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    //       shape: RoundedRectangleBorder(
                    //         borderRadius: BorderRadius.circular(8),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
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
      //         Navigator.pushReplacement(
      //             context,
      //             MaterialPageRoute(
      //               builder: (context) => HomePage(),
      //             ));
      //       }
      //       if (value == 1) {
      //         Navigator.pushReplacement(
      //             context,
      //             MaterialPageRoute(
      //               builder: (context) => cart(),
      //             ));
      //       }
      //       if (value == 2) {}
      //       if (value == 3) {}
      //     },
      //   ),
      // ),
    );
  }
}
