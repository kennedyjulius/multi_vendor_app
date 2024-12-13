import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:multi_vendor_app/auth/login_page.dart';
import 'package:multi_vendor_app/auth/verification_page.dart';
import 'package:multi_vendor_app/constants/constants.dart';
import 'package:http/http.dart' as http;
import 'package:multi_vendor_app/models/login_response.dart';
import 'package:multi_vendor_app/views/entrypoint.dart';

class LoginController extends GetxController {
  final box = GetStorage(); // For persistent storage
  RxBool _isLoading = false.obs; // Observable loading state

  // Getter for isLoading
  bool get isLoading => _isLoading.value;

  // Setter for isLoading
  set isLoading(bool newState) {
    _isLoading.value = newState;
  }

  // Function to handle login
  Future<void> loginFunction(Map<String, dynamic> data) async {
    isLoading = true; // Start loading
    try {
      var url = Uri.parse('$appBaseUrl/login');
      Map<String, String> headers = {'Content-Type': 'application/json'};

      // Send HTTP POST request
      var response = await http.post(
        url,
        headers: headers,
        body: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        // Parse response data
        Map<String, dynamic> responseData = jsonDecode(response.body);

        // Save user data in local storage
        box.write("userId", responseData["_id"]);
        box.write("token", responseData["userToken"]);
        box.write("verification", responseData["verification"]);

        isLoading = false; // Stop loading

        // Show success message
        Get.snackbar(
          "You are successfully logged in!",
          "Enjoy your awesome experience",
          colorText: kLightWhite,
          backgroundColor: kPrimary,
          icon: Icon(Ionicons.fast_food_outline),
        );

        // Navigate based on verification status
        if (responseData["verification"] == false) {
          Get.offAll(
            VerificationPage(),
            transition: Transition.fade,
            duration: Duration(milliseconds: 900),
          );
        } else {
          Get.offAll(
            MainScreen(),
            transition: Transition.fade,
            duration: Duration(milliseconds: 900),
          );
        }
      } else {
        // Handle API errors
        Map<String, dynamic> errorData = jsonDecode(response.body);
        Get.snackbar(
          "Failed",
          errorData["message"] ?? "An error occurred.",
          colorText: kLightWhite,
          backgroundColor: kRed,
          icon: Icon(Icons.error_outline),
        );
        isLoading = false; // Stop loading
      }
    } catch (e) {
      // Handle unexpected errors
      isLoading = false;
      Get.snackbar(
        "Error",
        "Something went wrong. Please try again later.",
        colorText: Colors.red,
      );
    }
  }

  // Function to handle logout
  void logoutFunction() {
    try {
      // Clear persistent storage
      box.erase();

      // Show logout message
      Get.snackbar(
        "Logged Out",
        "You have been logged out successfully.",
        colorText: kLightWhite,
        backgroundColor: kPrimary,
        icon: Icon(Icons.exit_to_app),
      );

      // Redirect to the login page
      Get.offAll(
        LoginPage(),
        transition: Transition.fade,
        duration: Duration(milliseconds: 900),
      );
    } catch (e) {
      // Handle any unexpected errors
      Get.snackbar(
        "Error",
        "Failed to log out. Please try again.",
        colorText: kLightWhite,
        backgroundColor: kRed,
        icon: Icon(Icons.error_outline),
      );
    }
  }

  LoginResponse? getUserInfo(){
    String? userId = box.read("userId");

    String? data = box.read(userId.toString());
  }
}
