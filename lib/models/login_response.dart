// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

// Function to decode JSON string into a LoginResponse object
LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

// Function to encode a LoginResponse object into JSON string
String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  final String id;
  final String username;
  final String email;
  final String fcm;
  final String verification;
  final String phone;
  final String phoneVerification;
  final String userType;
  final String profile;
  final String userToken;

  // Constructor
  const LoginResponse({
    required this.id,
    required this.username,
    required this.email,
    required this.fcm,
    required this.verification,
    required this.phone,
    required this.phoneVerification,
    required this.userType,
    required this.profile,
    required this.userToken,
  });

  // Factory method to create a LoginResponse object from JSON
  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      id: json["_id"] as String,
      username: json["username"] as String,
      email: json["email"] as String,
      fcm: json["fcm"] as String,
      verification: json["verification"] as String,
      phone: json["phone"] as String,
      phoneVerification: json["phoneVerification"] as String,
      userType: json["userType"] as String,
      profile: json["profile"] as String,
      userToken: json["userToken"] as String,
    );
  }

  // Method to convert a LoginResponse object to JSON
  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      "username": username,
      "email": email,
      "fcm": fcm,
      "verification": verification,
      "phone": phone,
      "phoneVerification": phoneVerification,
      "userType": userType,
      "profile": profile,
      "userToken": userToken,
    };
  }
}
