import 'package:get/get.dart';
import 'package:shop_kart/features/profile_update/controller/profile_update_controller.dart';

class ProfileUpdateBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => ProfileUpdateController());
  }
}