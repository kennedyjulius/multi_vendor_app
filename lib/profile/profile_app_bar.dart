import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:multi_vendor_app/constants/constants.dart';
import 'package:multi_vendor_app/home/widgets/app_style.dart';
import 'package:multi_vendor_app/home/widgets/reusable_text.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kLightWhite,
      elevation: 0,
      leading: GestureDetector(
        onTap: () {
          
        },
        child: Icon(AntDesign.logout, size: 18.h,),
      ),
      actions: [
        GestureDetector(
          onTap: () {
            
          },
          child: Row(
            children: [
              SvgPicture.asset(
                "assets/icons/usa.svg",
                width: 15.w,
                height: 25.h,
              ),

              SizedBox(width: 5.w,),

              Container(
                width: 1.w,
                height: 15.h,
                color: kGrayLight,
              ),
              SizedBox(width: 5.w,),
              ReusableText(text: "USA", 
              style: appStyle(16, kDark, FontWeight.normal),
              ),
              GestureDetector(
                onTap: () {
                  
                },
                child: Padding(padding: EdgeInsets.only(bottom: 4.h),
                child: Icon(SimpleLineIcons.settings, size: 16.h,),
                ),
              ),
              
            ],
          ),
        ),
      ],
    );
  }
}