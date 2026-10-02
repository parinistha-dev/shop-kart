import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as api;
import 'package:shared_preferences/shared_preferences.dart';

class ApiServices extends GetxService {
  var apiBaseUrl = "ecommerce-api.finzopay.online";

  Future<String> getToken() async {
    final sharedPreference = await SharedPreferences.getInstance();
    return sharedPreference.getString("token") ?? "";
  }

  Future<String> callPostApi(
    String endPoints, {
    Map<String, dynamic>? request,
  }) async {
    var url = Uri.https(apiBaseUrl, "/api/web/$endPoints");
    log("${url}");

    var token = await getToken();

    var headers = {"Authorization": "Bearer $token"};

    final response = await api.post(url, body: request, headers: headers);
    log(response.body);

    if (response.statusCode == 200) {
      return response.body;
    }
    /*else{
      var res = jsonDecode(response.body);
    }*/
    if (response.statusCode == 400) {
      return response.body;
      /*Get.snackbar("Error!!", res['message'] ?? " Something went wrong");*/
    }
    return "";
  }

  Future<String> callGetApi(String endPoints) async {
    var url = Uri.https(apiBaseUrl, "/api/$endPoints");

    var token = await getToken();
    log("token : $token");

    var headers = {"Authorization": "Bearer $token"};

    log("TOKEN => [$token]");
    log("HEADERS => $headers");

    final response = await api.get(url, headers: headers);
    log(response.body);

    return response.body;
  }

  Future<String> callPatchApi(
    String endPoints, {
    Map<String, dynamic>? request,
  }) async {
    var url = Uri.https(apiBaseUrl, "/api/web/$endPoints");
    log("${url}");

    var token = await getToken();

    var headers = {"Authorization": "Bearer $token"};

    final response = await api.patch(url, body: request, headers: headers);
    return response.body;
  }

  Future<String> callDeleteApi(String endPoints) async {
    var url = Uri.https(apiBaseUrl, "/api/web/$endPoints");

    log(url.toString());

    var token = await getToken();

    var headers = {"Authorization": "Bearer $token"};

    final response = await api.delete(url, headers: headers);

    var data = response.body;

    log("delete api response : $data");

    if (response.statusCode == 200) {
      return response.body;
    }
    return "";
  }
}
