import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:multi_vendor_app/common/custom_button.dart';
import 'package:multi_vendor_app/constants/constants.dart';
import 'package:multi_vendor_app/models/food.dart';
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

    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30.r),
                ),
                child: Stack(
                  children: [
                    SizedBox(
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
                          return Container(
                            width: width,
                            height: 230.h,
                            color: kLightWhite,
                            child: CachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl: widget.food.imageUrl[i],
                            ),
                          );
                        },
                      ),
                    ),
                    Positioned(
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
                                color: _currentIndex == index
                                    ? kSecondary
                                    : kGray,
                              ),
                            );
                          },
                        ),
                      ),
                    ),


                    Positioned(
                      top: 40.h,
                      left: 12,
                      child: GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(
                        Ionicons.chevron_back_circle, 
                        color: kDark,),
                    ),
                    ),

                    Positioned(
                      bottom: 10,
                      right: 12.w,
                      child: CustomButton(
                        btnWidth: 120.w, 
                        text: 'Open Restaurant',
                        onTap: () {
                          Get.to(RestaurantPage());
                        },
                        
                        )
                        )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
