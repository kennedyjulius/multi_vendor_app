import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:multi_vendor_app/constants/constants.dart';
import 'package:multi_vendor_app/models/api_error.dart';
import 'package:multi_vendor_app/models/hook_models/hook_result.dart';
import 'package:http/http.dart' as http;
import 'package:multi_vendor_app/models/restaurant_model.dart';

FetchHook useFetchAllRestaurants(String code) {
  final restaurants = useState(RestaurantsModel);
  final isLoading = useState<bool>(false);
  final error = useState<Exception?>(null);
  final apiError = useState<ApiError?>(null);

  Future<void> fetchData() async {
    isLoading.value = true;

    try {
      Uri url = Uri.parse('$appBaseUrl/api/restaurant/all/$code');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        restaurants.value = restaurantsModelFromJson(response.body) as Type;
      } else {
        apiError.value = apiErrorFromJson(response.body);
      }
    } catch (e) {
      error.value = e is Exception ? e : Exception('Unknown error');
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
    refetch: refetch,
    
  );
}
