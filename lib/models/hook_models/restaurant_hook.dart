import 'package:flutter/material.dart';
import 'package:multi_vendor_app/models/api_error.dart';
import 'package:multi_vendor_app/models/restaurant_model.dart';

class FetchRestaurant {
  final RestaurantsModel? data;
  final bool isloading;
  final Exception? error;
  final VoidCallback? refetch;

  FetchRestaurant({
    required this.data, 
    required this.isloading, 
    required this.error, 
    required this.refetch, required bool isLoading, ApiError? apiError
    });

  get isLoading => null;
}