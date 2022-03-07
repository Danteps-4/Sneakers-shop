import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_cart/controllers/cart_controller.dart';
import '../controllers/shopping_controller.dart';

class ShoppingPage extends StatelessWidget {
  ShoppingPage({Key? key}) : super(key: key);

  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Center(
          child: Text(
            "Shopping",
            style: TextStyle(
              color: Colors.white
            ),
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          children: [
            Expanded(
              child: GetX<ShoppingController>(
                builder: ((controller) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: ListView.builder(
                    controller: ScrollController(),
                    itemCount: controller.products.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(.0),
                        child: Card(
                          child: Container(
                            height: 100,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(right: 20),
                                            child: Image.network(
                                              controller.products[index].image,
                                              height: 70,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(controller.products[index].name, style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20
                                              ),),
                                              Text(controller.products[index].description)
                                            ],
                                          ), 
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Text("\$${controller.products[index].price.toString()}", style: TextStyle(
                                            fontSize: 18
                                          ),),
                                          SizedBox(height: 5,),
                                          ElevatedButton(
                                            onPressed: () {
                                              cartController.addToCart(controller.products[index]);
                                            },
                                            child: Text("Add"),
                                            style: ElevatedButton.styleFrom(
                                              primary: Colors.black
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                  ),
                );
              }),)
            ),
          ],
        ),
      ),
      // bottomNavigationBar: ,
    );
  }
}