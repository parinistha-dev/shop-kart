import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_kart/features/dashboard/controller/dashboard_controller.dart';
import 'package:shop_kart/routes.dart';

class WishlistScreen extends GetWidget<DashboardController> {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx((){
        if(controller.wishListList.isEmpty){
          log("wishlist list :" + controller.wishListList.length.toString());
          return Center(
            child: Text("Your Wishlist is empty"),
          );
        }else{
          return Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.6,
                  ),
                  itemCount: controller.wishListList.length,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var data = controller.wishListList[index];
                    return Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 20,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade300,
                            blurRadius: 3,
                            spreadRadius: 2,
                            blurStyle: BlurStyle.outer,
                          ),
                        ],
                      ),
                      child: InkWell(
                        onTap: (){
                          Get.toNamed(AppRoutes.productDetailScreen, arguments: data.productId!.sId);
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Image.network(
                                data.productId?.images?.first ?? "",
                                fit: BoxFit.fill,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              data.productId!.name.toString().toUpperCase(),
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.currency_rupee,
                                  size: 13,
                                  color: Colors.blue,
                                ),
                                Text(
                                  data.productId!.sellingPrice.toString(),
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.blue,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Icon(
                                  Icons.currency_rupee,
                                  size: 10,
                                  color: Colors.grey,
                                ),
                                Text(
                                  data.productId!.originalPrice.toString(),
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey.shade500,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        }
      }),
    );
  }
}
