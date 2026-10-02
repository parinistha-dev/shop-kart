import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shop_kart/features/auth/controller/auth_controller.dart';
import 'package:shop_kart/routes.dart';

class SignupScreen extends GetWidget<AuthController> {
  const SignupScreen({super.key});

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
          Container(
            padding: EdgeInsets.only(left: 20, right: 20, top: 40, bottom: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset("assets/image/logo/img_logo.png"),
                  Text(
                    "Create Account",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Sign up to get started",
                    style: TextStyle(
                      color: Colors.grey.shade400,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Form(
                    key: controller.formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: controller.emailController,
                          validator: (value) {
                            if (value == null) {
                              return "Enter email";
                            } else if (!RegExp(
                              "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+.[a-zA-Z]{2,}",
                            ).hasMatch(value)) {
                              return "Enter valid email";
                            }
                            return null;
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
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
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.red.shade600,
                                width: 1.5,
                              ),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.red.shade600,
                                width: 1.5,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Obx(() {
                          return TextFormField(
                            controller: controller.passwordController,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value == null) {
                                return "Enter password";
                              } else if (!RegExp(
                                r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
                              ).hasMatch(value)) {
                                return "Enter valid password";
                              }
                              return null;
                            },
                            obscureText: controller.passwordVisible.value,
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
                              suffixIcon: IconButton(
                                onPressed: () {
                                  controller.passwordVisible.value =
                                      !controller.passwordVisible.value;
                                },
                                icon: Icon(
                                  controller.passwordVisible.value
                                      ? CupertinoIcons.eye
                                      : CupertinoIcons.eye_slash,
                                  color: Colors.grey.shade400,
                                ),
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
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Colors.red.shade600,
                                  width: 1.5,
                                ),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Colors.red.shade600,
                                  width: 1.5,
                                ),
                              ),
                            ),
                          );
                        }),
                        SizedBox(height: 20),
                        Obx(() {
                          return TextFormField(
                            controller: controller.confirmPasswordController,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value != controller.passwordController.text) {
                                return "Enter correct password";
                              }
                              return null;
                            },
                            obscureText: controller.confirmPassVisible.value,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              hint: Text(
                                "Confirm Password",
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
                              suffixIcon: IconButton(
                                onPressed: () {
                                  controller.confirmPassVisible.value =
                                      !controller.confirmPassVisible.value;
                                },
                                icon: Icon(
                                  controller.confirmPassVisible.value
                                      ? CupertinoIcons.eye
                                      : CupertinoIcons.eye_slash,
                                  color: Colors.grey.shade400,
                                ),
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
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Colors.red.shade600,
                                  width: 1.5,
                                ),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Colors.red.shade600,
                                  width: 1.5,
                                ),
                              ),
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
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
                        if (controller.formKey.currentState?.validate() ??
                            false) {
                          var response = await controller.getOtp();
                          var data = jsonDecode(response);

                          if (data["success"] == false) {
                            Get.snackbar("Error!!", data["message"].toString());
                          } else {
                            Get.toNamed(AppRoutes.otpScreen);
                          }
                        } else {
                          Get.snackbar("Error!!", "Fill the details properly");
                        }
                      },
                      child: Text("Send OTP"),
                    ),
                  ),
                  SizedBox(height: 20),
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
                            "assets/image/svg_img/img_google.svg",
                            width: 25,
                            height: 25,
                          ),
                          Text("Continue with Google"),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
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
                  SizedBox(height: 10),
                  Row(
                    spacing: 5,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: TextStyle(
                          color: Colors.grey.shade400,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.toNamed(AppRoutes.loginScreen);
                        },
                        child: Text(
                          "Login",
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
          ),
        ],
      ),
    );
  }
}
