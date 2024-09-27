import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:multi_vendor_app/categories/allcategories_page.dart';
import 'package:multi_vendor_app/common/custom_appbar.dart';
import 'package:multi_vendor_app/common/custom_container.dart';
import 'package:multi_vendor_app/common/food_list.dart';
import 'package:multi_vendor_app/common/heading.dart';
import 'package:multi_vendor_app/constants/constants.dart';
import 'package:multi_vendor_app/home/all_fastetst_foods.dart';
import 'package:multi_vendor_app/home/all_nearby_restaaurants.dart';
import 'package:multi_vendor_app/home/recommendations_page.dart';
import 'package:multi_vendor_app/home/widgets/category_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimary,
      appBar: PreferredSize(preferredSize: Size.fromHeight(130.h), 
      child: const CustomAppBar(),
      ),
      body: SafeArea(
        child: CustomContainer(containerContent: Column(
          children: [
            const CategoryList(),Heading(
              text: "Nearby Restaurant", ontap: () {
              Get.to(const AllNearbyRestaaurants());
            },),

            const CategoryList(),
            Heading(
              text: "Try Something New", ontap: () {
              Get.to(const ReccomendationsPage());
            },),
            const FoodList(),

              const CategoryList(),Heading(
              text: "Food Closer to you", ontap: () {
              const AllFastetstFoods();
            },),
            const FoodList()
          ],
        ))
        )
    );
  }
}