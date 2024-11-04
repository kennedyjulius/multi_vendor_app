import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:multi_vendor_app/categories/Category_page.dart';
import 'package:multi_vendor_app/constants/constants.dart';
import 'package:multi_vendor_app/constants/uidata.dart';
import 'package:multi_vendor_app/home/widgets/back_ground_container.dart';
import 'package:multi_vendor_app/home/widgets/category_list.dart';
import 'package:multi_vendor_app/hooks/fetch_all_catergories.dart';
import 'package:multi_vendor_app/models/categories.dart';

class AllCategories extends HookWidget {
  const AllCategories({super.key});

  @override
  State<AllCategories> createState() => _AllCategoriesState();
}



class _AllCategoriesState extends State<AllCategories> {
  @override

 
  Widget build(BuildContext context) {
    final hookResults = useFetchAllCategories();
    List<CategoriesModel>? categories = hookResults.data;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kOffWhite,
        title: const Text("All Categories", style: TextStyle(
          fontSize: 12,
          color: kGray,
          fontWeight: FontWeight.w600,
        ),),
      ),
      body: BackGroundContainer(
        color: Colors.white,
        child: Container(
          padding: EdgeInsets.only(
            left: 12.w,
            top: 10.h,
          ),
          height: height,
          child: isLoading ?
          FoodListShimmer()
          : ListView(
            scrollDirection: Axis.vertical,
            children: List.generate(categories.length, (i) {
              var category = categories[i];
              return ListTile(
                onTap: () {
                  Get.to(const CategoryPage());
                },
                leading: CircleAvatar(
                  radius: 18.r,
                  backgroundColor: kGrayLight,
                  backgroundImage: NetworkImage(category["imageUrl"],),
                ),
                title: const Text("", style: TextStyle(
                  fontSize: 12,
                  color: kGray,
                  fontWeight: FontWeight.normal,
                ),),
              );
            },)
          ),
        ),
      ),
    );
  }
}