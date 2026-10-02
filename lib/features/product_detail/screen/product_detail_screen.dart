import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_kart/features/product_detail/controller/product_detail_controller.dart';
import 'package:shop_kart/routes.dart';

class ProductDetailScreen extends GetWidget<ProductDetailController> {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios_new_rounded),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.share)),
          Obx(
            () => IconButton(
              onPressed: () {
                if (controller.isAddedWishlist.value) {
                  controller.deleteWishlist();
                } else {
                  controller.addWishList();
                }
              },
              icon: controller.isAddedWishlist.value
                  ? Icon(CupertinoIcons.heart_fill, color: Colors.red)
                  : Icon(CupertinoIcons.heart),
            ),
          ),
        ],
      ),
      body: Obx(() {
        var data = controller.apiList.value;
        if (data == null) {
          return Center(child: CircularProgressIndicator());
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                data.images!.first.toString(),
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width * 0.99,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                spacing: 5,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    spacing: 5,
                    children: [
                      Text(
                        data.name!.toUpperCase().toString(),
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Expanded(child: SizedBox()),
                      Icon(Icons.star, color: Colors.yellow.shade600),
                      Text(
                        data.rating.toString(),
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        "(0 Reviews)",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.currency_rupee,
                        size: 20,
                        fontWeight: FontWeight.w400,
                      ),
                      Text(
                        data.sellingPrice.toString(),
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: 10),
                      Icon(
                        Icons.currency_rupee,
                        size: 15,
                        color: Colors.grey.shade500,
                        fontWeight: FontWeight.w400,
                      ),
                      Text(
                        data.originalPrice.toString(),
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey.shade500,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        data.discountPercentage!.toInt().toString(),
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "% OFF",
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "Inclusive of all taxes",
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    decoration: BoxDecoration(color: Colors.green.shade50),
                    child: Column(
                      spacing: 6,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Delivery",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Row(
                          spacing: 10,
                          children: [
                            Icon(
                              Icons.local_shipping_outlined,
                              color: Colors.green,
                              size: 40,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "FREE DELIVERY",
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Row(
                                  spacing: 6,
                                  children: [
                                    Text(
                                      "Get it by",
                                      style: TextStyle(
                                        color: Colors.grey.shade500,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "Mon, 01 June",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: Colors.grey.shade600,
                              size: 30,
                            ),
                            Text(
                              "Deliver to : ",
                              style: TextStyle(
                                color: Colors.grey.shade500,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "ABC, Lucknow",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Expanded(child: SizedBox()),
                            Text(
                              "Change",
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
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
          ],
        );
      }),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 40),
        child: InkWell(
          onTap: () async {
            if (controller.isAddedCart.value) {
              Get.toNamed(AppRoutes.cartScreen);
            } else {
              var response = await controller.addToCart();
              var data = jsonDecode(response) as Map;

              if (data["success"]) {
                Get.snackbar("Success", "Added to Cart");
              }
            }
          },
          child: Obx(() {
            var text = controller.isAddedCart.value
                ? "Go to Cart"
                : "Add to Cart";
            return Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue, width: 2),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 5,
                children: [
                  Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.blue,
                    size: 30,
                  ),
                  Text(
                    text,
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
