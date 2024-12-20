import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:multi_vendor_app/common/custom_button.dart';
import 'package:multi_vendor_app/common/rowtext_page.dart';
import 'package:multi_vendor_app/constants/constants.dart';
import 'package:multi_vendor_app/directions/directions_page.dart';
import 'package:multi_vendor_app/home/widgets/app_style.dart';
import 'package:multi_vendor_app/home/widgets/reusable_text.dart';
import 'package:multi_vendor_app/models/restaurant_model.dart';
import 'package:multi_vendor_app/restaurant/rating_page.dart';
import 'package:multi_vendor_app/restaurant/restaurant_menu.dart';

class RestaurantPage extends StatefulWidget {
  const RestaurantPage({super.key, this.restaurant});

  final RestaurantsModel? restaurant;

  @override
  State<RestaurantPage> createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> with TickerProviderStateMixin{

  late TabController _tabController = TabController(
    length: 2,
    vsync: this
    );
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: kLightWhite,
        
        body: ListView(
          padding: EdgeInsets.zero,
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 230.h,
                  width: width,
                  child: CachedNetworkImage(imageUrl: widget.restaurant!.imageUrl),
                ),

                Positioned(
                  bottom: 0,
                  child: RestaurantBottomBar()
                ),

                Positioned(
                  top: 40.h,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                    ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(
                          Ionicons.chevron_back_circle, 
                          size: 28, color: kLightWhite,
                          ),
                      ),

                      ReusableText(text: widget.restaurant!.title, 
                      style: appStyle(13, kDark, FontWeight.w600),
                      ),

                        GestureDetector(
                        onTap: () {
                          Get.to(DirectionsPage());
                        },
                        child: Icon(
                          Ionicons.location, 
                          size: 28, 
                          color: kLightWhite,
                          ),
                      ),
                    ],
                  ),


                )
                )
              ],
            ),

            SizedBox(height: 10.h,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  Rowtext(first: "Distance to Restaurant", second: "2.7 km"),
                  SizedBox(height: 4.h,),
                  Rowtext(first: "Estimated Price", second: "\$2.7"),
                  SizedBox(height: 4.h,),
                  Rowtext(first: "Estimated Time", second: "30 min"),
                  Divider(
                    thickness: 0.7,
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: kOffWhite,
                 borderRadius: BorderRadius.circular(25.r) 
                ),
                height: 25.h,
                width: width,
                child: TabBar(
                  controller: _tabController,
                  indicator: BoxDecoration(
                    color: kPrimary,
                    borderRadius: BorderRadius.circular(25.r),
                  ),
                  labelPadding: EdgeInsets.zero,
                  labelColor: kLightWhite,
                  labelStyle: appStyle(12, kLightWhite, FontWeight.normal),
                  tabs: [
                    Tab(
                      child: SizedBox(
                        width: width/2,
                        height: 25,
                        child: Center(
                          child: Text("Menu"),
                        ),
                      ),
                    ),
              
              
                      Tab(
                      child: SizedBox(
                        width: width/2,
                        height: 25,
                        child: Center(
                          child: Text("Explore"),
                        ),
                      ),
                    ),
                  ]
                  
                  ),
              ),
            ),


            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 8.w),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: height,
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        RestaurantMenuWidget(restaurantId: widget.restaurant!.id),
                        RestaurantMenuWidget(restaurantId: widget.restaurant!.id),
                      ]
                      ),
                  ),
                ),
                ),
          ],
        )
      ),
    );
  }

  Container RestaurantBottomBar() {
    return Container(
                  width: width,
                  height: 40.h,
                  decoration: BoxDecoration(
                    color: kPrimary.withOpacity(0.4),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(8.r),
                      topLeft: Radius.circular(8.r),
                    )
                  ),
                  child: Row(
                    children: [
                      RatingBarIndicator(
                        rating: widget.restaurant!.rating.toDouble(),
                        itemBuilder: (context, index) => Icon(
                          Icons.star, 
                          color: Colors.yellow,
                          ),
                        ),

                        CustomButton(
                          onTap: () {
                            Get.to(RatingPage());
                          },
                          btnWidth: width/3, 
                        text: "Rate Restaurant"
                        )
                    ],
                  ),
              );
  }
}


