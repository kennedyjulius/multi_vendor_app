import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import 'package:multi_vendor_app/constants/constants.dart';

class Heading extends StatelessWidget {
  const Heading({super.key, required this.text, required this.ontap});

  final  String text;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12.0
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(padding: EdgeInsets.only(
            top: 10.h,
            
          ),
          child: Text(text, style: const TextStyle(
            fontSize: 16,
            color: kDark,
            fontWeight: FontWeight.bold
          ),),
          ),
          GestureDetector(
            onTap: () {
              
            },
            child: Icon(AntDesign.appstore1, color: kSecondary, size: 20.sp,),
          )
        ],
      ),
    );
  }
}