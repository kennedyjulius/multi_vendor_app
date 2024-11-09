import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_vendor_app/home/widgets/shimmer_widget.dart';

class CategoriesShimmer extends StatelessWidget {
  const CategoriesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 12.w,
        top: 10.h,
      ),
      height: 75.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5, // Add a fixed number or dynamically adjust as needed
        itemBuilder: (context, index) {
          return Column(
            children: [
              ShimmerWidget(
                shimmerWidth: 70.w,
                shimmerHeight: 60.h,
                shimmerRadius: 12.w,
              ),
            ],
          );
        },
      ),
    );
  }
}

