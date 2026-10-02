import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:shop_kart/features/auth/controller/auth_controller.dart';
import 'package:shop_kart/routes.dart';

class OtpVerificationScreen extends GetWidget<AuthController> {
  const OtpVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Stack(
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
                top: 50,
                bottom: 70,
              ),
              child: SingleChildScrollView(
                child: Column(
                  spacing: 10,
                  children: [
                    Image.asset(
                      "assets/illustration/illust_otp.png",
                      height: 300,
                      width: MediaQuery.of(context).size.width * 0.8,
                    ),
                    Text(
                      "Verify OTP",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Enter the 6-digit OTP send to",
                      style: TextStyle(
                        color: Colors.grey.shade400,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          controller.emailController.text,
                          style: TextStyle(
                            color: Colors.blue.shade400,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 10),
                        InkWell(
                          onTap: () {
                            Get.offNamed(AppRoutes.signupScreen);
                          },
                          child: Text(
                            "Edit",
                            style: TextStyle(
                              color: Colors.blue.shade400,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Pinput(
                      length: 6,
                      controller: controller.otpController,
                      defaultPinTheme: PinTheme(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          border: BoxBorder.all(
                            color: Colors.grey.shade300,
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                      ),
                      focusedPinTheme: PinTheme(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          border: BoxBorder.all(
                            color: Colors.blue.shade600,
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 70),
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
                          log("otp ${controller.otpController.text}");

                          final response = await controller.verifyOtp();

                          var data = jsonDecode(response);
                          log("data  ${data.toString()}");

                          if (data["success"] == true) {
                            log("true otp");
                            Get.offAllNamed(AppRoutes.loginScreen);
                          } else if (data["success"] == false) {
                            Get.snackbar("Error!!", data["message"]);
                          } else {
                            Get.snackbar("Error!!", "Something went wrong");
                          }
                        },
                        child: Text("Verify OTP"),
                      ),
                    ),
                    if (controller.countDown.value > 0)
                      Obx(
                        () => Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Resend OTP in"),
                            SizedBox(width: 10),
                            Text(
                              "00 : ",
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              controller.countDown.value.toString(),
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    if (controller.countDown.value == 0)
                      InkWell(
                        onTap: () {
                          controller.countDown.value = 30;
                          controller.otpCountdown();
                        },
                        child: Text(
                          "Resend OTP",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
