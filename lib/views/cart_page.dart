import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_cart/controllers/cart_controller.dart';

class CartPage extends StatelessWidget {
  CartPage({Key? key}) : super(key: key);

  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Center(
          child: Text(
            "Cart",
            style: TextStyle(
              color: Colors.white
            ),
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Expanded(
              child: GetX<CartController>(
                builder: (controller) {
                  if(controller.cartProducts.length <= 0){
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("There are no products in the cart", 
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          )
                          ),
                        ],
                      ),
                    );
                  } else{
                    return ListView.builder(
                      controller: ScrollController(),
                      itemCount: controller.cartProducts.length,
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
                                                      controller.cartProducts[index].image,
                                                      height: 70,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(controller.cartProducts[index].name , style: TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 20
                                                      ),),
                                                      Text(controller.cartProducts[index].description)
                                                    ],
                                                  ), 
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  Text("\$${controller.cartProducts[index].price}", style: TextStyle(
                                                    fontSize: 18
                                                  ),),
                                                  SizedBox(height: 5,),
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      controller.removeFromCart(controller.cartProducts[index]);
                                                    },
                                                    child: Text("Remove"),
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
                    );
                }
                }
              ),
            ),
            SizedBox(height: 20,),
            Column(
                children: [
                  Container(
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.black
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          GetX<CartController>(
                            builder: (controller) {
                              return Text(
                                "\$ ${controller.total.toString()}",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              );
                            }
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: MaterialButton(
                  onPressed: () {},
                  height: 50,
                  minWidth: double.infinity,
                  color: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Text("Proceed to purchase", style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                  )),
                ),
              ),
          ],
        ),
      ),
    );
  }
}