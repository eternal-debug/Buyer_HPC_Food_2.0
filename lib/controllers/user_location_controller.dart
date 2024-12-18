// ignore_for_file: prefer_final_fields

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hpc_food/common/show_custom_toast.dart';
import 'package:hpc_food/constants/constants.dart';
import 'package:hpc_food/models/api_error.dart';
import 'package:hpc_food/views/entrypoint.dart';
import 'package:http/http.dart' as http;

class UserLocationController extends GetxController {
  RxBool _isDefault = false.obs;

  bool get isDefault => _isDefault.value;

  set setIsDefault(bool value) {
    _isDefault.value = value;
  }

  RxInt _tabIndex = 0.obs;

  int get tabIndex => _tabIndex.value;

  set setTabIndex(int value) {
    _tabIndex.value = value;
  }

  LatLng position = const LatLng(0, 0);

  void setPosition(LatLng value) {
    value = position;
    update();
  }

  RxString _address = ''.obs;

  String get address => _address.value;

  set setAddress(String value) {
    _address.value = value;
  }

  RxString _address1 = ''.obs;

  String get address1 => _address1.value;

  set setAddress1(String value) {
    _address1.value = value;
  }

  void getUserAddress(LatLng posistion) async {
    final url = Uri.parse(
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=${posistion.latitude},${posistion.longitude}&key=$googleApiKey');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);

      final address = responseBody['results'][0]['formatted_address'];
      setAddress = address;
    }
  }

  void addAddress(String data) async {
    final box = GetStorage();
    String accessToken = box.read('token');

    Uri url = Uri.parse('$appBaseUrl/api/address');

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };

    try {
      var response = await http.post(url, headers: headers, body: data);

      if (response.statusCode == 201) {
        showCustomToast(Get.overlayContext!, null, 'Thêm địa chỉ thành công');

        Get.offAll(() => MainScreen());
      } else {
        var error = apiErrorFromJson(response.body);
        showCustomToast(Get.overlayContext!, cRed, 'Thêm địa chỉ thất bại');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
