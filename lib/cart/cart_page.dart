import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lottie/lottie.dart';
import 'package:multi_vendor_app/auth/verification_page.dart';
// ignore: unused_import
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

    // Check token and retrieve user info
    String? token = box.read('token');
    if (token != null) {
      user = controller.getUserInfo();
    }

    // Redirect if user is logged in but not verified
    if (user != null && user.verification == false) {
      return const VerificationPage();
    }

    // Show a login prompt if user is not logged in
    if (user == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            "Cart",
            style: appStyle(20, kLightWhite, FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                'assets/animations/empty_cart.json',
                width: 200.w,
                height: 200.h,
              ),
              SizedBox(height: 20.h),
              ReusableText(
                text: "Your cart is empty!",
                style: appStyle(18, kLightWhite, FontWeight.normal),
              ),
              SizedBox(height: 20.h),
              ElevatedButton(
                onPressed: () {
                  Get.toNamed('/login');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimary,
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                ),
                child: Text(
                  "Log In",
                  style: appStyle(16, kLightWhite, FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      );
    }

    // Main cart content if user is logged in and verified
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cart",
          style: appStyle(20, kLightWhite, FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: ReusableText(
          text: "Your cart items will be displayed here.",
          style: appStyle(18, kLightWhite, FontWeight.normal),
        ),
      ),
    );
  }
}
