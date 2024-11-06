import 'package:flutter/material.dart';
import 'package:multi_vendor_app/models/api_error.dart';
import 'package:multi_vendor_app/models/categories.dart';

class FetchHook {
  final List<CategoriesModel>? data;
  final bool isloading;
  final Exception? error;
  final VoidCallback? refetch;

  FetchHook({
    required this.data, 
    required this.isloading, 
    required this.error, 
    required this.refetch, required bool isLoading, ApiError? apiError
    });

  get isLoading => null;
}