import 'package:get/get.dart';
import '../models/product.dart';

class ShoppingController extends GetxController {
  var products = <Product>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    var productsResult = [
      Product(1, "Jordan 1 High OG SP", "Fragment x Travis Scott", 2500, "https://images.stockx.com/images/Air-Jordan-1-High-OG-SP-fragment-design-x-Travis-Scott-Product.jpg?fit=fill&bg=FFFFFF&w=700&h=500&fm=webp&auto=compress&q=90&dpr=2&trim=color&updated_at=1628097985"),
      Product(2, "Jordan 1 High OG", "Patent Bred", 300, "https://images.solecollector.com/complex/image/upload/c_fill,f_auto,fl_lossy,q_auto,w_1100/air-jordan-1-retro-og-hero_xf8joi.jpg"),
      Product(3, "Jordan 11 Retro", "Gamma blue", 550, "https://images.stockx.com/images/Air-Jordan-11-Retro-Gamma-Blue-Product.jpg?fit=fill&bg=FFFFFF&w=700&h=500&fm=webp&auto=compress&q=90&dpr=2&trim=color&updated_at=1607656798"),
      Product(4, "Jordan 1 Retro High", "Off-White University blue", 1500, "https://images.stockx.com/images/Air-Jordan-1-Retro-High-Off-White-University-Blue-Product.jpg?fit=fill&bg=FFFFFF&w=700&h=500&fm=webp&auto=compress&q=90&dpr=2&trim=color&updated_at=1606321054"),
      Product(6, "Nike Air Force 1 Low '07", "White", 100, "https://gamarraecommerce.com/wp-content/uploads/2020/05/Nike-Air-Force-1-Low-White-07-01.jpg"),
      Product(6, "Jordan 1 Retro High OG", "Laney", 560, "https://cdn.flightclub.com/TEMPLATE/011828/1.jpg"),
    ];

    products.assignAll(productsResult);
  }
}