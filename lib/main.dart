import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_kart/routes.dart';
import 'package:shop_kart/services/notification_services.dart';

import 'core/network/api_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(ApiServices());
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      onInit: () async {
        await FirebaseNotificationService.instance.initialize();
      },

      initialRoute: AppRoutes.splashScreen,
      getPages: AppRoutes.getPages,
    );
  }
}
