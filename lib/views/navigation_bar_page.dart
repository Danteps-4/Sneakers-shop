import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_cart/controllers/navigation_bar_controller.dart';
import 'package:shopping_cart/views/cart_page.dart';
import 'package:shopping_cart/views/homepage.dart';
import 'package:shopping_cart/views/profile_page.dart';
import 'package:shopping_cart/views/shopping_page.dart';

class NavigationBarPage extends StatelessWidget {
  NavigationBarPage({Key? key}) : super(key: key);

  final navigationBarController = Get.put(NavigationBarController());

  final screens = [
    HomePage(),
    ShoppingPage(),
    CartPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetX<NavigationBarController>(
        builder: (controller) {
          return IndexedStack(
            index: controller.selectedIndex.value,
            children: screens,
          );
        }
      ),
      bottomNavigationBar: GetX<NavigationBarController>(
        builder: (controller) {
          return BottomNavigationBar(
            type: BottomNavigationBarType.shifting,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white38,
            showSelectedLabels: true,
            showUnselectedLabels: false,
            onTap: (index) {
              controller.changeIndex(index);
            },
            currentIndex: controller.selectedIndex.value,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
                backgroundColor: Colors.black,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag),
                label: "Shopping",
                backgroundColor: Colors.black,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: "Cart",
                backgroundColor: Colors.black,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Profile",
                backgroundColor: Colors.black,
              )
            ],
          );
        }
      ),
    );
  }
}