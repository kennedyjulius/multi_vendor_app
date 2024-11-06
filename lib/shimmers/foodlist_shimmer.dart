import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:multi_vendor_app/constants/constants.dart';
import 'package:multi_vendor_app/home/widgets/shimmer_widget.dart';

class FoodlistShimmer extends StatelessWidget {
  const FoodlistShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 12.w,
        top: 10.h,
      ),
      height: 190.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 6, // Add a fixed number or dynamically adjust as needed
        itemBuilder: (context, index) {
          return Column(
            children: [
              ShimmerWidget(
                shimmerWidth: width * 0.8,
                shimmerHeight: 188.h,
                shimmerRadius: 12.w,
              ),
            ],
          );
        },
      ),
    );
  }
}

