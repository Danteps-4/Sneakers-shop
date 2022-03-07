import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_cart/controllers/cart_controller.dart';
import 'package:shopping_cart/controllers/navigation_bar_controller.dart';
import '../controllers/shopping_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Center(
          child: Text(
            "Home",
            style: TextStyle(
              color: Colors.white
            ),
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("The Sneaker Shop", style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold
            ),),
            Text("Buy your favourites sneakers here", style: TextStyle(
              fontSize: 15,
            ),)
          ],
        ),
      ),
    );
  }
}