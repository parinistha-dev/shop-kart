import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_kart/features/dashboard/controller/dashboard_controller.dart';
import 'package:shop_kart/routes.dart';

class HomeScreen extends GetWidget<DashboardController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        return SingleChildScrollView(
          child: Column(
            children: [
              CarouselSlider(
                items: [
                  sliderImg(path: controller.imgList[0]),
                  sliderImg(path: controller.imgList[1]),
                  sliderImg(path: controller.imgList[2]),
                  sliderImg(path: controller.imgList[3]),
                ],
                options: CarouselOptions(
                  height: 200,
                  autoPlay: true,
                  scrollDirection: Axis.horizontal,
                  autoPlayAnimationDuration: Duration(seconds: 2),
                  autoPlayInterval: Duration(seconds: 5),
                  autoPlayCurve: Curves.easeInOut,
                  viewportFraction: 1,
                ),
              ),
              SizedBox(height: 10),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
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
                child: SizedBox(
                  height: 70,
                  width: MediaQuery.of(context).size.width * 0.95,
                  child: ListView.builder(
                    itemCount: controller.categoryList.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      var data = controller.categoryList[index];
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.network(
                                data.image.toString(),
                                height: 50,
                                width: 50,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Text(data.name.toString()),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.6,
                  ),
                  itemCount: controller.productList.length,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var data = controller.productList[index];
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
                        onTap: () {
                          Get.toNamed(
                            AppRoutes.productDetailScreen,
                            arguments: data.sId,
                          );
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Image.network(
                                data.images?.first ?? "",
                                fit: BoxFit.fill,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              data.name.toString().toUpperCase(),
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
                                  data.sellingPrice.toString(),
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
                                  data.originalPrice.toString(),
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
          ),
        );
      }),
    );
  }

  Widget sliderImg({required String path}) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(path, fit: BoxFit.fill, height: 200),
      ),
    );
  }

  Widget categoryList({
    required String iconPath,
    required Color bgColor,
    required Color fgColor,
    required String title,
  }) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          height: 45,
          width: 45,
          decoration: BoxDecoration(shape: BoxShape.circle, color: bgColor),
          child: Image.network(iconPath),
        ),
        SizedBox(height: 3),
        Text(
          title,
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
