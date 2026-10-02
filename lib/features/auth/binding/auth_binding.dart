import 'package:get/get.dart';
import 'package:shop_kart/core/network/api_services.dart';
import 'package:shop_kart/features/auth/controller/auth_controller.dart';

class AuthBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => ApiServices());
  }
}