import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hpc_food/constants/constants.dart';
import 'package:hpc_food/model/api_error.dart';
import 'package:hpc_food/model/foods_model.dart';
import 'package:hpc_food/model/hook_models/foods_hook.dart';
import 'package:http/http.dart' as http;

FetchFoods useFetchFoods() {
  final foods = useState<List<FoodsModel>>([]);
  final isLoading = useState<bool>(false);
  final error = useState<Exception?>(null);
  final apiError = useState<ApiError?>(null);

  Future<void> fetchData() async {
    isLoading.value = true;
    try {
      final response = await http.get(
        Uri.parse('$appBaseUrl/api/foods/all-by-time'),
      );

      if (response.statusCode == 200) {
        foods.value = foodsModelFromJson(response.body);
      }
    } catch (e) {
      error.value = e is Exception ? e : Exception(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  useEffect(() {
    Future.delayed(const Duration(seconds: 3));
    fetchData();

    return null;
  }, []);

  void refetch() {
    isLoading.value = true;
    fetchData();
  }

  return FetchFoods(
    data: foods.value,
    isLoading: isLoading.value,
    error: error.value,
    refetch: refetch,
  );
}
