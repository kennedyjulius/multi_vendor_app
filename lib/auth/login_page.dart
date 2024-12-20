import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:multi_vendor_app/auth/email_textfield.dart';
import 'package:multi_vendor_app/common/custom_button.dart';
import 'package:multi_vendor_app/constants/constants.dart';
import 'package:multi_vendor_app/controllers/login_controller.dart';
import 'package:multi_vendor_app/home/widgets/app_style.dart';
import 'package:multi_vendor_app/home/widgets/back_ground_container.dart';
import 'package:multi_vendor_app/home/widgets/reusable_text.dart';
import 'package:multi_vendor_app/models/login_model.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
   final TextEditingController _emailController = TextEditingController();
   final TextEditingController _passwordController = TextEditingController();

   final FocusNode _passwordFocusNode = FocusNode();

   @override
   void dispose() {
     _emailController.dispose();
     _passwordController.dispose();
     _passwordFocusNode.dispose();
     super.dispose();
   }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Scaffold(
      backgroundColor: kPrimary,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kSecondary,
        title: Center(
          child: ReusableText(
            text: "Foodly Family", 
          style: appStyle(20, kLightWhite, FontWeight.bold)
          ),
        ),
      ),
      body: BackGroundContainer(
        color: kPrimary, 
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.r),
            topRight: Radius.circular(30.r)
          ),
          child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(height: 30,),
            LottieBuilder.asset("assets/anime/delivery.json"),
            Padding(padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                EmailTextfield(

                  hintText: "Enter Email",
                  prefixIcon: Icon(CupertinoIcons.mail, size: 22 ,color: kGrayLight,),
                  controller: _emailController,
                  ),

                  SizedBox(height: 25.h,),

                EmailTextfield(

                  hintText: "Enter Password",
                  prefixIcon: Icon(CupertinoIcons.padlock, size: 22 ,color: kGrayLight,),
                  controller: _passwordController,
                  ),

                  SizedBox(height: 30,),

                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              
                            },
                            child: ReusableText(
                            text: "Register", 
                                              style: appStyle(12, 
                                              Colors.blue, 
                                              FontWeight.normal),
                                              ),
                          ),
                        ],
                      ),
                    ),

                  CustomButton(
                    btnWidth: width, 
                    text: "L O G I N", 
                    onTap: () {
                    Get.to(LoginPage(), 
                    transition: Transition.fadeIn, 
                    duration: Duration(milliseconds: 900)
                    );
                    if (_emailController.text.isNotEmpty && _passwordController.text.length >= 8) {
                      LoginModel model = LoginModel(
                        email: _emailController.text, 
                        password: _passwordController.text
                        );

                        String data = loginModelToJson(model);
                        controller.loginFunction(data as Map<String, dynamic>);
                    
                    }
                  },
                  btnHeight: 35.h,
                  ),

                  SizedBox(height: 30.h,),
                  ReusableText(
                    text: "Register", 
                  style: appStyle(12, 
                  Colors.blue, 
                  FontWeight.normal),
                  ),
              ],
            ),
            )
          ],
                ),
        )
      )
    );
  }
}