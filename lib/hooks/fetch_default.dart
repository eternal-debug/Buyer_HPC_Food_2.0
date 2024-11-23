import 'dart:convert';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hpc_food/constants/constants.dart';
import 'package:hpc_food/controllers/user_location_controller.dart';
import 'package:hpc_food/models/addresses_response.dart';
import 'package:hpc_food/models/api_error.dart';
import 'package:hpc_food/models/hook_models/hook_result.dart';
import 'package:http/http.dart' as http;

FetchHook useFetchDefault() {
  final controller = Get.put(UserLocationController());
  final box = GetStorage();
  final addresses = useState<AddressResponse?>(null);
  final isLoading = useState<bool>(false);
  final error = useState<Exception?>(null);
  final apiError = useState<ApiError?>(null);
  bool isDisposed = false;

  Future<void> fetchData() async {
    String? accessToken = box.read('token');

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };
    isLoading.value = true;

    try {
      Uri url = Uri.parse('$appBaseUrl/api/address/default');
      final response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        if (!isDisposed) {
          var data = response.body;
          var decoded = jsonDecode(data);
          addresses.value = AddressResponse.fromJson(decoded);
          controller.setAddress1 = addresses.value!.addressLine1;
        }
      } else {
        if (!isDisposed) {
          apiError.value = apiErrorFromJson(response.body);
        }
      }
    } catch (e) {
      error.value = e as Exception;
    } finally {
      if (!isDisposed) {
        isLoading.value = false;
      }
    }
  }

  useEffect(() {
    fetchData();

    return () {
      isDisposed = true;
    };
  }, []);

  void refetch() {
    if (!isDisposed) {
      isLoading.value = true;
      fetchData();
    }
  }

  return FetchHook(
    data: addresses.value,
    isLoading: isLoading.value,
    error: error.value,
    refetch: refetch,
  );
}
