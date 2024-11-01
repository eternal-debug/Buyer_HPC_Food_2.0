import 'package:flutter/material.dart';
import 'package:hpc_food/constants/constants.dart';
import 'package:hpc_food/models/api_error.dart';
import 'package:hpc_food/models/categories_model.dart';
import 'package:hpc_food/models/hook_models/hook_result.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:http/http.dart' as http;

FetchHook useFetchCategories() {
  final categoriesItem = useState<List<CategoriesModel>?>(null);
  final isLoading = useState<bool>(false);
  final error = useState<Exception?>(null);
  final apiError = useState<ApiError?>(null);
  bool isDisposed = false;

  Future<void> fetchData() async {
    isLoading.value = true;
    try {
      final response =
          await http.get(Uri.parse('$appBaseUrl/api/category/random'));
      if (response.statusCode == 200) {
        if (!isDisposed) {
          categoriesItem.value = categoriesModelFromJson(response.body);
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
    data: categoriesItem.value,
    isLoading: isLoading.value,
    error: error.value,
    refresh: refetch,
  );
}
