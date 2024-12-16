import 'dart:convert';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:multi_vendor_app/constants/constants.dart';

class UserLocationController extends GetxController {
  // Store user's position
  LatLng position = LatLng(0, 0);

  // Reactive variable to store the address
  RxString address = ''.obs;

  // Reactive variable to store the postal code
  RxString _postalCode = ''.obs;

  // Getter for postal code
  String get postalCode => _postalCode.value;

  // Setter for postal code
  set postalCode(String value) {
    _postalCode.value = value;
  }

  // Method to update position and notify listeners
  void setPosition(LatLng value) {
    position = value;
    update(); // Notify listeners
  }

  // Method to update the address
  void setAddress(String newAddress) {
    address.value = newAddress;
  }

  // Fetch user address and postal code based on LatLng
  Future<void> getUserAddress(LatLng position) async {
    try {
      final url = Uri.parse(
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=$googleApiKey',
      );

      final response = await http.get(url);

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);

        // Extract formatted address
        final formattedAddress = responseBody['results'][0]['formatted_address'];
        setAddress(formattedAddress);

        // Extract postal code from address components
        final addressComponents = responseBody['results'][0]['address_components'];
        for (var component in addressComponents) {
          if (component['types'].contains('postal_code')) {
            postalCode = component['long_name'];
            break;
          }
        }
      } else {
        throw Exception('Failed to fetch address: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Error fetching address: $e');
    }
  }
}
