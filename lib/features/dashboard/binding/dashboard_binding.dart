import 'package:get/get.dart';
import 'package:shop_kart/core/network/api_services.dart';
import 'package:shop_kart/features/dashboard/controller/dashboard_controller.dart';

class DashboardBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(()=> DashboardController());
    Get.lazyPut(()=> ApiServices());
  }
}