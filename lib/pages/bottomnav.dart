import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:giftify/pages/cart.dart';
import 'package:giftify/pages/favourite.dart';
import 'package:giftify/pages/homepage.dart';
import 'package:giftify/pages/profile.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentTabIndex = 0;

  late List<Widget> pages;
  late Widget currentPage;
  late HomePage homepage;
  late Profile profile;
  late cart cartpage;
  late Fav favourite;

  @override
  void initState() {
    homepage = HomePage();
    cartpage = cart();
    profile = Profile();
    favourite = Fav();
    pages = [homepage, cartpage, favourite, profile];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
          height: 55,
          backgroundColor: Colors.white,
          color: Color.fromRGBO(107, 219, 227, 100),
          animationDuration: Duration(milliseconds: 500),
          onTap: (int index) {
            setState(() {
              currentTabIndex = index;
            });
          },
          items: [
            Icon(
              Icons.home_outlined,
              color: Colors.black,
            ),
            Icon(
              Icons.shopping_cart_outlined,
              color: Colors.black,
            ),
            Icon(
              Icons.favorite_outline,
              color: Colors.black,
            ),
            Icon(
              Icons.person_outline,
              color: Colors.black,
            )
          ]),
      body: pages[currentTabIndex],
    );
  }
}
