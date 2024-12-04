import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:multi_vendor_app/auth/phone_verfication_page.dart';
import 'package:multi_vendor_app/common/custom_button.dart';
import 'package:multi_vendor_app/common/custom_text_field.dart';
import 'package:multi_vendor_app/constants/constants.dart';
import 'package:multi_vendor_app/controllers/food_controller.dart';
import 'package:multi_vendor_app/home/widgets/app_style.dart';
import 'package:multi_vendor_app/home/widgets/reusable_text.dart';
import 'package:multi_vendor_app/hooks/fetch_restaurant.dart';
import 'package:multi_vendor_app/models/food.dart';
import 'package:multi_vendor_app/models/hook_models/hook_result.dart';
import 'package:multi_vendor_app/restaurant/restaurat_page.dart';
import '../models/hook_models/additive_obs.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({super.key, required this.food, this.color});

  final FoodsModel food;
  final Color? color;

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  final PageController _pageController = PageController();
  final TextEditingController _preferences = TextEditingController();
  int _currentIndex = 0;
  // Track selected additives
  
  final foodcontroller = Get.put(FoodController()); 
  // Declare controller

  

  @override
  void dispose() {
    _pageController.dispose();
    _preferences.dispose();
    super.dispose();
  }

  

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final hookResult = useFetchRestaurants(widget.food.restaurant);
    foodcontroller.loadAdditives(widget.food.additives); // Add the missing argument

    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          _buildImageSlider(width),
          _buildDetailsSection(foodcontroller),
          _buildTagsList(),
          _buildOpenRestaurantButton(hookResult),
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
      bottom: 10,
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
      left: 12,
      child: GestureDetector(
        onTap: () => Get.back(),
        child: const Icon(
          Icons.arrow_back_ios_new,
          color: kDark,
        ),
      ),
    );
  }

  Widget _buildDetailsSection(FoodController controller) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildFoodTitleAndPrice(controller),
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
          Obx(() => Column(children: _buildAdditivesList()),),
          SizedBox(height: 20.h),
          _buildQuantitySelector(controller),
          SizedBox(height: 20.h),
          _buildPreferencesField(),
          SizedBox(height: 10.h),
          _buildPlaceOrderButton(),
        ],
      ),
    );
  }

  Widget _buildFoodTitleAndPrice(FoodController controller) {
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
            text: "\$${widget.food.price * controller.count.value}",
            style: appStyle(18, kPrimary, FontWeight.w600),
          ),
        ),
      ],
    );
  }

  Widget _buildQuantitySelector(FoodController controller) {
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
              onTap: controller.increment,
              child: const Icon(Icons.add_circle),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Obx(() => Text("${controller.count.value}")),
            ),
            GestureDetector(
              onTap: controller.decrement,
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
        controller: _preferences,
        maxLines: 3,
      ),
    );
  }

  Future<dynamic> showVerificationSheet(BuildContext) {
    return showModalBottomSheet(
      showDragHandle: true,
      backgroundColor: Colors.transparent,
      context: context, 
    builder: (context) {
      return Container(
        height: 500,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12.r),
            topRight: Radius.circular(12.r),
          ),
          color: kLightWhite,
          image: DecorationImage(
            image: AssetImage("assets/images/foodly.png"),
            fit: BoxFit.fill,
            ),
        ),
        child: Padding(
          padding: EdgeInsets.all(8.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 10.h,
              ),
              ReusableText(
                text: "Verify your Phone Number", 
                style: appStyle(18, kPrimary, FontWeight.w600)
                ),
                SizedBox(
            height: 250.h,
            child: Column( // Wrap List.generate with Column
              children: List.generate(verificationResons.length, (index) {
                return ListTile(
                  leading: Icon(Icons.check_circle_outline, color: kPrimary),
                  title: Text(
                    verificationResons[index],
                    textAlign: TextAlign.justify,
                    style: appStyle(11, kGrayLight, FontWeight.normal),
                  ),
                );
              }),
            ),
          ),

                SizedBox(height: 10.h,),

                CustomButton(
                  btnHeight: 35.h,
                  btnWidth: width, 
                  text: "Verify Phone Number",
                  onTap: () {
                    Get.to(PhoneVerficationPage());
                  },
                  )
            ],
          ),
          ),
      );
    },
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
        tristate: false,
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
              text: "\ ${additive.price}", 
              style: appStyle(11, kPrimary, FontWeight.bold),
            ),
          ],
        ),
        onChanged: (bool? value) {
          additive.toggleChecked();
          foodcontroller.getTotalPrice();
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

  Widget _buildOpenRestaurantButton(FetchHook hookResult) {
    return CustomButton(
      text: "Open Restaurant",
      onTap: () => Get.to(() => RestaurantPage(restaurant: hookResult.data)), btnWidth: width,
    );
  }

  Widget _buildPlaceOrderButton() {
    return CustomButton(
      text: "Place Order",
      onTap: () {
        // Define what happens when the button is tapped
        print("Order placed!");
      },
      btnWidth: MediaQuery.of(context).size.width,
    );
  }
}


