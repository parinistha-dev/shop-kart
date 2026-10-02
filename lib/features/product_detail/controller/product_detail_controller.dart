import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:shop_kart/core/network/api_services.dart';
import 'package:shop_kart/features/product_detail/model/product_detail_model.dart';

class ProductDetailController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getProductDetails();
  }

  final id = Get.arguments;
  late final _api = Get.find<ApiServices>();

  var apiList = Rxn<ProductDetailModel>();

  RxBool isWishlistLoading = false.obs;
  RxBool isAddedWishlist = false.obs;

  RxInt itemCount = 1.obs;
  RxBool isAddedCart = false.obs;

  Future<void> getProductDetails() async {
    var response = await _api.callGetApi("admin/product/$id");

    if (response.isNotEmpty) {
      var data = jsonDecode(response) as Map;
      var list = data['data'];
      apiList.value = ProductDetailModel.fromJson(list);
    }
  }

  Future<String> addToCart() async {
    var request = {
      "productId": Get.arguments,
      "quantity": itemCount.value.toString(),
    };
    var response = await _api.callPostApi("cart/add", request: request);
    isAddedCart.value = true;
    return response;
  }

  Future<void> addWishList() async {
    try {
      var request = {"productId": id};

      await _api.callPostApi("wishlist/add", request: request);



    } catch (e, stk) {
      log(e.toString());
      log(stk.toString());
    } finally {
      isAddedWishlist.value = true;
    }
  }

  Future<void> deleteWishlist() async {
    try {
      await _api.callDeleteApi("wishlist/delete/$id");
    } catch (e, stk) {
      log(e.toString());
      log(stk.toString());
    }finally{
      isAddedWishlist.value = false;
    }
  }
}
