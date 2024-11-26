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

class AllFastetstFoods extends HookWidget {
  const AllFastetstFoods({super.key});
  
  get isLoading => isLoading;

  @override
  Widget build(BuildContext context) {
    final hookResult = useFetchAllFoods("41007428");
    List<FoodsModel>? foods = hookResult.data.cast<FoodsModel>();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kSecondary,
        title: ReusableText(text: "Fastest Food", 
        style: appStyle(13, kLightWhite, FontWeight.w600)
        ),
      ),
      body: BackGroundContainer(
          color: Colors.white, 
          child: Padding(
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
          )
    );
  }
}