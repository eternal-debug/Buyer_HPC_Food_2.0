import 'package:flutter/material.dart';
import 'package:hpc_food/constants/constants.dart';
import 'package:hpc_food/models/api_error.dart';
import 'package:hpc_food/models/categories_model.dart';
import 'package:hpc_food/models/hook_models/hook_result.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:http/http.dart' as http;

FetchHook useFetchAllCategories() {
  final categoriesItem = useState<List<CategoriesModel>?>(null);
  final isLoading = useState<bool>(false);
  final error = useState<Exception?>(null);
  final apiError = useState<ApiError?>(null);
  bool isDisposed = false;

  Future<void> fetchData() async {
    isLoading.value = true;
    try {
      final response = await http.get(Uri.parse('$appBaseUrl/api/category'));
      if (response.statusCode == 200) {
        final parsedData = categoriesModelFromJson(response.body);
        if (!isDisposed) {
          categoriesItem.value = parsedData;
        }
      } else {
        if (!isDisposed) {
          apiError.value = apiErrorFromJson(response.body);
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
