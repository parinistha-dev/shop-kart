import 'dart:developer';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_kart/routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Future.delayed(Duration(seconds: 3), () {
      navigate();
    });
  }

  navigate() async {
    final sharedPreference = await SharedPreferences.getInstance();
    final token = sharedPreference.getString('token');
    log(token.toString());
    if(token.toString().isEmpty || token == null){
      Get.offNamed(AppRoutes.loginScreen);
    }else{
      Get.offNamed(AppRoutes.dashboardScreen);
    }
  }

}