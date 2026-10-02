import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_kart/features/dashboard/controller/dashboard_controller.dart';

class OrdersScreen extends GetWidget<DashboardController> {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade200,
                  blurStyle: BlurStyle.outer,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Order ID : ",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                      ),
                    ),
                    Text("abc123", style: TextStyle(color: Colors.grey.shade600, fontSize: 16),),
                  ],
                ),
                Row(
                  children: [
                    Image.asset(
                      "assets/illustration/illust_empty_cart.png",
                      height: 120,
                      width: 120,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("T shirt ", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),),
                        Row(children: [
                          Icon(Icons.currency_rupee, size: 18,color: Colors.blue,),
                          Text("1000", style: TextStyle(color: Colors.blue, fontSize: 18),),
                        ],),
                        Row(children: [
                          Text("Qty : ", style: TextStyle(color: Colors.grey.shade600, fontSize: 16),),
                          Text("2", style: TextStyle(color: Colors.grey.shade600, fontSize: 16),)
                        ],)
                      ],
                    )
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
