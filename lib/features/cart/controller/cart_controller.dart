import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:shop_kart/core/network/api_services.dart';
import 'package:shop_kart/features/cart/model/cart_model.dart';

class CartController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAllCartItem();
  }

  final _api = Get.find<ApiServices>();

  final cartList = <CartModel>[].obs;

  final RxBool isLoading = true.obs;

  RxInt totalMrp = 0.obs;
  RxInt originalMrp = 0.obs;
  RxInt discountMrp = 0.obs;

  void calculatePrice(){
    var tempTotalMrp = 0;
    var tempTotalOriginalMrp = 0;
    for(var i in cartList){
      var price = (i.productId?.sellingPrice ?? 0) * (i.quantity.value);
      var originalPrice = (i.productId?.originalPrice ?? 0) * (i.quantity.value);
      tempTotalMrp = tempTotalMrp + price;
      tempTotalOriginalMrp = tempTotalOriginalMrp + originalPrice;
    }
    totalMrp.value = tempTotalMrp;
    originalMrp.value = tempTotalOriginalMrp;
    discountMrp.value = tempTotalOriginalMrp - tempTotalMrp;
  }

  Future<void> getAllCartItem() async {
    try {
      final response = await _api.callGetApi("web/cart/all");
      log("cart response : $response");

      if (response.isNotEmpty) {
        var data = jsonDecode(response);
        log("cart data : $data");
        if (data['data'] is List) {
          var apiList = data['data'] as List;
          log("api list : $apiList");
          cartList.assignAll(apiList.map((e) => CartModel.fromJson(e)));
          log("cart list : $cartList");
          log(cartList.length.toString());
        }
        calculatePrice();
      }
    } catch (e, stk) {
      log(e.toString());
      log(stk.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> updateCart(String id, String operation, int index) async {
    var request = {"productId": id, "action": operation};
    final response = await _api.callPatchApi(
      "cart/quantity",
      request: request,
    );
    var data = jsonDecode(response);
    log(data.toString());

    var updatedQuantity =
    data['data']['items'][index]['quantity'];

    cartList[index]
        .quantity
        .value = updatedQuantity;

    calculatePrice();

    cartList.refresh();

  }

  Future<void> deleteEachItem(String id, int index) async {

    try {
      var response = await _api.callDeleteApi("cart/delete/$id");

      log("delete response : $response");

      if(response.isNotEmpty){

            cartList.removeAt(index);

            cartList.refresh();

          }
    } catch (e, stk) {
      log(e.toString());
      log(stk.toString());
    }
  }
}
