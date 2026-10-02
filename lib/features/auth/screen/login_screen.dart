import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_kart/features/auth/controller/auth_controller.dart';
import 'package:shop_kart/routes.dart';

class LoginScreen extends GetWidget<AuthController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset(
              "assets/image/background/img_auth_background.png",
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
            Container(
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
                top: 75,
                bottom: 20,
              ),
              child: Column(
                children: [
                  Image.asset("assets/image/logo/img_logo.png"),
                  Text(
                    "Welcome Back!",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Login to continue shopping",
                    style: TextStyle(
                      color: Colors.grey.shade400,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 40),
                  TextFormField(
                    controller: controller.loginEmailController,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hint: Text(
                        "Enter Your Email",
                        style: TextStyle(
                          color: Colors.grey.shade400,
                          fontSize: 16,
                        ),
                      ),
                      prefixIcon: Icon(
                        CupertinoIcons.person,
                        color: Colors.grey.shade400,
                        fontWeight: FontWeight.bold,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.grey.shade300,
                          width: 2,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.blue.shade600,
                          width: 1.5,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: controller.loginPassController,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hint: Text(
                        "Enter Password",
                        style: TextStyle(
                          color: Colors.grey.shade400,
                          fontSize: 16,
                        ),
                      ),
                      prefixIcon: Icon(
                        CupertinoIcons.lock,
                        color: Colors.grey.shade400,
                        fontWeight: FontWeight.bold,
                      ),
                      suffixIcon: Icon(
                        CupertinoIcons.eye,
                        color: Colors.grey.shade400,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.grey.shade300,
                          width: 2,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.blue.shade600,
                          width: 1.5,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.85,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.shade600,
                        foregroundColor: Colors.white,
                        textStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () async {
                        final response = await controller.login();

                        var data = jsonDecode(response);

                        if (data["success"] == true) {
                          final sharedPreferences =
                              await SharedPreferences.getInstance();
                          await sharedPreferences.setString(
                            'token',
                            data["token"],
                          );

                          Get.snackbar("Success", data["message"]);
                          Get.offAllNamed(AppRoutes.dashboardScreen);
                        }
                      },
                      child: Text("Log In"),
                    ),
                  ),
                  SizedBox(height: 30),
                  Row(
                    spacing: 20,
                    children: [
                      Expanded(child: Divider(color: Colors.grey.shade300)),
                      Text(
                        "OR",
                        style: TextStyle(
                          color: Colors.grey.shade300,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Expanded(child: Divider(color: Colors.grey.shade300)),
                    ],
                  ),
                  SizedBox(height: 30),
                  SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.85,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.grey.shade500,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        side: BorderSide(width: 1, color: Colors.grey.shade300),
                      ),
                      onPressed: () {
                        Get.to(AppRoutes.otpScreen);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 10,
                        children: [
                          SvgPicture.asset(
                            "assets/image/svg_img/img_google.svg",
                            width: 25,
                            height: 25,
                          ),
                          Text("Continue with Google"),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.85,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.grey.shade500,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        side: BorderSide(width: 1, color: Colors.grey.shade300),
                      ),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 10,
                        children: [
                          SvgPicture.asset(
                            "assets/image/svg_img/img_facebook.svg",
                            width: 25,
                            height: 25,
                          ),
                          Text("Continue with Facebook"),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    spacing: 5,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(
                          color: Colors.grey.shade400,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.toNamed(AppRoutes.signupScreen);
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            color: Colors.blue.shade500,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
