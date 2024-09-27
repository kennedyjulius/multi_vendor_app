import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_vendor_app/constants/constants.dart';

class FoodWidget extends StatelessWidget {
  const FoodWidget({super.key, required this.image, required this.title, required this.time, required this.price, this.onTap});

  final String image;
  final String title;
  final String time;
  final String price;

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 12),
        child: Container(
          width: width *.75,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: kLightWhite
          ),
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Padding(padding: EdgeInsets.all(8.w),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: SizedBox(
                      height: 112.h,
                      width: width * 0.8,
                      child: Image.network(image),
                    ),
                  ),
                  // Positioned(
                  //   right: 10.w,
                  //   top: 10.h,
                  //   child: ClipRRect(
                  //   borderRadius: BorderRadius.circular(50.r),
                  //   child: Container(
                  //     color: kLightWhite,
                  //     child: Padding(padding: EdgeInsets.all(2.h),
                  //     child: ClipRRect(
                  //       borderRadius: BorderRadius.circular(50.r),
                  //       child: Image.network(logo, fit: BoxFit.cover, width: 20.w, height: 20.h,),
                  //     ),
                  //     ),
                      
                  //   ),

                  // ))
                ],
              ),
              ),

              Padding(padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: TextStyle(
                    fontSize: 12,
                    color: kDark,
                    fontWeight: FontWeight.w500,
                  ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(title, style: TextStyle(
                    fontSize: 12,
                    color: kGray,
                    fontWeight: FontWeight.w500,
                  ),
                  ),

                  Text("\$ $price", style: TextStyle(
                    fontSize: 12,
                    color: kDark,
                    fontWeight: FontWeight.w600,
                  ),
                  ),
                    ],
                  ),

                  // Row(
                  //   children: [
                  //     RatingBarIndicator(
                  //       rating: 5,
                  //       itemBuilder: (context, index) => Icon(
                  //         Icons.star, color: kPrimary,
                  //         ),
                  //         itemCount: 5,
                  //         itemSize: 15.h,
                  //         ),
                  //         SizedBox(width: 10.w,),
                  //         Text("+ $rating reviews and ratings", 
                  //         style: TextStyle(
                  //   fontSize: 12,
                  //   color: kDark,
                  //   fontWeight: FontWeight.w500,
                  // ),
                  // ),
                  //   ],
                  // )
                ],
              ),
              )
            ],
          ),
        ),
      ),
    );
  }
}