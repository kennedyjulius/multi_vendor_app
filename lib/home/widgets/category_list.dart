import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
// Ensure this file has 'categories' data defined
import 'package:multi_vendor_app/controllers/category_controller.dart';
import 'package:multi_vendor_app/home/widgets/category_widget.dart';
import 'package:multi_vendor_app/hooks/fetch_categories.dart';
import 'package:multi_vendor_app/shimmers/categories_shimmer.dart';

class CategoryList extends HookWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResult = useFetchCategories(); // Use the fetch categories hook
    final categoriesList = hookResult.data;
    final isLoading = hookResult.isLoading;
    final error = hookResult.error;
    final controller = Get.put(CategoryController());

    if (isLoading) {
      return SizedBox(
        height: 75.h,
        child: const CategoriesShimmer(),
      );
    }

    if (error != null) {
      return Container(
        height: 75.h,
        alignment: Alignment.center,
        child: Text('Error: ${error.toString()}'),
      );
    }

    if (categoriesList == null || categoriesList.isEmpty) {
      return Container(
        height: 75.h,
        alignment: Alignment.center,
        child: const Text('No categories found.'),
      );
    }

    return Container(
      height: 75.h,
      padding: EdgeInsets.only(
        left: 12.w,
        top: 10.h,
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoriesList.length,
        itemBuilder: (context, index) {
          final category = categoriesList[index];
          return CategoryWidget(controller: controller, category: category);
        },
      ),
    );
  }
}
