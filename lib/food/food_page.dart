import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:multi_vendor_app/common/custom_button.dart';
import 'package:multi_vendor_app/constants/constants.dart';
import 'package:multi_vendor_app/controllers/food_controller.dart';
import 'package:multi_vendor_app/home/widgets/app_style.dart';
import 'package:multi_vendor_app/home/widgets/reusable_text.dart';
import 'package:multi_vendor_app/hooks/fetch_restaurant.dart';
import 'package:multi_vendor_app/models/food.dart';
import 'package:multi_vendor_app/models/hook_models/hook_result.dart';
import 'package:multi_vendor_app/restaurant/restaurant_page.dart';
import 'package:multi_vendor_app/restaurant/restaurat_page.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({super.key, required this.food, this.color});

  final FoodsModel food;
  final Color? color;

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final hookResult = useFetchRestaurants(widget.food.restaurant);
    final controller = Get.put(FoodController());

    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          _buildImageSlider(width),
          _buildDetailsSection(),
          _buildTagsList(),
          _buildOpenRestaurantButton(hookResult),
        ],
      ),
    );
  }

  Widget _buildImageSlider(double width) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(30.r),
          ),
          child: SizedBox(
            height: 230.h,
            child: PageView.builder(
              controller: _pageController,
              itemCount: widget.food.imageUrl.length,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemBuilder: (context, i) {
                return CachedNetworkImage(
                  width: width,
                  height: 230.h,
                  fit: BoxFit.cover,
                  imageUrl: widget.food.imageUrl[i],
                );
              },
            ),
          ),
        ),
        _buildPageIndicator(width),
        _buildBackButton(),
      ],
    );
  }

  Widget _buildPageIndicator(double width) {
    return Positioned(
      bottom: 10,
      left: width / 2 - (widget.food.imageUrl.length * 14 / 2),
      child: Row(
        children: List.generate(
          widget.food.imageUrl.length,
          (index) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 2.w),
              width: 10.w,
              height: 10.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentIndex == index ? kSecondary : kGray,
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildBackButton() {
    return Positioned(
      top: 40.h,
      left: 12,
      child: GestureDetector(
        onTap: () => Get.back(),
        child: Icon(
          Ionicons.chevron_back_circle,
          color: kDark,
        ),
      ),
    );
  }

  Widget _buildDetailsSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: ReusableText(
                  text: widget.food.title,
                  style: appStyle(18, kDark, FontWeight.w600),
                ),
              ),
              ReusableText(
                text: "\$${widget.food.price.toStringAsFixed(2)}",
                style: appStyle(18, kPrimary, FontWeight.w600),
              ),
            ],
          ),
          SizedBox(height: 15.h),
          ReusableText(
            text: widget.food.description,
            style: appStyle(11, kGray, FontWeight.w400),
          ),
        ],
      ),
    );
  }

  Widget _buildTagsList() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: SizedBox(
        height: 30.h,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.food.foodTags.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(right: 5.w),
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              decoration: BoxDecoration(
                color: kPrimary,
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Center(
                child: ReusableText(
                  text: widget.food.foodTags[index],
                  style: appStyle(11, kWhite, FontWeight.w400),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildOpenRestaurantButton(FetchHook hookResult) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.h),
      child: CustomButton(
        btnWidth: 200.w,
        text: 'Open Restaurant',
        onTap: () {
          if (hookResult.data != null) {
            Get.to(RestaurantPage(restaurant: hookResult.data));
          } else {
            Get.snackbar("Error", "Restaurant data not loaded yet.");
          }
        },
      ),
    );
  }
}
