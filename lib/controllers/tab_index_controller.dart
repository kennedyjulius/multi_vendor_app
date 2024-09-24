import 'package:get/get.dart';

class TabIndexController extends GetxController {
  // Define the reactive tab index variable
  final RxInt _tabIndex = 0.obs;

  // Getter for tabIndex
  int get tabIndex => _tabIndex.value;

  // Setter for tabIndex
  set tabIndex(int value) {
    _tabIndex.value = value;
  }

  // Setter method for updating tabIndex
  void setTabIndex(int newValue) {
    _tabIndex.value = newValue;
  }
}
