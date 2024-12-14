import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_vendor_app/constants/constants.dart';
import 'package:multi_vendor_app/controllers/phone_verification_controller.dart';
import 'package:multi_vendor_app/home/widgets/app_style.dart';
import 'package:phone_otp_verification/phone_verification.dart';

class PhoneVerficationPage extends StatelessWidget {
  const PhoneVerficationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PhoneVerificationController());
    return  PhoneVerification(
      isFirstPage: false,
      enableLogo:false,
      themeColor: Colors.blueAccent,
      backgroundColor: kLightWhite,
      initialPageText: "Verify Phone Number",
      initialPageTextStyle: appStyle(20, kPrimary, FontWeight.bold),
      textColor: kDark,
      onSend: (String value) {
        controller.setPhoneNumber = value;

      },
      onVerification: (String value) {
        print('OTP: $value');
      },
    );
  }
}