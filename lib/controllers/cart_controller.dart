import 'package:get/get.dart';
import 'package:shopping_cart/models/product.dart';

class CartController extends GetxController {
  var cartProducts = <Product>[].obs;
  double get total => cartProducts.fold(0, (sum, item) => sum + item.price);

  addToCart(Product product) {
    cartProducts.add(product);
  }

  removeFromCart(Product product) {
    cartProducts.remove(product);
  }
}