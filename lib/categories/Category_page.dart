import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:multi_vendor_app/constants/constants.dart';
import 'package:multi_vendor_app/controllers/category_controller.dart';
import 'package:multi_vendor_app/home/widgets/app_style.dart';
import 'package:multi_vendor_app/home/widgets/back_ground_container.dart';
import 'package:multi_vendor_app/home/widgets/food_tile.dart';
import 'package:multi_vendor_app/home/widgets/reusable_text.dart';
import 'package:multi_vendor_app/hooks/fetch_category_foods.dart';
import 'package:multi_vendor_app/models/food.dart';
import 'package:multi_vendor_app/shimmers/foodlist_shimmer.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CategoryPage extends HookWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());
    final hookResult = useFetchFoodsByCategory("41007428");

    // Casting hookResult data
    List<FoodsModel>? foods = hookResult.data?.cast<FoodsModel>();
    final isLoading = hookResult.isLoading;

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kOffWhite,
        title: ReusableText(
          text: "${controller.titleValue} Category",
          style: appStyle(13, kDark, FontWeight.w600),
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
            controller.updateCategory = '';
            controller.updateTitle = '';
          },
          icon: Icon(Icons.arrow_back_ios, color: kDark),
        ),
      ),
      body: BackGroundContainer(
        color: Colors.white,
        child: SizedBox(
          width: width,
          height: height,
          child: isLoading
              ? const FoodlistShimmer()
              : Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: List.generate(
                      foods?.length ?? 0,
                      (i) {
                        var food = foods![i];
                        return FoodTile(food: food);
                      },
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
