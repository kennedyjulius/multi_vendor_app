import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_vendor_app/constants/constants.dart';
import 'package:multi_vendor_app/controllers/phone_verification_controller.dart';
import 'package:multi_vendor_app/home/widgets/app_style.dart';
import 'package:multi_vendor_app/services/verification_services.dart';
import 'package:phone_otp_verification/phone_verification.dart';

class PhoneVerficationPage extends StatefulWidget {
  const PhoneVerficationPage({super.key});

  @override
  State<PhoneVerficationPage> createState() => _PhoneVerficationPageState();
}

class _PhoneVerficationPageState extends State<PhoneVerficationPage> {

  VerificationServices _verificationService = VerificationServices();

  String _verificationId = '';
  @override
  Widget build(BuildContext context) {
    
    final controller = Get.put(PhoneVerificationController());
    return  Obx(() => controller.isLoading == false ? PhoneVerification(
      isFirstPage: false,
      enableLogo:false,
      themeColor: Colors.blueAccent,
      backgroundColor: kLightWhite,
      initialPageText: "Verify Phone Number",
      initialPageTextStyle: appStyle(20, kPrimary, FontWeight.bold),
      textColor: kDark,
      onSend: (String value) {
        controller.setPhoneNumber = value;
        _verifyPhoneNumber(value);

      },
      onVerification: (String value) {
        _submitVerificationCode(value);
      },
    ): Center(child: CircularProgressIndicator(),));
  }

  void _verifyPhoneNumber(String phoneNumber) async {
    final controller = Get.put(PhoneVerificationController());

    await _verificationService.verifyPhoneNumber(controller.phone, codeSent: (String verificationId, int? resendToken){
      setState(() {
        _verificationId = verificationId;
      });
    }
    );
  }

  void _submitVerificationCode(String code) async{
    await _verificationService.verifySmsCode(_verificationId, code);
  }
}