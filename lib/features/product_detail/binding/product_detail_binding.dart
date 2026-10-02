import 'package:get/get.dart';
import 'package:shop_kart/features/product_detail/controller/product_detail_controller.dart';

class ProductDetailBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => ProductDetailController());
  }
}