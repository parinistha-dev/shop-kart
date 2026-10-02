import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_kart/features/realtime_database/controller/realtime_database_controller.dart';

class RealtimeDatabaseScreen extends GetWidget<RealtimeDatabaseController> {
  const RealtimeDatabaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
        onPressed: () {
          showDialog();
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Contact List",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.blue.shade500,
          ),
        ),
        centerTitle: true,
      ),
      body: Obx(
        () => Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: ListView.builder(
            itemCount: controller.contactList.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              var data = controller.contactList[index];
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                margin: EdgeInsets.only(
                  bottom: 20,
                  left: 10,
                  right: 10,
                  top: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.shade400,
                      blurStyle: BlurStyle.outer,
                      blurRadius: 2,
                    ),
                  ],
                ),
                child: Column(
                  spacing: 10,
                  children: [
                    Row(
                      spacing: 20,
                      children: [
                        Text(
                          "Name : ",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          data.name,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey.shade500,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      spacing: 20,
                      children: [
                        Text(
                          "Email : ",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          data.email,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey.shade500,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void showDialog() {
    Get.dialog(
      Dialog(
        child: Container(
          height: 250,
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: controller.nameController,
                decoration: InputDecoration(hint: Text("Enter your name")),
              ),
              TextFormField(
                controller: controller.emailController,
                decoration: InputDecoration(hint: Text("Enter your email")),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  controller.saveData();
                  controller.emailController.clear();
                  controller.nameController.clear();
                  Get.back();
                },
                child: Text("Save"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
