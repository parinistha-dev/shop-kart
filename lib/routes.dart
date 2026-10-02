import 'package:get/get.dart';
import 'package:shop_kart/features/auth/binding/auth_binding.dart';
import 'package:shop_kart/features/cart/binding/cart_binding.dart';
import 'package:shop_kart/features/cart/screen/cart_screen.dart';
import 'package:shop_kart/features/dashboard/binding/dashboard_binding.dart';
import 'package:shop_kart/features/dashboard/screen/home_screen.dart';
import 'package:shop_kart/features/product_detail/binding/product_detail_binding.dart';
import 'package:shop_kart/features/product_detail/screen/product_detail_screen.dart';
import 'package:shop_kart/features/realtime_database/binding/realtime_database_binding.dart';
import 'package:shop_kart/features/realtime_database/screen/realtime_database_screen.dart';
import 'package:shop_kart/features/splash/binding/splash_binding.dart';
import 'package:shop_kart/features/auth/screen/login_screen.dart';
import 'package:shop_kart/features/auth/screen/otp_verification_screen.dart';
import 'package:shop_kart/features/auth/screen/signup_screen.dart';
import 'package:shop_kart/features/dashboard/screen/dashboard_screen.dart';
import 'package:shop_kart/features/profile_update/binding/profile_update_binding.dart';
import 'package:shop_kart/features/profile_update/screen/profile_update_screen.dart';

import 'features/splash/screen/splash_screen.dart';

class AppRoutes {
  static const String splashScreen = '/splashScreen';
  static const String loginScreen = '/loginScreen';
  static const String signupScreen = '/signScreen';
  static const String otpScreen = '/otpScreen';
  static const String dashboardScreen = '/dashboardScreen';
  static const String profileUpdateScreen = '/profileUpdateScreen';
  static const String homeScreen = '/homeScreen';
  static const String productDetailScreen = '/productDetailScreen';
  static const String cartScreen = '/cartScreen';
  static const String rDatabaseScreen = '/rDatabaseScreen';

  static List<GetPage> getPages = [
    GetPage(
      name: splashScreen,
      page: () => SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: loginScreen,
      page: () => LoginScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: signupScreen,
      page: () => SignupScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: otpScreen,
      page: () => OtpVerificationScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: dashboardScreen,
      page: () => DashboardScreen(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: profileUpdateScreen,
      page: () => ProfileUpdateScreen(),
      binding: ProfileUpdateBinding(),
    ),
    GetPage(
      name: homeScreen,
      page: () => HomeScreen(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: productDetailScreen,
      page: () => ProductDetailScreen(),
      binding: ProductDetailBinding(),
    ),
    GetPage(
      name: cartScreen,
      page: () => CartScreen(),
      binding: CartBinding(),
    ),
    GetPage(
      name: rDatabaseScreen,
      page: () => RealtimeDatabaseScreen(),
      binding:  RealtimeDatabaseBinding()
    ),
  ];

}
