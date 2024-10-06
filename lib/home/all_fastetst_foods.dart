import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_vendor_app/constants/uidata.dart';
import 'package:multi_vendor_app/home/widgets/back_ground_container.dart';
import 'package:multi_vendor_app/home/widgets/food_tile.dart';

class AllFastetstFoods extends StatelessWidget {
  const AllFastetstFoods({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.3,
        title: const Text("Foods closer to you"),
      ),
      body: BackGroundContainer(
          color: Colors.white, 
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: ListView(
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