import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:multi_vendor_app/common/custom_button.dart';
import 'package:multi_vendor_app/common/custom_container.dart';
import 'package:multi_vendor_app/constants/constants.dart';
import 'package:multi_vendor_app/controllers/login_controller.dart';
import 'package:multi_vendor_app/profile/profile_app_bar.dart';
import 'package:multi_vendor_app/profile/profile_tile_widget.dart';
import 'package:multi_vendor_app/profile/user_info_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    final box = GetStorage();

    String? token = box.read('token');

    if (token != null) {
    controller.getUserInfo();

    //print(user!.email);
    }

    if (token == null) {
    return LoginRedirect();
    }
    return Scaffold(
      backgroundColor: kPrimary,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.h),
        child: ProfileAppBar(),
      ),
      body: SafeArea(
        child: CustomContainer(
          containerContent: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UserInfoWidget(user: user,),
                SizedBox(height: 10.h),
                _buildProfileOptionsSection([
                  ProfileTileWidget(
                    ontap: () {
                      // Handle navigation to My Orders
                    },
                    title: "My Orders",
                    icon: Ionicons.fast_food_outline,
                  ),
                  ProfileTileWidget(
                    ontap: () {
                      // Handle navigation to My Favorite Places
                    },
                    title: "My Favorite Places",
                    icon: Ionicons.heart_outline,
                  ),
                  ProfileTileWidget(
                    ontap: () {
                      // Handle navigation to Review
                    },
                    title: "Review",
                    icon: Ionicons.chatbubble_outline,
                  ),
                  ProfileTileWidget(
                    ontap: () {
                      // Handle navigation to Coupons
                    },
                    title: "Coupons",
                    icon: MaterialCommunityIcons.tag_outline,
                  ),
                ]),
                SizedBox(height: 15.h),
                _buildProfileOptionsSection([
                  ProfileTileWidget(
                    ontap: () {
                      // Handle navigation to Shipping Address
                    },
                    title: "Shipping Address",
                    icon: SimpleLineIcons.location_pin,
                  ),
                  ProfileTileWidget(
                    ontap: () {
                      // Handle navigation to Service Center
                    },
                    title: "Service Center",
                    icon: AntDesign.customerservice,
                  ),
                  ProfileTileWidget(
                    ontap: () {
                      // Handle navigation to RSS Feed
                    },
                    title: "RSS Feed",
                    icon: MaterialIcons.rss_feed,
                  ),
                  ProfileTileWidget(
                    ontap: () {
                      // Handle navigation to Settings
                    },
                    title: "Settings",
                    icon: AntDesign.setting,
                  ),
                ]),
                SizedBox(height: 20.h),
                CustomButton(
                  btnWidth: MediaQuery.of(context).size.width - 20.w,
                  text: "Log Out",
                  radius: 8.r,
                  btnColor: kRed,
                  onTap: () {
                    // Handle logout functionality
                    controller.logoutFunction();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileOptionsSection(List<Widget> tiles) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: kLightWhite,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(children: tiles),
    );
  }
}
