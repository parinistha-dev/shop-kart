import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shop_kart/features/profile_update/controller/profile_update_controller.dart';

class ProfileUpdateScreen extends GetWidget<ProfileUpdateController> {
  const ProfileUpdateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 80, left: 30, right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Stack(
                children: [
                  SvgPicture.asset(
                    "assets/image/svg_img/img_profile.svg",
                    height: 120,
                    width: 120,
                  ),
                  Positioned(
                    right: 5,
                    bottom: 0,
                    child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: Colors.grey.shade400, blurRadius: 3)
                          ]
                        ),
                        child: Icon(Icons.edit, color: Colors.grey.shade800, size: 20,)),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text("Personal Information", style: TextStyle(fontSize: 14, color: Colors.grey.shade700),)
          ],
        ),
      ),
    );
  }
}
