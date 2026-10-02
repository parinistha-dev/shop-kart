import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shop_kart/features/dashboard/data/mode/category_model.dart';
import 'package:shop_kart/features/dashboard/data/mode/order_model.dart';
import 'package:shop_kart/features/dashboard/data/mode/product_model.dart';
import 'package:shop_kart/features/dashboard/data/mode/wishlist_model.dart';

import '../../../core/network/api_services.dart';

class DashboardController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    addProductList();
    addCategoryList();
    getWishlist();
  }

  RxInt currentIndex = 0.obs;
  PageController pageController = PageController();

  final _api = Get.find<ApiServices>();

  final List<String> imgList = [
    "assets/image/banner/b1.jpeg",
    "assets/image/banner/b2.jpeg",
    "assets/image/banner/b3.jpeg",
    "assets/image/banner/b4.jpeg",
  ];

  var productList = <ProductModel>[].obs;
  var categoryList = <CategoryModel>[].obs;
  var wishListList = <WishlistModel>[].obs;
  var orderList = <OrderModel>{}.obs;

  RxBool isLoading = false.obs;

  Future<void> addProductList() async {
    try {
      isLoading.value = true;
      final response = await _api.callGetApi("admin/product/all");

      if (response.isNotEmpty) {
        var data = jsonDecode(response);
        if (data['data'] is List) {
          var apiList = data['data'] as List;
          productList.assignAll(apiList.map((e) => ProductModel.fromJson(e)));
          log(productList.length.toString());
        }
      }
    } catch (e, stk) {
      log("$e $stk");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> addCategoryList() async {
    final response = await _api.callGetApi("admin/category/all");

    if (response.isNotEmpty) {
      var data = jsonDecode(response);
      if (data['data'] is List) {
        var apiList = data['data'] as List;
        categoryList.assignAll(apiList.map((e) => CategoryModel.fromJson(e)));
      }
    }
  }

  void changePage(int index) {
    currentIndex.value = index;

    pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  Future<void> getWishlist() async {
    try {
      final response = await _api.callGetApi("web/wishlist/all");
      log(" wishlist response : $response");

      if (response.isNotEmpty) {
            var data = jsonDecode(response);
            if (data["data"] is List) {
              var apiList = data["data"] as List;
              wishListList.assignAll(apiList.map((e) => WishlistModel.fromJson(e)));
            }
          }
    } catch (e , stk) {
      log(e.toString());
      log(stk.toString());
    }
  }

}
