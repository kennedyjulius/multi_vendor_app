import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_vendor_app/constants/constants.dart';
import 'package:multi_vendor_app/home/widgets/app_style.dart';
import 'package:multi_vendor_app/home/widgets/reusable_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.btnWidth, this.onTap, this.btnHeight, this.btnColor, this.radius, required this.text});

  final double btnWidth;
  final void Function()? onTap;
  final double? btnHeight;
  final Color? btnColor;
  final double? radius;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        
      },
      child: Container(
        width: btnWidth?? width,
        height: btnHeight?? 28.h,
        decoration: BoxDecoration(
          color: btnColor??kPrimary,
          borderRadius: BorderRadius.circular(radius ?? 9.r),
        ),
        child: ReusableText(text: text, style: appStyle(12, kLightWhite, FontWeight.w500)),
      ),
      );
  }
}