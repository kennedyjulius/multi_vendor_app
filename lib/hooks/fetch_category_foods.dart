import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:multi_vendor_app/constants/constants.dart';
import 'package:multi_vendor_app/controllers/category_controller.dart';
import 'package:multi_vendor_app/models/api_error.dart';
import 'package:multi_vendor_app/models/food.dart';
import 'package:multi_vendor_app/models/hook_models/hook_result.dart';
import 'package:http/http.dart' as http;

FetchHook useFetchFoodsByCategory(String code) {
  final controller = Get.put(CategoryController());
  final foods = useState<List<FoodsModel>?>(null);
  final isLoading = useState<bool>(false);
  final error = useState<Exception?>(null);
  final apiError = useState<ApiError?>(null);

  Future<void> fetchData() async {
    isLoading.value = true;

    try {
      Uri url = Uri.parse('$appBaseUrl/api/foods/${controller.categoryValue}/$code');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        foods.value = foodsModelFromJson(response.body);
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
    Future.delayed(const Duration(seconds: 3));
    fetchData();
    return null;
  }, []);

  void refetch() {
    isLoading.value = true;
    fetchData();
  }

  return FetchHook(
    data: foods.value,
    isLoading: isLoading.value,
    error: error.value,
    refetch: refetch, 
    
    
  );
}
