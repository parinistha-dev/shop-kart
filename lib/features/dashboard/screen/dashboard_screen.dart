import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shop_kart/features/dashboard/controller/dashboard_controller.dart';
import 'package:shop_kart/features/dashboard/screen/account_screen.dart';
import 'package:shop_kart/features/dashboard/screen/categories_screen.dart';
import 'package:shop_kart/features/dashboard/screen/home_screen.dart';
import 'package:shop_kart/features/dashboard/screen/orders_screen.dart';
import 'package:shop_kart/features/dashboard/screen/wishlist_screen.dart';
import 'package:shop_kart/routes.dart';

class DashboardScreen extends GetWidget<DashboardController> {
  DashboardScreen({super.key});

  final screenList = [
    HomeScreen(),
    CategoriesScreen(),
    OrdersScreen(),
    WishlistScreen(),
    AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Padding(
          padding: EdgeInsets.only(left: 10),
          child: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              "assets/image/svg_img/img_drawer_icon.svg",
              color: Colors.grey.shade600,
            ),
          ),
        ),
        leadingWidth: 47,

        title: Image.asset(
          "assets/image/logo/img_logo.png",
          height: 100,
          width: 150,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              CupertinoIcons.search,
              color: Colors.grey.shade600,
              fontWeight: FontWeight.bold,
            ),
          ),
          Stack(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  CupertinoIcons.bell,
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Positioned(
                top: 0,
                right: 6,
                child: Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue,
                  ),
                  child: Center(
                    child: Text(
                      "16",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Stack(
              children: [
                IconButton(
                  onPressed: () {
                    Get.toNamed(AppRoutes.cartScreen);
                  },
                  icon: Icon(
                    CupertinoIcons.cart,
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                    ),
                    child: Center(
                      child: Text(
                        "16",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: PageView(
        controller: controller.pageController,
        physics: NeverScrollableScrollPhysics(),
        children: screenList,
      ),
      bottomNavigationBar: Container(
        height: 70,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(color: Colors.grey, blurRadius: 5, spreadRadius: 2),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            bottomIcon(
              unselectedIcon:
                  "assets/image/svg_img/bottom_navigation/unselected/un_home.svg",
              selectedIcon:
                  "assets/image/svg_img/bottom_navigation/selected/se_home.svg",
              title: "Home",
              index: 0,
            ),
            bottomIcon(
              unselectedIcon:
                  "assets/image/svg_img/bottom_navigation/unselected/un_categories.svg",
              selectedIcon:
                  "assets/image/svg_img/bottom_navigation/selected/se_categories.svg",
              title: "Category",
              index: 1,
            ),
            bottomIcon(
              unselectedIcon:
                  "assets/image/svg_img/bottom_navigation/unselected/un_order.svg",
              selectedIcon:
                  "assets/image/svg_img/bottom_navigation/selected/se_order.svg",
              title: "Order",
              index: 2,
            ),
            bottomIcon(
              unselectedIcon:
                  "assets/image/svg_img/bottom_navigation/unselected/un_wishlist.svg",
              selectedIcon:
                  "assets/image/svg_img/bottom_navigation/selected/se_wishlist.svg",
              title: "Wishlist",
              index: 3,
            ),
            bottomIcon(
              unselectedIcon:
                  "assets/image/svg_img/bottom_navigation/unselected/un_account.svg",
              selectedIcon:
                  "assets/image/svg_img/bottom_navigation/selected/se_account.svg",
              title: "Account",
              index: 4,
            ),
          ],
        ),
      ),
    );
  }

  Widget bottomIcon({
    required String unselectedIcon,
    required String selectedIcon,
    required String title,
    required int index,
  }) {
    return Obx(
      () => InkWell(
        onTap: (){
          controller.changePage(index);
        },
        child: Column(
          children: [
            SizedBox(height: 5),
            SvgPicture.asset(
              index == controller.currentIndex.value
                  ? selectedIcon
                  : unselectedIcon,
              height: 28,
              width: 28,
              colorFilter: index == controller.currentIndex.value
                  ? ColorFilter.mode(Colors.blue.shade800, BlendMode.srcIn)
                  : ColorFilter.mode(Colors.grey.shade500, BlendMode.srcIn),
            ),
            Text(
              title,
              style: TextStyle(
                color: index == controller.currentIndex.value
                    ? Colors.blue.shade800
                    : Colors.grey.shade500,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
