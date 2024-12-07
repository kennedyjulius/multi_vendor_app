import 'package:get/get.dart';

class PasswordController extends GetxController {
  final RxBool _password = false.obs;

  // Getter for password visibility
  bool get password => _password.value;

  // Setter to update password visibility
  set password(bool newState) {
    _password.value = newState;
  }
}
