import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hpc_food/constants/constants.dart';
import 'package:hpc_food/models/api_error.dart';
import 'package:hpc_food/models/success_model.dart';
import 'package:http/http.dart' as http;

class RegistrationController extends GetxController {
  final box = GetStorage();
  final RxBool _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  set setLoading(bool newState) {
    _isLoading.value = newState;
  }

  void registrationFunction(String data) async {
    setLoading = true;

    Uri url = Uri.parse('$appBaseUrl/register');

    Map<String, String> headers = {'Content-Type': 'application/json'};

    try {
      var response = await http.post(url, headers: headers, body: data);

      if (response.statusCode == 201) {
        var data = successModelFromJson(response.body);

        setLoading = false;

        Get.snackbar('Đăng ký thành công', data.message,
            colorText: cLightWhite,
            backgroundColor: cTertiary,
            icon: const Icon(Ionicons.fast_food_outline));
      } else {
        var error = apiErrorFromJson(response.body);

        Get.snackbar('Có lỗi xảy ra', error.message,
            colorText: cLightWhite,
            backgroundColor: cRed,
            icon: const Icon(Icons.error_outline));
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}