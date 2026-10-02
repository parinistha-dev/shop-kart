import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_kart/core/network/api_services.dart';

class AuthController extends GetxController {

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    otpCountdown();
  }

  final _api = Get.find<ApiServices>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final otpController = TextEditingController();
  final loginEmailController = TextEditingController();
  final loginPassController = TextEditingController();

  RxBool passwordVisible = true.obs;
  RxBool confirmPassVisible = true.obs;

  RxInt countDown = 30.obs;

  final formKey = GlobalKey<FormState>();


  getOtp() async {
    var request = {
      "email": emailController.text,
      "password": passwordController.text,
    };

    final response = await _api.callPostApi("register/sendotp", request: request);
    return response;

  }

  Future<String> verifyOtp() async {
    var request = {
      "email" : emailController.text,
      "otp": otpController.text
    };
    
    final response = await _api.callPostApi("register/verifyotp", request: request);
    return response;
  }

  login() async {
    var request = {
      "email" : loginEmailController.text,
      "password": loginPassController.text
    };

    final response = await _api.callPostApi("user/login", request: request);
    return response;
  }

  otpCountdown(){
    Future.delayed(Duration(seconds: 1), (){
      if(countDown.value > 0) {
        countDown.value = countDown.value - 1;
        otpCountdown();
      }
    });
  }
}
