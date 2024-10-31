// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';


// Function to parse JSON into a list of CategoriesModel
List<CategoriesModel> categoriesModelFromJson(String str) =>
    List<CategoriesModel>.from(
        json.decode(str).map((x) => CategoriesModel.fromJson(x)));

// Function to convert a list of CategoriesModel to JSON
String categoriesModelToJson(List<CategoriesModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoriesModel {
  final String id;
  final String title;
  final String value;
  final String imageUrl;

  CategoriesModel({
    required this.id,
    required this.title,
    required this.value,
    required this.imageUrl,
  });

  // Factory constructor to create an instance from JSON
  factory CategoriesModel.fromJson(Map<String, dynamic> json) => CategoriesModel(
        id: json["_id"],
        title: json["title"],
        value: json["value"],
        imageUrl: json["imageUrl"],
      );

  // Method to convert an instance to JSON
  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "value": value,
        "imageUrl": imageUrl,
      };
}
