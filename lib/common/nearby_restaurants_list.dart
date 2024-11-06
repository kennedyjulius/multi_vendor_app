import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_vendor_app/common/restaurant_widget.dart';
import 'package:multi_vendor_app/constants/uidata.dart';
import 'package:multi_vendor_app/hooks/fetch_all_restaurants.dart';
import 'package:multi_vendor_app/models/categories.dart';
import 'package:multi_vendor_app/models/restaurant_model.dart';

class NearbyRestaurants extends StatelessWidget {
  const NearbyRestaurants({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResults = useFetchRestaurants("41007428");
    List<RestaurantsModel>? restaurants = hookResults.data?.cast<RestaurantsModel>();
    final isLoading = hookResults.isloading;
    return Container(
      color: Colors.white,
      height: 194.h,
      padding: EdgeInsets.only(
        left: 12.w,
        top: 10.h,
      ),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(restaurants!.length, (i) {
          RestaurantsModel restaurant = restaurants[i];
          return RestaurantWidget(
            image: restaurant.imageUrl, 
            logo: restaurant.logoUrl, 
            title: restaurant.title, 
            time: restaurant.time,
            rating: "7457"
            );
        },),
      ),
    );
  }
}