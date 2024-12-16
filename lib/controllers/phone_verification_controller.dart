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

class PhoneVerificationController extends GetxController {
  final box = GetStorage(); // Persistent storage
  String _phone = "";

  // Getter for phone
  String get phone => _phone;

  // Setter for phone number
  set setPhoneNumber(String value) {
    _phone = value;
  }

  RxBool _isLoading = false.obs; // Observable loading state

  // Getter for isLoading
  bool get isLoading => _isLoading.value;

  // Setter for isLoading
  set isLoading(bool newState) {
    _isLoading.value = newState;
  }

  // Function to handle phone verification
  Future<void> verifyPhone() async {
    isLoading = true; // Start loading
    try {
      // Retrieve access token from storage
      String? accessToken = box.read("token");
      if (accessToken == null) {
        throw Exception("Access token not found. Please log in.");
      }

      Uri url = Uri.parse('$appBaseUrl/api/users/verify_phone/$_phone');
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      };

      // Send HTTP POST request
      var response = await http.post(url, headers: headers);

      if (response.statusCode == 200) {
        // Parse response data
        Map<String, dynamic> responseData = jsonDecode(response.body);

        // Save verification status
        box.write("verification", responseData["verification"]);

        // Show success message
        Get.snackbar(
          "Verification Successful!",
          "Your phone number has been verified.",
          colorText: kLightWhite,
          backgroundColor: kPrimary,
          icon: Icon(Ionicons.checkmark_done_outline),
        );

        //Get.back();

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
          "Verification Failed",
          errorData["message"] ?? "An error occurred.",
          colorText: kLightWhite,
          backgroundColor: kRed,
          icon: Icon(Icons.error_outline),
        );
      }
    } catch (e) {
      // Handle unexpected errors
      Get.snackbar(
        "Error",
        e.toString(),
        colorText: Colors.red,
      );
    } finally {
      isLoading = false; // Stop loading
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

  // Function to get user information
  LoginResponse? getUserInfo() {
    try {
      // Read user data from persistent storage
      String? userId = box.read("userId");
      if (userId == null) return null;

      String? userData = box.read(userId);
      if (userData == null) return null;

      return LoginResponse.fromJson(jsonDecode(userData));
    } catch (e) {
      debugPrint("Error retrieving user info: $e");
      return null;
    }
  }
}
