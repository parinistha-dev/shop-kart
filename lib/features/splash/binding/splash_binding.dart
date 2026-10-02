import 'package:get/get.dart';
import 'package:shop_kart/features/splash/controller/splash_controller.dart';

class SplashBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => SplashController());
  }
}