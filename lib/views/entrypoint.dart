import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart'; // Replace get_core and get_state_manager with get
import 'package:multi_vendor_app/cart/cart_page.dart';
import 'package:multi_vendor_app/constants/constants.dart';
import 'package:multi_vendor_app/controllers/tab_index_controller.dart';
import 'package:multi_vendor_app/home/home_page.dart';
import 'package:multi_vendor_app/profile/profile_page.dart';
import 'package:multi_vendor_app/search/search_page.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final List<Widget> pageList = [
    const HomePage(),
    const SearchPage(),
    const CartPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TabIndexController());

    return Obx(
      () => Scaffold(
        body: Stack(
          children: [
            pageList[controller.tabIndex],
            Align(
              alignment: Alignment.bottomCenter,
              child: Theme(
                data: Theme.of(context).copyWith(canvasColor: kPrimary),
                child: BottomNavigationBar(
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  selectedIconTheme: const IconThemeData(
                    color: kSecondary,
                  ),
                  unselectedIconTheme: const IconThemeData(
                    color: Colors.black38,
                  ),
                  onTap: (value) {
                    // Debugging print to check if this is being called
                    print("Tab clicked: $value");

                    // Update the tab index
                    controller.tabIndex = value;
 // Use correct setter method name
                  },
                  currentIndex: controller.tabIndex,
                  items: [
                    BottomNavigationBarItem(
                      label: "Home",
                      icon: controller.tabIndex == 0
                          ? const Icon(AntDesign.appstore1)
                          : const Icon(AntDesign.appstore_o),
                    ),
                    const BottomNavigationBarItem(
                        icon: Icon(FontAwesome.search), label: 'Search'),
                    const BottomNavigationBarItem(
                        icon: Badge(
                            label: Text("1"),
                            child: Icon(FontAwesome.opencart)),
                        label: 'Cart'),
                    BottomNavigationBarItem(
                      icon: controller.tabIndex == 3
                          ? const Icon(FontAwesome.user_circle)
                          : const Icon(FontAwesome.user_circle_o),
                      label: "Profile",
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
