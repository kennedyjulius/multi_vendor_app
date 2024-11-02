import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:multi_vendor_app/constants/uidata.dart';
import 'package:multi_vendor_app/home/widgets/food_widget.dart';

class FoodList extends StatelessWidget {
  const FoodList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210.h,
      padding: EdgeInsets.only(
        left: 12.w,
        top: 10.h,
      ),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(foods.length, (i) {
          var food = foods[i];
          return FoodWidget(
            imageUrl: food['imageUrl'], 
            title: food['title'], 
            time: food['time'], 
            price: food['price'],
            );
        },),
      ),
    );
  }
}