import 'package:hpc_food/constants/constants.dart';
import 'package:hpc_food/model/api_error.dart';
import 'package:hpc_food/model/hook_models/hook_result.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hpc_food/model/restaurants_model.dart';
import 'package:http/http.dart' as http;

FetchHook useFetchAllRestaurant() {
  final restaurants = useState<List<RestaurantsModel>?>(null);
  final isLoading = useState<bool>(false);
  final error = useState<Exception?>(null);
  final apiError = useState<ApiError?>(null);

  Future<void> fetchData() async {
    isLoading.value = true;
    try {
      final response =
          await http.get(Uri.parse('$appBaseUrl/api/restaurants/all'));
      if (response.statusCode == 200) {
        restaurants.value = restaurantsModelFromJson(response.body);
      } else if (response.statusCode >= 400 && response.statusCode < 600) {
        apiError.value = apiErrorFromJson(response.body);
      } else {
        error.value = Exception(response.statusCode);
      }
    } catch (e) {
      error.value = e is Exception ? e : Exception(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  useEffect(() {
    fetchData();
    return null;
  }, []);

  void refetch() {
    isLoading.value = true;
    fetchData();
  }

  return FetchHook(
    data: restaurants.value,
    isLoading: isLoading.value,
    error: error.value,
    refresh: refetch,
  );
}
