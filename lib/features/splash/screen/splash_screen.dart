import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_kart/features/splash/controller/splash_controller.dart';

class SplashScreen extends GetWidget<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/image/background/img_auth_background.png",
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          Center(
            child: Image.asset("assets/image/logo/img_logo.png", height: 200, width: 300,),
          )
        ],
      ),
    );
  }
}