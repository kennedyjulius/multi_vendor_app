import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:multi_vendor_app/constants/constants.dart';
import 'package:multi_vendor_app/controllers/user_location_controller.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final UserLocationController controller = Get.put(UserLocationController());
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 12.w,
        vertical: 6.h,
      ),
      height: 110.h,
      width: width,
      color: kOffWhite,
      child: Container(
        margin: EdgeInsets.only(
          top: 20.h,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 25.r,
                  backgroundColor: kSecondary,
                  backgroundImage: const NetworkImage("https://d326fntlu7tb1e.cloudfront.net/uploads/bdec9d7d-0544-4fc4-823d-3b898f6dbbbf"),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    bottom: 6.h,
                    left: 12.w,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Deliver to",
                        style: TextStyle(
                          fontSize: 13,
                          color: kSecondary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Obx(() => SizedBox(
                        width: width * 0.65,
                        child: Text(
                          controller.address.isEmpty
                              ? "16768 21st Ave N, MN 55447"
                              : controller.address,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 11,
                            color: kGrayLight,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      )),
                    ],
                  ),
                ),
              ],
            ),
            Text(
              getTimeOfDay(),
              style: const TextStyle(
                fontSize: 35,
              ),
            )
          ],
        ),
      ),
    );
  }

  String getTimeOfDay() {
    DateTime now = DateTime.now();
    int hour = now.hour;
    if (hour >= 0 && hour < 12) {
      return ' * ';
    } else if (hour >= 12 && hour < 16) {
      return ' ⛅ ';
    } else {
      return '🌙';
    }
  }
}