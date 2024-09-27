import 'package:get/get.dart';

class CategoryController extends GetxController {
  // Private reactive variables
  final RxString _category = ''.obs;
  final RxString _title = ''.obs;

  // Public getters to access the values
  String get categoryValue => _category.value;
  String get titleValue => _title.value;

  // Public setters to update the values
  set updateCategory(String value) {
    _category.value = value;
  }

  set updateTitle(String value) {
    _title.value = value;
  }
}
