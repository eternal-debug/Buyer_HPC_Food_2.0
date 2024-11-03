// ignore_for_file: prefer_final_fields

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hpc_food/common/show_custom_toast.dart';
import 'package:hpc_food/constants/constants.dart';
import 'package:hpc_food/models/api_error.dart';
import 'package:hpc_food/models/login_response.dart';
import 'package:http/http.dart' as http;

class PhoneVerificationController extends GetxController {
  final box = GetStorage();

  String _phone = '';

  String get phone => _phone;

  set setPhoneNumber(String value) {
    _phone = value;
  }

  RxBool _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  set setLoading(bool value) {
    _isLoading.value = value;
  }

  void verifyPhone() async {
    setLoading = true;
    String accessToken = box.read('token');

    Uri url = Uri.parse('$appBaseUrl/api/users/verify_phone/$phone');

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };

    try {
      var response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        LoginResponse data = loginResponseFromJson(response.body);

        String userId = data.id;
        String userData = jsonEncode(data);

        box.write(userId, userData);
        box.write('token', data.userToken);
        box.write('userId', data.id);
        box.write('verification', data.verification);

        setLoading = false;
        showCustomToast(Get.overlayContext!, null, 'Xác minh thành công');

        Get.back();
      } else {
        var error = apiErrorFromJson(response.body);
        showCustomToast(Get.overlayContext!, cRed, error.message);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
