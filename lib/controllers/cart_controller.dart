import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hpc_food/common/show_custom_toast.dart';
import 'package:hpc_food/constants/constants.dart';
import 'package:hpc_food/models/api_error.dart';
import 'package:http/http.dart' as http;

class CartController extends GetxController {
  final box = GetStorage();
  final RxBool _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  set setLoading(bool value) {
    _isLoading.value = value;
  }

  void addToCart(String cart) async {
    setLoading = true;

    String accessToken = box.read('token');

    var url = Uri.parse("$appBaseUrl/api/cart");

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };

    try {
      var response = await http.post(url, headers: headers, body: cart);

      if (response.statusCode == 201 || response.statusCode == 200) {
        setLoading = false;
        showCustomToast(Get.overlayContext!, null, 'Đã thêm vào giỏ hàng');
      } else {
        var error = apiErrorFromJson(response.body);
        showCustomToast(Get.overlayContext!, cRed, error.message);
      }
    } catch (e) {
      showCustomToast(Get.overlayContext!, cRed, 'Lỗi khi thêm vào giỏ hàng');
    } finally {
      setLoading = false;
    }
  }

  void removeFrom(String productId, Function refetch) async {
    setLoading = true;

    String accessToken = box.read('token');

    var url = Uri.parse('$appBaseUrl/api/cart/$productId');

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };

    try {
      var response = await http.delete(url, headers: headers);

      if (response.statusCode == 200) {
        setLoading = false;
        refetch();
        showCustomToast(
            Get.overlayContext!, null, 'Xóa khỏi giỏ hàng thành công');
      } else {
        var error = apiErrorFromJson(response.body);
        showCustomToast(Get.overlayContext!, cRed, error.message);
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      setLoading = false;
    }
  }
}
