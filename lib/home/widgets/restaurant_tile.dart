import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_vendor_app/constants/constants.dart';
import 'package:multi_vendor_app/home/widgets/app_style.dart';
import 'package:multi_vendor_app/home/widgets/reusable_text.dart';
import 'package:multi_vendor_app/models/restaurant_model.dart';

class RestaurantTile extends StatelessWidget {
  const RestaurantTile({super.key, required this.restaurant});


  final RestaurantsModel restaurant;

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
                          child: Image.network(restaurant.imageUrl, fit: BoxFit.cover,),
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
                            itemBuilder: (context, index) => const Icon(Icons.star, color: kSecondary,),
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
                      Text(restaurant.title,
                      style: const TextStyle(
                        fontSize: 11,
                        color: kDark,
                        fontWeight: FontWeight.w400,
                      ),
                      ), 

                      Text( "Delivery time: ${restaurant.time}",
                      style: const TextStyle(
                        fontSize: 11,
                        color: kGray,
                        fontWeight: FontWeight.w600,
                      ),
                      ), 

                      SizedBox(
                        width: width * 0.7,
                        child: Text(restaurant.coords.address,
                        style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                        fontSize: 9,
                        color: kGray,
                        fontWeight: FontWeight.w400,
                      ),
                        ),
                      )
                    ],
                  )
                ],
              ),
          
            ),
          ),

          Positioned(
            right: 5.w,
            top: 6.h,
            child: Container(
              width: 60,
              height: 19.h,
              decoration: BoxDecoration(
                color: restaurant.isAvailable == true || restaurant.isAvailable != null? kPrimary :kSecondaryLight,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Center(
                child: ReusableText(
                  text: restaurant.isAvailable == true 
                  ? "Open"
                  : "Closed",
                  style: appStyle(12, kLightWhite, FontWeight.w600))),
          ))
        ],
      ),
    );
  }
}