import 'dart:developer';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RealtimeDatabaseController extends GetxController {
  @override
  void onInit() {
    readData();
    super.onInit();
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  var contactList = <ContactModel>[].obs;

  void saveData() {
    DatabaseReference ref = FirebaseDatabase.instance.ref();

    log("${ref.path}");

    ref.push().set({
      "name": nameController.text,
      "email": emailController.text,
    });
  }

  void readData() {
    DatabaseReference ref = FirebaseDatabase.instance.ref();

    ref.onValue.listen((event) {
      var snapshot = event.snapshot;
      if (snapshot.exists) {
        var children = snapshot.children;
        contactList.clear();
        for (var item in children) {
          var key = item.key;
          var value = item.value as Map;
          var model = ContactModel(
            key: key ?? "",
            name: value["name"] ?? "",
            email: value["email"] ?? "",
          );
          contactList.add(model);
        }

        log("contactList length : ${contactList.length}");
      }
    });
  }
}

class ContactModel {
  String key;
  String name;
  String email;

  ContactModel({required this.key, required this.name, required this.email});
}
