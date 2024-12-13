// To parse this JSON data, do
//
//     final regisrationModel = regisrationModelFromJson(jsonString);

import 'dart:convert';

RegistrationModel regisrationModelFromJson(String str) => RegistrationModel.fromJson(json.decode(str));

String regisrationModelToJson(RegistrationModel data) => json.encode(data.toJson());

class RegistrationModel {
    String name;
    String email;
    String password;

    RegistrationModel({
        required this.name,
        required this.email,
        required this.password,
    });

    factory RegistrationModel.fromJson(Map<String, dynamic> json) => RegistrationModel(
        name: json["name"],
        email: json["email"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "password": password,
    };
}
