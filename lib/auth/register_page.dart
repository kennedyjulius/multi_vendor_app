import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:multi_vendor_app/auth/email_textfield.dart';
import 'package:multi_vendor_app/auth/login_page.dart';
import 'package:multi_vendor_app/common/custom_button.dart';
import 'package:multi_vendor_app/constants/constants.dart';
import 'package:multi_vendor_app/home/widgets/app_style.dart';
import 'package:multi_vendor_app/home/widgets/back_ground_container.dart';
import 'package:multi_vendor_app/home/widgets/reusable_text.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
   final TextEditingController _emailController = TextEditingController();
   final TextEditingController _passwordController = TextEditingController();
   final TextEditingController _confirmpasswordController = TextEditingController();
   final TextEditingController _userinitController = TextEditingController();

   final FocusNode _passwordFocusNode = FocusNode();

   @override
   void dispose() {
     _emailController.dispose();
     _passwordController.dispose();
     _passwordFocusNode.dispose();
     _confirmpasswordController.dispose();
     super.dispose();
   }

  @override
  Widget build(BuildContext context) {
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

                  SizedBox(height: 25.h,),

                EmailTextfield(

                  hintText: "Confirm Password",
                  prefixIcon: Icon(CupertinoIcons.padlock, 
                  size: 22 ,
                  color: kGrayLight,),
                  controller: _confirmpasswordController,
                  ),

                  SizedBox(height: 30,),

                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                             Get.to(LoginPage(),
                             transition: Transition.fadeIn,
                             duration: Duration(milliseconds: 1200)
                             );
                              
                            },
                            child: ReusableText(
                            text: "Login", 
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
                    text: "R E G I S T E R", 
                    onTap: () {
                    Get.to(LoginPage(), 
                    transition: Transition.cupertino, 
                    duration: Duration(milliseconds: 900)
                    );

                    if (_emailController.text.isNotEmpty && _userController.text.isNotEmpty && _passwordController.text.length >= 8) {
                      RegistrationModel model = RegistrationModel(
                        username: _userController.text,
                        email: _emailController.text,
                        password: _passwordController.text,
                      );

                      String data = registrationModelToJson(model);
                    
                    }
                  },
                  btnHeight: 35.h,
                  ),

                  SizedBox(height: 35.h,),
                  ReusableText(
                    text: "login", 
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