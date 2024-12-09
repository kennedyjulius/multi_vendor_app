// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

// Function to decode JSON into a SuccessModel object
SuccessModel successModelFromJson(String str) =>
    SuccessModel.fromJson(json.decode(str));

// Function to encode SuccessModel object into JSON string
String successModelToJson(SuccessModel data) => json.encode(data.toJson());

class SuccessModel {
  final bool status;
  final String message;

  // Constructor
  const SuccessModel({
    required this.status,
    required this.message,
  });

  // Factory constructor to create an instance from a JSON map
  factory SuccessModel.fromJson(Map<String, dynamic> json) {
    return SuccessModel(
      status: json["status"] as bool,
      message: json["message"] as String,
    );
  }

  // Method to convert an instance into a JSON map
  Map<String, dynamic> toJson() {
    return {
      "status": status,
      "message": message,
    };
  }
}
