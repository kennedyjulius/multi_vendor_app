import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_vendor_app/constants/constants.dart';
import 'package:multi_vendor_app/home/widgets/app_style.dart';
import 'package:multi_vendor_app/home/widgets/back_ground_container.dart';
import 'package:multi_vendor_app/home/widgets/food_tile.dart';
import 'package:multi_vendor_app/home/widgets/reusable_text.dart';
import 'package:multi_vendor_app/hooks/fetch_all_foods.dart';
import 'package:multi_vendor_app/models/food.dart';
import 'package:multi_vendor_app/shimmers/foodlist_shimmer.dart';

class ReccomendationsPage extends HookWidget {
  const ReccomendationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResults = useFetchAllFoods("41007428");
    List<FoodsModel>? foods = hookResults.data; // Correctly assign the fetched data to foods
    final isLoading = hookResults.isLoading;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kSecondary,
        title: ReusableText(text: "Reccommendation", 
        style: appStyle(13, kLightWhite, FontWeight.w600)
        ),
      ),
      body: BackGroundContainer(
          color: Colors.white, 
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: isLoading ?
            const FoodlistShimmer():
            ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(foods!.length, (i) {
                FoodsModel food = foods[i];
                return FoodTile(food: food);
              },),
              
            ),
          ),
          )
    );
  }
}