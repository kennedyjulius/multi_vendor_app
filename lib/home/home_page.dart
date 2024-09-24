import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_vendor_app/categories/allcategories_page.dart';
import 'package:multi_vendor_app/common/custom_appbar.dart';
import 'package:multi_vendor_app/common/custom_container.dart';
import 'package:multi_vendor_app/constants/constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimary,
      appBar: PreferredSize(preferredSize: Size.fromHeight(130.h), 
      child: CustomAppBar(),
      ),
      body: SafeArea(
        child: AllCategories())
    );
  }
}