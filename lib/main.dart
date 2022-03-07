import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_cart/views/navigation_bar_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Shopping cart",
      debugShowCheckedModeBanner: false,
      home: NavigationBarPage(),
    );
  }
}