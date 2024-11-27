import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:multi_vendor_app/categories/Category_page.dart';
import 'package:multi_vendor_app/constants/constants.dart';
import 'package:multi_vendor_app/home/widgets/back_ground_container.dart';
import 'package:multi_vendor_app/hooks/fetch_all_catergories.dart';

import 'package:multi_vendor_app/models/categories.dart';
import 'package:multi_vendor_app/shimmers/foodlist_shimmer.dart';

class AllCategories extends HookWidget {
  const AllCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResults = useFetchAllCategories();
    List<CategoriesModel>? categories = hookResults.data;
    final isLoading = hookResults.isLoading;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kOffWhite,  // Ensure kOffWhite is defined in your constants
        title: const Text(
          "Categories",
          style: TextStyle(
            fontSize: 12,
            color: kGray,  // Ensure kGray is defined in your constants
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: BackGroundContainer(
        color: Colors.white,
        child: Container(
          padding: EdgeInsets.only(
            left: 12.w, // Requires flutter_screenutil to be initialized
            top: 10.h,
          ),
          height: MediaQuery.of(context).size.height,
          child: isLoading
              ? const FoodlistShimmer() // Ensure FoodListShimmer is defined in your code
              : ListView.builder(
                  itemCount: categories?.length ?? 0,
                  itemBuilder: (context, i) {
                    CategoriesModel category = categories![i];
                    return ListTile(
                      onTap: () {
                        Get.to(() => const CategoryPage());
                      },
                      leading: CircleAvatar(
                        radius: 18.r,
                        backgroundColor: kGrayLight,  // Ensure kGrayLight is defined
                        backgroundImage: NetworkImage(category.imageUrl),
                      ),
                      title: Text(
                        category.title,
                        style: const TextStyle(
                          fontSize: 12,
                          color: kGray,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
