import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_vendor_app/constants/constants.dart';
import 'package:multi_vendor_app/home/widgets/app_style.dart';
import 'package:multi_vendor_app/home/widgets/back_ground_container.dart';
import 'package:multi_vendor_app/home/widgets/restaurant_tile.dart';
import 'package:multi_vendor_app/home/widgets/reusable_text.dart';
import 'package:multi_vendor_app/hooks/fetch_all_restaurants.dart';
import 'package:multi_vendor_app/models/restaurant_model.dart';
import 'package:multi_vendor_app/shimmers/foodlist_shimmer.dart';

class AllNearbyRestaaurants extends HookWidget {
  const AllNearbyRestaaurants({super.key});
  
  String get code => code;

  @override
  Widget build(BuildContext context) {
    final hookResults = useFetchAllRestaurants(code);
    List<RestaurantsModel>? restaurants = hookResults.data.cast<RestaurantsModel>();
    final isLoading = hookResults.isLoading;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
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
            child: isLoading ?
            const FoodlistShimmer()
            : ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(restaurants!.length, (i) {
                RestaurantsModel restaurant = restaurants[i];
                return RestaurantTile(restaurant: restaurant,);
              },),
              
            ),
          ),
          )
      )
      
    );
  }
}