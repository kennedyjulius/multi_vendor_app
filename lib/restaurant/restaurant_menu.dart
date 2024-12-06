// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:multi_vendor_app/constants/constants.dart';

import 'package:multi_vendor_app/constants/uidata.dart';
import 'package:multi_vendor_app/home/widgets/food_tile.dart';
import 'package:multi_vendor_app/hooks/fetch_restaurant.dart';
import 'package:multi_vendor_app/models/food.dart';
import 'package:multi_vendor_app/shimmers/foodlist_shimmer.dart';

class RestaurantMenuWidget extends HookWidget {
   final String restaurantId;
  RestaurantMenuWidget({
    required this.restaurantId,
  });
  
 

  @override
  Widget build(BuildContext context) {
    final hookResults = useFetchRestaurantsFoods(restaurantId);
    final foods = hookResults.data;
    final isLoading = hookResults.isLoading;
    return Scaffold(
      body: isLoading 
      ? const FoodlistShimmer()
      : SizedBox(
        height: height * 0.7,
        child: ListView(
          padding: EdgeInsets.zero,
          children: List.generate(foods.length, (index) {
            final FoodsModel food = foods[index];
            return FoodTile(food: food);
          },),
        ),
      )
    );
  }
  
}
