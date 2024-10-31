import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_vendor_app/constants/constants.dart';
import 'package:multi_vendor_app/constants/uidata.dart';
import 'package:multi_vendor_app/home/widgets/app_style.dart';
import 'package:multi_vendor_app/home/widgets/back_ground_container.dart';
import 'package:multi_vendor_app/home/widgets/restaurant_tile.dart';
import 'package:multi_vendor_app/home/widgets/reusable_text.dart';

class AllNearbyRestaaurants extends StatelessWidget {
  const AllNearbyRestaaurants({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: kSecondary,
        title: ReusableText(text: "All Nearby Restaurants", 
        style: appStyle(13, kLightWhite, FontWeight.w600)
        ),
      ),
      body: SafeArea(
        child: BackGroundContainer(
          color: Colors.white, 
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(restaurants.length, (i) {
                var restaurant = restaurants[i];
                return RestaurantTile(restaurant: restaurant,);
              },),
              
            ),
          ),
          )
      )
      
    );
  }
}