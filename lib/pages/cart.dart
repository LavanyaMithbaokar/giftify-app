import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:giftify/pages/checkout.dart';
import 'package:giftify/pages/homepage.dart';

class cart extends StatefulWidget {
  const cart({super.key});

  @override
  State<cart> createState() => _CartState();
}

class _CartState extends State<cart> {
  @override
  Widget build(BuildContext context) {
    // int currentStep = 0;
    // List<Step> getSteps() => [
    //       Step(
    //         isActive: currentStep >= 0,
    //         title: Text('Cart'),
    //         content: Container(),
    //       ),
    //       Step(
    //         isActive: currentStep >= 1,
    //         title: Text('Address'),
    //         content: Container(),
    //       ),
    //       Step(
    //         isActive: currentStep >= 2,
    //         title: Text('Checkout'),
    //         content: Container(),
    //       ),
    //       Step(
    //         isActive: currentStep >= 3,
    //         title: Text('Summary'),
    //         content: Container(),
    //       ),
    //     ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(107, 219, 227, 100),
        title: Text(
          'CART',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            // Stepper(
            //     type: StepperType.horizontal,
            //     steps: getSteps(),
            //     currentStep: currentStep,
            //     onStepContinue: () {
            //       final isLastStep = currentStep == getSteps().length - 1;
            //       if (isLastStep) {
            //         print('Completed');
            //       } else {
            //         setState(() => currentStep += 1);
            //       }
            //     },
            //     onStepCancel: currentStep == 0
            //         ? null
            //         : () => setState(() => currentStep -= 1)),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  // Cart Item
                  Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          // Product Image
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              'assets/category/c1.png', // Replace with actual image path
                              height: 80,
                              width: 80,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 16),
                          // Product Details
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Chocolate Truffle Cake | 1kg Eggless',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Rs 500',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green),
                                ),
                                SizedBox(height: 8),
                                Row(
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.remove_circle_outline),
                                      onPressed: () {},
                                    ),
                                    Text('1', style: TextStyle(fontSize: 14)),
                                    IconButton(
                                      icon: Icon(Icons.add_circle_outline),
                                      onPressed: () {},
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          // Delete Button
                          TextButton(
                            onPressed: () {},
                            child: Text('Delete'),
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  // Price Details
                  Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Price Details (1 Item)',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Item Total',
                                  style: TextStyle(fontSize: 14)),
                              Text('Rs 500', style: TextStyle(fontSize: 14)),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Delivery Fee',
                                  style: TextStyle(fontSize: 14)),
                              Text('Rs 50', style: TextStyle(fontSize: 14)),
                            ],
                          ),
                          Divider(thickness: 2),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Total Amount',
                                  style: TextStyle(fontSize: 14)),
                              Text('Rs 550', style: TextStyle(fontSize: 14)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Footer Section
            Container(
              color: Color.fromRGBO(107, 219, 227, 100),
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Rs 550',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Checkout()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      foregroundColor: Colors.white,
                      padding:
                          EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                    ),
                    child: Text('PROCEED'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                // Product Image
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/category/c1.png', // Replace with actual image path
                    height: 80,
                    width: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 16),
                // Product Details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Chocolate Truffle Cake | 1kg Eggless',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Rs 500',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.green),
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.remove_circle_outline),
                            onPressed: () {},
                          ),
                          Text('1', style: TextStyle(fontSize: 14)),
                          IconButton(
                            icon: Icon(Icons.add_circle_outline),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Delete Button
                TextButton(
                  onPressed: () {},
                  child: Text('Delete'),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 16),
        // Price Details
        Card(
          color: Colors.lightBlueAccent.withOpacity(0.1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Price Details (1 Item)',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                // _buildPriceRow('Total Product Price', 'Rs 500'),
                // _buildPriceRow('Delivery Charge', 'Rs 70'),
                Divider(thickness: 1),
                // _buildPriceRow(
                //   'Order Total',
                //   'Rs 570',
                //   isBold: true,
                // ),
              ],
            ),
          ),
        ),

        // Footer Section
        Container(
          color: Color.fromRGBO(107, 219, 227, 100),
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Rs 570',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // ElevatedButton(
              //   onPressed: () {
              //     Navigator.push(context,
              //         MaterialPageRoute(builder: (context) => Checkout()));
              //   },
              //   style: ElevatedButton.styleFrom(
              //     backgroundColor: Colors.orange,
              //     foregroundColor: Colors.white,
              //     padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              //   ),
              //   child: Text('PROCEED'),
              // ),
            ],
          ),
        ),
      ],
    );
  }
}
