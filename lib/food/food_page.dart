import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_vendor_app/constants/constants.dart';
import 'package:multi_vendor_app/models/food.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({super.key, required this.food});

  final FoodsModel food;

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  
                  bottomRight: Radius.circular(30.r),
                ),
                child: Stack(
                  children: [
                    Container(
                      height: 230.h,
                      child: PageView.builder(
                        itemBuilder: (context, i) {
                        return Container(
                          width: width,
                          height: 230.h,
                          color: kLightWhite,
                          child: CashedNetworkImage,
                        );
                      },),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}