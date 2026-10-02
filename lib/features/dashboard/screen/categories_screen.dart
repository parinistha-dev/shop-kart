import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_kart/features/dashboard/controller/dashboard_controller.dart';

class CategoriesScreen extends GetWidget<DashboardController> {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width*0.3,
            child: Column(
              children: [
                ListView.separated(
                  itemCount: controller.categoryList.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    var data = controller.categoryList[index];
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10,
                      ),
                      child: Row(
                        spacing: 5,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.network(
                              data.image.toString(),
                              height: 25,
                              width: 25,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Text(data.name.toString()),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(color: Colors.grey.shade300);
                  },
                ),
              ],
            ),
          ),

          SizedBox(
            width: MediaQuery.of(context).size.width*0.7,
            child: Column(
              children: [
                Text(
                  "Popular Category",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 20,),
                GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.4
                  ),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: controller.categoryList.length,
                  itemBuilder: (context, index) {
                    var data = controller.categoryList[index];
                    return Column(
                      spacing: 5,
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
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
