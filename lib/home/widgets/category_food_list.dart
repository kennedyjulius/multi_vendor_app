import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_vendor_app/common/food_list.dart';
import 'package:multi_vendor_app/constants/constants.dart';
import 'package:multi_vendor_app/home/widgets/food_tile.dart';
import 'package:multi_vendor_app/hooks/fetch_all_foods.dart';
import 'package:multi_vendor_app/hooks/fetch_category_foods.dart';
import 'package:multi_vendor_app/models/food.dart';
import 'package:multi_vendor_app/shimmers/foodlist_shimmer.dart';

class CategoryFoodList extends StatelessWidget {
  const CategoryFoodList({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResult = useFetchFoodsByCategory("41007428");
    List<FoodsModel>? foods = hookResult.data.cast<FoodsModel>();
    final isLoading = hookResult.isLoading;
    return SizedBox(
      width: width,
      height: height,
      child: isLoading ?
      const FoodlistShimmer() :
      Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: isLoading ?
              const FoodlistShimmer() :
              ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(foods.length, (i) {
                  var food = foods[i];
                  return FoodTile(food: food);
                },),
                
              ),
      ),
    );
  }
}