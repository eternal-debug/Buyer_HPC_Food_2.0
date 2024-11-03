import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hpc_food/constants/constants.dart';
import 'package:hpc_food/models/api_error.dart';
import 'package:hpc_food/models/foods_model.dart';
import 'package:hpc_food/models/hook_models/hook_result.dart';
import 'package:http/http.dart' as http;

FetchHook useFetchAllFoods() {
  final foods = useState<List<FoodsModel>?>(null);
  final isLoading = useState<bool>(false);
  final error = useState<Exception?>(null);
  final apiError = useState<ApiError?>(null);
  bool isDisposed = false;

  Future<void> fetchData() async {
    isLoading.value = true;
    try {
      final response = await http.get(Uri.parse('$appBaseUrl/api/foods/all'));
      if (response.statusCode == 200) {
        final parsedData = foodsModelFromJson(response.body);
        if (!isDisposed) {
          foods.value = parsedData;
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

  return FetchHook(
    data: foods.value,
    isLoading: isLoading.value,
    error: error.value,
    refetch: refetch,
  );
}
