import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:multi_vendor_app/auth/email_textfield.dart';
import 'package:multi_vendor_app/auth/login_page.dart';
import 'package:multi_vendor_app/common/custom_button.dart';
import 'package:multi_vendor_app/constants/constants.dart';
import 'package:multi_vendor_app/controllers/registration_controller.dart';
import 'package:multi_vendor_app/home/widgets/app_style.dart';
import 'package:multi_vendor_app/home/widgets/back_ground_container.dart';
import 'package:multi_vendor_app/home/widgets/reusable_text.dart';
import 'package:multi_vendor_app/models/registration_model.dart';
import 'package:multi_vendor_app/models/regitration_model.dart'; // Ensure this import is included for RegistrationModel

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmpasswordController = TextEditingController();
  final TextEditingController _userController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmpasswordController.dispose();
    _userController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegistrationController());
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: kPrimary,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kSecondary,
        title: Center(
          child: ReusableText(
            text: "Foodly Family",
            style: appStyle(20, kLightWhite, FontWeight.bold),
          ),
        ),
      ),
      body: BackGroundContainer(
        color: kPrimary,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.r),
            topRight: Radius.circular(30.r),
          ),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              SizedBox(height: 30),
              LottieBuilder.asset("assets/anime/delivery.json"),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    EmailTextfield(
                      hintText: "Enter Email",
                      prefixIcon: Icon(
                        CupertinoIcons.mail,
                        size: 22,
                        color: kGrayLight,
                      ),
                      controller: _emailController,
                    ),
                    SizedBox(height: 25.h),
                    EmailTextfield(
                      hintText: "Enter Password",
                      prefixIcon: Icon(
                        CupertinoIcons.padlock,
                        size: 22,
                        color: kGrayLight,
                      ),
                      controller: _passwordController,
                      obscureText: true, // For password input
                    ),
                    SizedBox(height: 25.h),
                    EmailTextfield(
                      hintText: "Confirm Password",
                      prefixIcon: Icon(
                        CupertinoIcons.padlock,
                        size: 22,
                        color: kGrayLight,
                      ),
                      controller: _confirmpasswordController,
                      obscureText: true, // For password input
                    ),
                    SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.to(
                                LoginPage(),
                                transition: Transition.fadeIn,
                                duration: Duration(milliseconds: 1200),
                              );
                            },
                            child: ReusableText(
                              text: "Login",
                              style: appStyle(12, Colors.blue, FontWeight.normal),
                            ),
                          ),
                        ],
                      ),
                    ),
                    CustomButton(
                      btnWidth: width,
                      text: "R E G I S T E R",
                      onTap: () {
                        if (_emailController.text.isNotEmpty &&
                            _userController.text.isNotEmpty &&
                            _passwordController.text.isNotEmpty &&
                            _passwordController.text == _confirmpasswordController.text) {
                          RegistrationModel model = RegistrationModel(
                            name: _userController.text,
                            email: _emailController.text,
                            password: _passwordController.text,
                          );

                          String data = registrationModelToJson(model);
                          controller.registrationFunction(data);
                        } else {
                          Get.snackbar(
                            "Error",
                            "Please fill in all fields correctly",
                            colorText: kLightWhite,
                            backgroundColor: kRed,
                          );
                        }
                      },
                      btnHeight: 35.h,
                    ),
                    SizedBox(height: 35.h),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
