import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:multi_vendor_app/constants/constants.dart';
import 'package:multi_vendor_app/controllers/search_controller.dart';
import 'package:multi_vendor_app/home/widgets/food_tile.dart';
import 'package:multi_vendor_app/models/food.dart';

class SearchResults extends StatelessWidget {
  const SearchResults({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SearchFoodController());
    return Container(
      padding: EdgeInsets.fromLTRB(12.w, 10.h, 12.h, 0 ),
      height: height,
      child: ListView.builder(
        itemBuilder: (context, i) {
        FoodsModel food = controller.searchResults![i];
        return FoodTile(food: food);
      },),
    );
  }
}