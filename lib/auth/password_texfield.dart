// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:multi_vendor_app/constants/constants.dart';
import 'package:multi_vendor_app/controllers/password_controller.dart';
import 'package:multi_vendor_app/home/widgets/app_style.dart';

class EmailTextfield extends StatelessWidget {
  const EmailTextfield({
    Key? key,
    //this.onEditingComplete,
    this.keyboardType,
    //this.initialValue,
    //required this.controller,
    //this.hintText,
    //this.prefixIcon,
  }) : super(key: key);

  // final void Function()? onEditingComplete;
  final TextInputType? keyboardType;
  // final String? initialValue;
  //final TextEditingController ;
  //final String? hintText;
  //final Widget? prefixIcon;



  @override
  Widget build(BuildContext context) {
    final passwordController = Get.put(PasswordController());
    return TextFormField(
      cursorColor: kDark,
      textInputAction: TextInputAction.next,
      //onEditingComplete: onEditingComplete,
      keyboardType: keyboardType ?? TextInputType.emailAddress,
      //initialValue: initialValue,
      //controller: passwordcontroller,
      obscureText: true,
      validator: (value) {
        if (value!.isEmpty) {
        return "Please enter valid password";
        }else{
          return null;
        }
      },
      style: appStyle(12, kGray, FontWeight.normal),
      decoration: InputDecoration(
        hintText: "Password",
        prefixIcon: Icon(CupertinoIcons.lock_circle, size: 26, color: kGrayLight,),
        isDense: true,
        contentPadding: EdgeInsets.all(6.h),
        hintStyle: appStyle(12, kGray, FontWeight.normal),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kRed, width: 5),
          borderRadius: BorderRadius.all(Radius.circular(12.r),
          )
        ),

        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kPrimary, width: 5),
          borderRadius: BorderRadius.all(Radius.circular(12.r),
          )
        ),

        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kRed, width: 5),
          borderRadius: BorderRadius.all(Radius.circular(12.r),
          )
        ),

        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kPrimary, width: 5),
          borderRadius: BorderRadius.all(Radius.circular(12.r),
          )
        ),

        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kPrimary, width: 5),
          borderRadius: BorderRadius.all(Radius.circular(12.r),
          )
        ),
      ),
    );
  }
}
