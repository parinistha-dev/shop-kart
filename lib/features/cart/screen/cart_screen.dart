import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_kart/features/cart/controller/cart_controller.dart';

class CartScreen extends GetWidget<CartController> {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios_new, size: 20),
        ),
        leadingWidth: 40,
        title: Text(
          "My Cart",
          style: TextStyle(
            color: Colors.grey.shade500,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
      ),
      body: Obx(() {
        if (controller.cartList.isEmpty) {
          return Image.asset("assets/illustration/illust_empty_cart.png");
        } else {
          if (controller.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          }
          return Container(
            padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 30),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(5),

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.green.shade50,
                      border: Border.all(color: Colors.green, width: 1),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          CupertinoIcons.tags_solid,
                          color: Colors.green,
                          size: 20,
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Yay! You got free delivery on this order",
                          style: TextStyle(color: Colors.green, fontSize: 15),
                        ),
                        Expanded(child: SizedBox()),
                        Icon(Icons.verified, color: Colors.green, size: 20),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  ListView.builder(
                    itemCount: controller.cartList.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      var data = controller.cartList[index];
                      return Container(
                        height: 180,
                        width: 200,
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade400,
                              blurStyle: BlurStyle.outer,
                              blurRadius: 2,
                            ),
                          ],
                        ),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.95,
                          child: Row(
                            children: [
                              Image.network(
                                data.productId!.images!.first.toString(),
                                height: 170,
                                width: 150,
                                fit: BoxFit.fill,
                              ),
                              SizedBox(width: 15),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    data.productId!.name!
                                        .toUpperCase()
                                        .toString(),
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 6),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.currency_rupee,
                                        size: 20,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      Text(
                                        data.productId!.sellingPrice.toString(),
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.currency_rupee,
                                        size: 14,
                                        color: Colors.grey.shade500,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      Text(
                                        data.productId!.originalPrice
                                            .toString(),
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.grey.shade500,
                                          decoration:
                                              TextDecoration.lineThrough,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        data.productId!.discountPercentage!
                                            .toInt()
                                            .toString(),
                                        style: TextStyle(
                                          color: Colors.green,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "% OFF",
                                        style: TextStyle(
                                          color: Colors.green,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                  Container(
                                    height: 35,
                                    width: 120,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.blue,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            controller.updateCart(
                                              data.productId!.sId.toString(),
                                              "increase",
                                              index,
                                            );
                                          },
                                          icon: Icon(
                                            CupertinoIcons.plus,
                                            color: Colors.blue,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          iconSize: 15,
                                        ),
                                        Obx(
                                          () => Text(
                                            data.quantity.value.toString(),
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            log(
                                              controller
                                                  .cartList[index]
                                                  .quantity
                                                  .value
                                                  .toString(),
                                            );
                                            if (controller
                                                    .cartList[index]
                                                    .quantity
                                                    .value >
                                                1) {
                                              controller.updateCart(
                                                data.productId!.sId.toString(),
                                                "decrease",
                                                index,
                                              );
                                            } else {
                                              controller.deleteEachItem(
                                                data.productId!.sId.toString(),
                                                index,
                                              );
                                            }
                                          },
                                          icon: Icon(
                                            CupertinoIcons.minus,
                                            color: Colors.blue,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          iconSize: 15,
                                        ),
                                      ],
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
                  Container(
                    padding: EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade500,
                          blurStyle: BlurStyle.outer,
                          blurRadius: 2,
                          spreadRadius: 4,
                        ),
                      ],
                    ),
                    child: Column(
                      spacing: 5,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Price Details",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 6),
                        Row(
                          children: [
                            Text(
                              "Total MRP",
                              style: TextStyle(
                                color: Colors.grey.shade800,
                                fontSize: 14,
                              ),
                            ),
                            Expanded(child: SizedBox()),
                            Row(
                              children: [
                                Icon(
                                  Icons.currency_rupee,
                                  size: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                                Text(
                                  controller.originalMrp.value.toString(),
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Discount on MRP",
                              style: TextStyle(
                                color: Colors.grey.shade800,
                                fontSize: 14,
                              ),
                            ),
                            Expanded(child: SizedBox()),
                            Row(
                              children: [
                                Icon(
                                  Icons.currency_rupee,
                                  size: 12,
                                  color: Colors.green,
                                  fontWeight: FontWeight.w400,
                                ),
                                Text(
                                  controller.discountMrp.value.toString(),
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.green,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Delivery Charge",
                              style: TextStyle(
                                color: Colors.grey.shade800,
                                fontSize: 14,
                              ),
                            ),
                            Expanded(child: SizedBox()),
                            Text(
                              "FREE",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.green,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Divider(color: Colors.grey.shade300),
                        Row(
                          children: [
                            Text(
                              "Total Amount",
                              style: TextStyle(
                                color: Colors.grey.shade800,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Expanded(child: SizedBox()),
                            Row(
                              children: [
                                Icon(
                                  Icons.currency_rupee,
                                  size: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                                Text(
                                  controller.totalMrp.value.toString(),
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 45,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            child: Text("Proceed to Checkout"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      }),
    );
  }
}
