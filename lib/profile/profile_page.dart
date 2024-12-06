// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:multi_vendor_app/common/custom_container.dart';
import 'package:multi_vendor_app/constants/constants.dart';
import 'package:multi_vendor_app/profile/profile_app_bar.dart';
import 'package:multi_vendor_app/profile/profile_tile_widget.dart';
import 'package:multi_vendor_app/profile/user_info_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimary,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.h), // Dynamically set app bar height
        child: ProfileAppBar(),
      ),
      body: SafeArea(
        child: CustomContainer(
          containerContent: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //SizedBox(height: 16.h), // Add spacing dynamically
                UserInfoWidget(), // User Info section
                SizedBox(height: 10.h),
                Container(
                  height: 175.h,
                  decoration: BoxDecoration(
                    color: kLightWhite,
                    
                  ),
                  child: ListView(
                    padding: EdgeInsets.zero,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      ProfileTileWidget(
                        ontap: () {
                          
                        },
                        title: "My Orders", 
                      icon: Ionicons.fast_food_outline
                      ),

                         ProfileTileWidget(
                        ontap: () {
                          
                        },
                        title: "My Favorite Places", 
                      icon: Ionicons.heart_outline
                      ),

                         ProfileTileWidget(
                        ontap: () {
                          
                        },
                        title: "Review", 
                      icon: Ionicons.chatbubble_outline
                      ),

                         ProfileTileWidget(
                        ontap: () {
                          
                        },
                        title: "Coupons", 
                      icon: MaterialCommunityIcons.tag_outline
                      ),


                      SizedBox(height: 15.h),
                Container(
                  height: 175.h,
                  decoration: BoxDecoration(
                    color: kLightWhite,
                    
                  ),
                  child: ListView(
                    padding: EdgeInsets.zero,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      ProfileTileWidget(
                        ontap: () {
                          
                        },
                        title: "Shipping Address", 
                      icon: SimpleLineIcons.location_pin,
                      ),

                         ProfileTileWidget(
                        ontap: () {
                          
                        },
                        title: "Service Center", 
                      icon: AntDesign.customerservice,
                      ),

                         ProfileTileWidget(
                        ontap: () {
                          
                        },
                        title: "Coupons", 
                      icon: MaterialIcons.rss_feed,
                      ),

                         ProfileTileWidget(
                        ontap: () {
                          
                        },
                        title: "Settings", 
                      icon: AntDesign.setting,
                      ),
                      
                    ],
                  ),
                ),
                
                // Add more widgets as needed
              ],
            ),
          ),
        ),
      ),
    );
  }
}
 