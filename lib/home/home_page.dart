import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:multi_vendor_app/common/custom_appbar.dart';
import 'package:multi_vendor_app/common/custom_container.dart';
import 'package:multi_vendor_app/common/food_list.dart';
import 'package:multi_vendor_app/common/heading.dart';
import 'package:multi_vendor_app/constants/constants.dart';
import 'package:multi_vendor_app/controllers/category_controller.dart';
import 'package:multi_vendor_app/home/all_fastetst_foods.dart';
import 'package:multi_vendor_app/home/all_nearby_restaaurants.dart';
import 'package:multi_vendor_app/home/recommendations_page.dart';
import 'package:multi_vendor_app/home/widgets/category_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());
    return Scaffold(
      backgroundColor: kPrimary,
      appBar: PreferredSize(preferredSize: Size.fromHeight(110.h), 
      child: const CustomAppBar(),
      ),
      body: SafeArea(
        child: CustomContainer(containerContent: 
        Obx(() => controller.categoryValue == ''? Column(
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
        ):  CustomContainer(containerContent: 
        Column(children: [
          Heading(
            more: true,
              text: "Explore ${controller.titleValue} Category", ontap: () {
              Get.to(const ReccomendationsPage());
            },
            ),
            CategoryFoodList()
        ],
        )
        )
        ) 
        )
        )
    );
  }
}