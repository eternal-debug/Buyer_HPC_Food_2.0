import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hpc_food/constants/constants.dart';
import 'package:hpc_food/models/api_error.dart';
import 'package:hpc_food/models/hook_models/restaurant_hook.dart';
import 'package:hpc_food/models/restaurants_model.dart';
import 'package:http/http.dart' as http;

FetchRestaurant useFetchRestaurantsById(String id) {
  final restaurants = useState<RestaurantsModel?>(null);
  final isLoading = useState<bool>(false);
  final error = useState<Exception?>(null);
  final apiError = useState<ApiError?>(null);
  bool isDisposed = false;

  Future<void> fetchData() async {
    isLoading.value = true;
    try {
      final response =
          await http.get(Uri.parse('$appBaseUrl/api/restaurants/byId/$id'));
      if (response.statusCode == 200) {
        final restaurant = jsonDecode(response.body);
        if (!isDisposed) {
          restaurants.value = RestaurantsModel.fromJson(restaurant);
        }
      } else if (response.statusCode >= 400 && response.statusCode < 600) {
        if (!isDisposed) {
          apiError.value = apiErrorFromJson(response.body);
        }
      } else {
        if (!isDisposed) {
          error.value = Exception(response.statusCode);
        }
      }
    } catch (e) {
      debugPrint(e.toString());
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

  return FetchRestaurant(
    data: restaurants.value,
    isLoading: isLoading.value,
    error: error.value,
    refetch: refetch,
  );
}
