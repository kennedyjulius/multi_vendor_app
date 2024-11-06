import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:multi_vendor_app/constants/uidata.dart';
import 'package:multi_vendor_app/home/widgets/food_widget.dart';
import 'package:multi_vendor_app/hooks/fetch_foods.dart';
import 'package:multi_vendor_app/models/food.dart';

class FoodList extends HookWidget {
  const FoodList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hookResults = useFetchFoods("41007428");
    List<FoodsModel>? foods = hookResults.data!.cast<FoodsModel>();
    final isLoading = hookResults.isloading;

    return Container(
      height: 210.h,
      padding: EdgeInsets.only(
        left: 12.w,
        top: 10.h,
      ),
      child: isLoading
          ? Center(child: CircularProgressIndicator()) // Loading indicator
          : ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: foods?.length ?? 0, // Null safety check
              itemBuilder: (context, i) {
                final food = foods![i]; // Non-null assertion since foods is now guaranteed to have data

                return FoodWidget(
                  imageUrl: food.imageUrl,
                  title: food.title,
                  time: food.time,
                  price: food.price,
                );
              },
            ),
    );
  }
}
