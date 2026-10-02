import 'package:get/get.dart';
import 'package:shop_kart/features/realtime_database/controller/realtime_database_controller.dart';

class RealtimeDatabaseBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => RealtimeDatabaseController());
  }
}