import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lottie/lottie.dart';
import 'package:multi_vendor_app/auth/verification_page.dart';
import 'package:multi_vendor_app/common/custom_container.dart';
import 'package:multi_vendor_app/constants/constants.dart';
import 'package:multi_vendor_app/controllers/login_controller.dart';
import 'package:multi_vendor_app/home/widgets/app_style.dart';
import 'package:multi_vendor_app/home/widgets/reusable_text.dart';
import 'package:multi_vendor_app/models/login_response.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();

    LoginResponse? user;

    final controller = Get.put(LoginController());

    String? token = box.read('token');

    if (token != null) {
      user = controller.getUserInfo();
    }

    if (user != null) {
      return LoginRedirect();
    }

    if (user != null && user.verification == false) {
      return VerificationPage();
    }
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
            style: appStyle(12, kGray, FontWeight.w600))
          ],
        ),
      )
      )
      ),
    );
  }
}
