import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:multi_vendor_app/common/restaurant_widget.dart';
import 'package:multi_vendor_app/hooks/fetch_all_restaurants.dart';
import 'package:multi_vendor_app/models/restaurant_model.dart';
import 'package:multi_vendor_app/restaurant/restaurat_page.dart';

class NearbyRestaurants extends StatelessWidget {
  const NearbyRestaurants({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResults = useFetchAllRestaurants("41007428");
    List<RestaurantsModel>? restaurants = hookResults.data.cast<RestaurantsModel>();
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
        children: List.generate(restaurants.length, (i) {
          RestaurantsModel restaurant = restaurants[i];
          return RestaurantWidget(
            onTap: () {
              Get.to(RestaurantPage(restaurant: restaurant,));
            },
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