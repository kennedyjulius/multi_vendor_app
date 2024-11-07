import 'package:get/get.dart';
import 'package:multi_vendor_app/constants/constants.dart';
import 'package:multi_vendor_app/models/api_error.dart';
import 'package:multi_vendor_app/models/food.dart';
import 'package:http/http.dart' as http;

class SearchFoodController extends GetxController {
  final RxBool _isLoading = false.obs;

  // Expose the loading state
  bool get isLoading => _isLoading.value;

  // Update loading state
  void setLoading(bool value) {
    _isLoading.value = value;
  }

    final RxBool _isTriggered = false.obs;

  // Expose the loading state
  bool get isTriggered => _isTriggered.value;

  // Update loading state
  void setTriggered(bool value) {
    _isLoading.value = value;
  }

  List<FoodsModel>? searchResults;

  Future<void> searchFoods(String key) async {
    setLoading(true); // Call the method correctly

    Uri url = Uri.parse("$appBaseUrl/api/foods/search/$key");

    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        searchResults = foodsModelFromJson(response.body);
      } else {
        var error = apiErrorFromJson(response.body);
        // Optionally handle the error
      }
    } catch (e) {
      print(e);
      // Handle exceptions
    } finally {
      setLoading(false); // Reset loading state after completion
    }
  }
}
