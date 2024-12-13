// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_vendor_app/constants/constants.dart';
import 'package:multi_vendor_app/home/widgets/app_style.dart';
import 'package:multi_vendor_app/home/widgets/reusable_text.dart';

import 'package:multi_vendor_app/models/login_response.dart';

class UserInfoWidget extends StatelessWidget {
  const UserInfoWidget({
    Key? key,
    this.user,
  }) : super(key: key);

  final LoginResponse? user;

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    // Define colors (replace with your actual constants)
    const Color kPrimary = Colors.blue; // Example color

    return Container(
      height: height * 0.06,
      width: width,
      color: kLightWhite,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(12, 0, 16, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Example child widgets
                SizedBox(
                  height: 35.h,
                  width: 35.w,
                  child: CircleAvatar(
                    backgroundColor: kGrayLight,
                    backgroundImage: NetworkImage(user!.profile),
                  ),
                ),
                SizedBox(width: 5.w,),
                Padding(
                  padding: EdgeInsets.all(4.h),
                  child: Column(
                    children: [
                      ReusableText(text: user!.username ?? "Username", style: appStyle(12, kGray, FontWeight.w600)),
                      ReusableText(text: "kennedymutugi111@gmail.com", style: appStyle(10, kGray, FontWeight.normal))
                    ],
                  ),
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
