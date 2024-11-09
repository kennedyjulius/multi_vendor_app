import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:multi_vendor_app/common/custom_container.dart';
import 'package:multi_vendor_app/common/custom_text_field.dart';
import 'package:multi_vendor_app/constants/constants.dart';
import 'package:multi_vendor_app/controllers/search_controller.dart';
import 'package:multi_vendor_app/search/loading_widget.dart';
import 'package:multi_vendor_app/search/search_results.dart';
import 'package:multi_vendor_app/shimmers/foodlist_shimmer.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SearchFoodController());
    return Scaffold(
      backgroundColor: kPrimary,
      appBar: AppBar(
        toolbarHeight: 74.h,
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: kOffWhite,
        title: Padding(
          padding: EdgeInsets.only(top: 12.h),
          child: CustomTextField(
            controller: _searchController,
            keyboardType: TextInputType.text,
            hintText: "Search For Foods",
            suffixIcon: GestureDetector(
              onTap: () {
                if (controller.isTriggered == false) {
                controller.searchFoods(_searchController.text);
                controller.setTriggered(true);
                }else {
                  controller.searchResults = null;
                  controller.setTriggered(false);
                  _searchController.clear();
                }
                
              },
              child: controller.isTriggered == false
              ?const Icon(Ionicons.search_circle, size: 40, color: kPrimary,)
              :Icon(Ionicons.close_circle, size: 40.h, color: kRed,)
            ),
            
          ),
        ),
      ),
      body: SafeArea(
        child: CustomContainer(
          color: Colors.white,
          containerContent: controller.isLoading ?
          : controller.searchResults == null ? const  LoadingWidget()
          : const SearchResults()),
      ),
    );
  }
}
