import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:multi_vendor_app/auth/login_page.dart';
import 'package:multi_vendor_app/auth/phone_verfication_page.dart';
import 'package:multi_vendor_app/common/custom_button.dart';
import 'package:multi_vendor_app/common/custom_text_field.dart';
import 'package:multi_vendor_app/constants/constants.dart';
import 'package:multi_vendor_app/controllers/food_controller.dart';
import 'package:multi_vendor_app/controllers/login_controller.dart';
import 'package:multi_vendor_app/home/widgets/app_style.dart';
import 'package:multi_vendor_app/home/widgets/reusable_text.dart';
import 'package:multi_vendor_app/hooks/fetch_all_restaurants.dart';
import 'package:multi_vendor_app/models/food.dart';
import 'package:multi_vendor_app/models/hook_models/hook_result.dart';
import 'package:multi_vendor_app/models/login_response.dart';
import 'package:multi_vendor_app/restaurant/restaurat_page.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({super.key, required this.food, this.color});

  final FoodsModel food;
  final Color? color;

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  final PageController _pageController = PageController();
  final TextEditingController _preferencesController = TextEditingController();
  final FoodController _foodController = Get.put(FoodController());
  final LoginController _loginController = Get.put(LoginController());

  int _currentIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    _preferencesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    LoginResponse? user = _loginController.getUserInfo();
    final double width = MediaQuery.of(context).size.width;
    final hookResult = useFetchAllRestaurants(widget.food.code);

    _foodController.loadAdditives(widget.food.additives);

    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          _buildImageSlider(width),
          _buildDetailsSection(),
          _buildTagsList(),
          _buildOpenRestaurantButton(hookResult, width),
        ],
      ),
    );
  }

  Widget _buildImageSlider(double width) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(30.r),
          ),
          child: SizedBox(
            height: 230.h,
            child: PageView.builder(
              controller: _pageController,
              itemCount: widget.food.imageUrl.length,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemBuilder: (context, i) {
                return CachedNetworkImage(
                  width: width,
                  height: 230.h,
                  fit: BoxFit.cover,
                  imageUrl: widget.food.imageUrl[i],
                  placeholder: (context, url) => const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                );
              },
            ),
          ),
        ),
        _buildPageIndicator(width),
        _buildBackButton(),
      ],
    );
  }

  Widget _buildPageIndicator(double width) {
    return Positioned(
      bottom: 10.h,
      left: width / 2 - (widget.food.imageUrl.length * 14 / 2),
      child: Row(
        children: List.generate(
          widget.food.imageUrl.length,
          (index) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 2.w),
              width: 10.w,
              height: 10.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentIndex == index ? kSecondary : kGray,
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildBackButton() {
    return Positioned(
      top: 40.h,
      left: 12.w,
      child: GestureDetector(
        onTap: () => Get.back(),
        child: const Icon(
          Icons.arrow_back_ios_new,
          color: kDark,
        ),
      ),
    );
  }

  Widget _buildDetailsSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildFoodTitleAndPrice(),
          SizedBox(height: 15.h),
          ReusableText(
            text: widget.food.description,
            style: appStyle(11, kGray, FontWeight.w400),
          ),
          SizedBox(height: 15.h),
          ReusableText(
            text: "Additives and Toppings",
            style: appStyle(18, kDark, FontWeight.w600),
          ),
          const SizedBox(height: 10),
          Obx(() => Column(children: _buildAdditivesList())),
          SizedBox(height: 20.h),
          _buildQuantitySelector(),
          SizedBox(height: 20.h),
          _buildPreferencesField(),
          SizedBox(height: 10.h),
          _buildPlaceOrderButton(),
        ],
      ),
    );
  }

  Widget _buildFoodTitleAndPrice() {
    return Row(
      children: [
        Expanded(
          child: ReusableText(
            text: widget.food.title,
            style: appStyle(18, kDark, FontWeight.w600),
          ),
        ),
        Obx(
          () => ReusableText(
            text: "\$${widget.food.price * _foodController.count.value}",
            style: appStyle(18, kPrimary, FontWeight.w600),
          ),
        ),
      ],
    );
  }

  Widget _buildQuantitySelector() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ReusableText(
          text: "Quantity",
          style: appStyle(11, kDark, FontWeight.w400),
        ),
        Row(
          children: [
            GestureDetector(
              onTap: _foodController.increment,
              child: const Icon(Icons.add_circle),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Obx(() => Text("${_foodController.count.value}")),
            ),
            GestureDetector(
              onTap: _foodController.decrement,
              child: const Icon(Icons.remove_circle),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPreferencesField() {
    return SizedBox(
      height: 65.h,
      child: CustomTextField(
        hintText: "Add your preferences",
        controller: _preferencesController,
        maxLines: 3,
      ),
    );
  }

  List<Widget> _buildAdditivesList() {
    return List.generate(widget.food.additives.length, (index) {
      final additive = widget.food.additives[index];
      return CheckboxListTile(
        contentPadding: EdgeInsets.zero,
        visualDensity: VisualDensity.compact,
        dense: true,
        activeColor: kSecondary,
        value: additive.isChanged.value,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ReusableText(
              text: additive.title,
              style: appStyle(11, kDark, FontWeight.w400),
            ),
            SizedBox(width: 5),
            ReusableText(
              text: "\${additive.price}",
              style: appStyle(11, kPrimary, FontWeight.bold),
            ),
          ],
        ),
        onChanged: (bool? value) {
          additive.toggleChecked();
          _foodController.getTotalPrice();
        },
      );
    });
  }

  Widget _buildTagsList() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Wrap(
        spacing: 8.0,
        children: widget.food.foodTags.map((tag) {
          return Chip(
            label: Text(tag),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildOpenRestaurantButton(HookResult hookResult, double width) {
    return CustomButton(
      text: "Open Restaurant",
      onTap: () => Get.to(() => RestaurantPage(restaurant: hookResult.data)),
      btnWidth: width,
    );
  }

  Widget _buildPlaceOrderButton() {
    return Container(
      color: kPrimary,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              LoginResponse? user;
              user = _loginController.getUserInfo();
              if (user == null) {
                Get.to(LoginPage());
              } else if (user.phoneVerification == false) {
                _showVerificationSheet();
              } else {
                _placeOrder();
              }
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: ReusableText(
                text: "Place Order",
                style: appStyle(18, kLightWhite, FontWeight.w600),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: CircleAvatar(
              backgroundColor: kSecondary,
              radius: 20.r,
              child: Icon(Ionicons.cart, color: kOffWhite),
            ),
          ),
        ],
      ),
    );
  }

  void _showVerificationSheet() {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Container(
          height: 500.h,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12.r),
              topRight: Radius.circular(12.r),
            ),
            color: kLightWhite,
            image: const DecorationImage(
              image: AssetImage("assets/images/foodly.png"),
              fit: BoxFit.fill,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(8.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 10.h),
                ReusableText(
                  text: "Verify your Phone Number",
                  style: appStyle(18, kPrimary, FontWeight.w600),
                ),
                SizedBox(height: 250.h),
                CustomButton(
                  btnHeight: 35.h,
                  btnWidth: MediaQuery.of(context).size.width,
                  text: "Verify Phone Number",
                  onTap: () => Get.to(PhoneVerficationPage()),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _placeOrder() {
    // Implement order placement logic here
  }
}
