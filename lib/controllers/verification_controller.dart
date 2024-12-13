import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:multi_vendor_app/auth/login_page.dart';
import 'package:multi_vendor_app/auth/verification_page.dart';
import 'package:multi_vendor_app/constants/constants.dart';
import 'package:http/http.dart' as http;
import 'package:multi_vendor_app/models/api_error.dart';
import 'package:multi_vendor_app/models/login_response.dart';

import 'package:multi_vendor_app/views/entrypoint.dart';

class verificationController extends GetxController {
  final box = GetStorage(); // For persistent storage
  RxBool _isLoading = false.obs; // Observable loading state

  // Getter for code
  

  String _code = "";

  String get code => _code;

  set setCode(String value){
    _code =value;
  }

//getter for isLoading
  bool get isLoading => _isLoading.value;

  // Setter for isLoading
  set isLoading(bool value) {
    _isLoading.value = value;
  }

  // Function to handle login
  Future<void> verificationFunction() async {
    isLoading = true; 
    String accessToken = box.read("token");

    Uri url = Uri.parse('$appBaseUrl/api/users /verify/$code');
      Map<String, String> headers = {'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
      };
    try {
      // Send HTTP POST request
      var response = await http.get(
        url,
        headers: headers,
        
      );

      if (response.statusCode == 200) {
        // Parse response data
        LoginResponse data = loginResponseFromJson(response.body);

        // Save user data in local storage

        String userId = data.id;
        String userData = jsonEncode(data);

        box.write(userId, userData);
        box.write("userId", data.id);
        box.write("token", data.userToken);
        box.write("verification", data.verification);

        isLoading = false; // Stop loading

        // Show success message
        Get.snackbar(
          "You are successfully verified!",
          "Enjoy your awesome experience",
          colorText: kLightWhite,
          backgroundColor: kPrimary,
          icon: Icon(Ionicons.fast_food_outline),
        );

        // Navigate based on verification status
        Get.offAll(MainScreen());
      
      } else {
        // Handle API errors
       var error = apiErrorFromJson(response.body);
        Get.snackbar(
          "Failed to login",
          error.message,
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
}
