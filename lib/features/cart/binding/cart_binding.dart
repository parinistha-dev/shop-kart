import 'package:get/get.dart';
import 'package:shop_kart/features/cart/controller/cart_controller.dart';

class CartBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => CartController());
  }
}