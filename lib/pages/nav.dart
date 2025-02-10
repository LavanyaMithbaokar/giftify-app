import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:giftify/pages/cart.dart';
import 'package:giftify/pages/favourite.dart';
import 'package:giftify/pages/homepage.dart';
import 'package:giftify/pages/profile.dart';

class Nav extends StatelessWidget {
  const Nav({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 60,
          elevation: 10,
          backgroundColor: Colors.white,
          indicatorColor: Color.fromRGBO(107, 219, 227, 100),
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          destinations: const [
            NavigationDestination(
                icon: Icon(Icons.home_outlined), label: "Home"),
            NavigationDestination(
                icon: Icon(Icons.shopping_cart_outlined), label: "Cart"),
            NavigationDestination(
                icon: Icon(Icons.favorite_outline), label: "Favourite"),
            NavigationDestination(
                icon: Icon(Icons.person_outline), label: "Profile"),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
      //  appBar: AppBar(),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screens = [HomePage(), cart(), Fav(), Profile()];
}
