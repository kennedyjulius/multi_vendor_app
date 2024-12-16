import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:multi_vendor_app/constants/constants.dart';
import 'package:http/http.dart' as http;
import 'package:multi_vendor_app/models/api_error.dart';

class RegistrationController extends GetxController {
  final box = GetStorage(); // For persistent storage
  RxBool _isLoading = false.obs; // Observable loading state

  // Getter for isLoading
  bool get isLoading => _isLoading.value;

  // Setter for isLoading
  set isLoading(bool newState) {
    _isLoading.value = newState;
  }

  // Function to handle registration
  Future<void> registrationFunction(String data) async {
    isLoading = true; // Start loading
    try {
      var url = Uri.parse('$appBaseUrl/register'); // Corrected endpoint
      Map<String, String> headers = {'Content-Type': 'application/json'};

      // Send HTTP POST request
      var response = await http.post(
        url,
        headers: headers,
        body: data,
      );

      if (response.statusCode == 201) {
        // Parse response data
        Map<String, dynamic> responseData = jsonDecode(response.body);

        // Save user data in local storage
        box.write("userId", responseData["_id"]);
        box.write("token", responseData["userToken"]);
        box.write("verification", responseData["verification"]);

        isLoading = false; // Stop loading

        // Show success message
        Get.snackbar(
          "Success",
          "You are successfully registered!",
          colorText: kLightWhite,
          backgroundColor: kPrimary,
          icon: Icon(Ionicons.fast_food_outline),
        );
      } else {
        // Parse and handle API errors
        var error = apiErrorFromJson(response.body);
        Get.snackbar(
          "Failed to register",
          error.message,
          colorText: kLightWhite,
          backgroundColor: kRed,
          icon: Icon(Icons.error_outline),
        );
      }
    } catch (e) {
      // Handle unexpected errors
      isLoading = false;
      Get.snackbar(
        "Error",
        "Something went wrong. Please try again later.",
        colorText: Colors.red,
      );
      debugPrint(e.toString());
    } finally {
      isLoading = false; // Stop loading in all cases
    }
  }
}
