import 'dart:convert';

ApiError apiErrorFromJson(String str) => ApiError.fromJson(json.decode(str));

String apiErrorToJson(ApiError data) => json.encode(data.toJson());

class ApiError {
  final bool status;
  final String message;

  ApiError({
    required this.status,
    required this.message,
  });

  // Corrected factory constructor
  factory ApiError.fromJson(Map<String, dynamic> json) => ApiError(
        status: json["status"],
        message: json["message"],
      );

  // Corrected toJson method
  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
      };
}
