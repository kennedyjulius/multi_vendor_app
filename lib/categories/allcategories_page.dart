import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:multi_vendor_app/constants/constants.dart';
import 'package:multi_vendor_app/constants/uidata.dart';
import 'package:multi_vendor_app/home/widgets/back_ground_container.dart';
import 'package:multi_vendor_app/home/widgets/category_list.dart';

class AllCategories extends StatefulWidget {
  const AllCategories({super.key});

  @override
  State<AllCategories> createState() => _AllCategoriesState();
}



class _AllCategoriesState extends State<AllCategories> {
  @override

 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kOffWhite,
        title: Text("All Categories", style: TextStyle(
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
          child: ListView(
            scrollDirection: Axis.vertical,
            children: List.generate(categories.length, (i) {
              var category = categories[i];
              return ListTile(
                onTap: () {
                  Get.to(CategoryPage());
                },
                leading: CircleAvatar(
                  radius: 18.r,
                  backgroundColor: kGrayLight,
                  backgroundImage: NetworkImage(category["imageUrl"],),
                ),
                title: Text("", style: TextStyle(
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