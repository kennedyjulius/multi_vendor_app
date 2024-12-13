import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:multi_vendor_app/common/custom_button.dart';
import 'package:multi_vendor_app/common/custom_container.dart';
import 'package:multi_vendor_app/constants/constants.dart';
import 'package:multi_vendor_app/controllers/verification_controller.dart';
import 'package:multi_vendor_app/home/widgets/app_style.dart';
import 'package:multi_vendor_app/home/widgets/reusable_text.dart';

class VerificationPage extends StatelessWidget {
  const VerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(verificationController());
    return Scaffold(
      backgroundColor: kPrimary,
      appBar: AppBar(
        title: ReusableText(
            text: "Please verify your account",
            style: appStyle(12, kGray, FontWeight.w600)),
        centerTitle: true,
        backgroundColor: kOffWhite,
        elevation: 0,
      ),
      body: SafeArea(
        child: CustomContainer(
          color: Colors.white ,
        containerContent: SizedBox(
        height: height,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Lottie.asset("assets/anime/delivery.json"),
            SizedBox(height: 30,),
            ReusableText(text: "Please Verify your Account", 
            style: appStyle(12, kGray, FontWeight.w600)),
            Text( "Enter the 6-digit code sent to your email, if you didnt get it kindly check your spam folder",
            textAlign: TextAlign.justify,
            style: appStyle(12, kGray, FontWeight.w600,
            ),
            ),
            SizedBox(height: 20,),
            

        OtpTextField(
        numberOfFields: 6,
        borderColor: kPrimary,
        textStyle: appStyle(17, kDark, FontWeight.bold),
        borderWidth: 2.0,
        onCodeChanged: (String code) {
          
        },
        //runs when every textfield is filled
        onSubmit: (String verificationCode){
            controller.setCode = verificationCode;
        }, // end onSubmit
    ),

    SizedBox(height: 20.h,),

    CustomButton(
              btnWidth: width,
              btnHeight: 35.h,
              text: "V E R I F Y  A C C O U N T",
              onTap: () {
                controller.verificationFunction(code);
              },
              ),

          ],
        ),
      )
      )
      ),
    );
  }
}
