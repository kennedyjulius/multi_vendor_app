import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_vendor_app/constants/constants.dart';
import 'package:multi_vendor_app/constants/uidata.dart';

class RestaurantTile extends StatelessWidget {
  const RestaurantTile({super.key, this.restaurant});


  final dynamic restaurant;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          Container(
            margin: EdgeInsets.only(
              bottom: 8.h,
            ),
            height: 70.h,
            width: width,
            decoration: BoxDecoration(
              color: kOffWhite,
              borderRadius: BorderRadius.circular(9.r)
            ),
            child: Container(
              padding: EdgeInsets.all(4.r),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(12.r)),
                    child: Stack(
                      children: [
                        SizedBox(
                          height: 70.h,
                          width: 70.w,
                          child: Image.network(restaurants['imageUrl'], fit: BoxFit.cover,),
                        ),

                        Positioned(child: Container(
                          padding: EdgeInsets.only(
                           left: 6.w,
                           bottom: 2.h, 
                          ),
                          color: kGray.withOpacity(0.6),
                          height: 16.h,
                          width: width,
                          child: RatingBarIndicator(
                            rating: 5,
                            itemCount: 5,
                            itemBuilder: (context, index) => Icon(Icons.star, color: kSecondary,),
                            itemSize: 15.h,
                           ),
                        ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(width: 10.w,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       
                    ],
                  )
                ],
              ),
          
            ),
          )
        ],
      ),
    );
  }
}