import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:multi_vendor_app/cart/cart_page.dart';
import 'package:multi_vendor_app/constants/constants.dart';
import 'package:multi_vendor_app/controllers/tab_index_controller.dart';
import 'package:multi_vendor_app/home/home_page.dart';
import 'package:multi_vendor_app/profile/profile_page.dart';
import 'package:multi_vendor_app/search/search_page.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  List<Widget>  pageList = [
    const HomePage(),
    const SearchPage(),
    const CartPage(),
    const ProfilePage(),
  ];
 
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TabIndexController());
    return Obx(() => Scaffold(
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
                    selectedIconTheme: IconThemeData(
                      color: kSecondary,
                    ),
                    unselectedIconTheme: IconThemeData(
                      color: Colors.black38,
                    ),
                    onTap: (value) {
                      controller.SetTabIndex = value;
                    },
                    currentIndex: controller.tabIndex,
                    items: [
                      BottomNavigationBarItem(
                          icon: controller.tabIndex ==0 
                          ? Icon(AntDesign.appstore1)
                          : Icon(AntDesign.appstore_o)
                          ),
                      BottomNavigationBarItem(
                          icon: Icon(FontAwesome.search), label: 'Search'),
                      BottomNavigationBarItem(
                          icon: Badge(
                            label: Text("1"),
                            child: Icon(FontAwesome.opencart)), label: 'Cart'),
                      BottomNavigationBarItem(
                          icon: controller.tabIndex == 3 ?
                          Icon(FontAwesome.user_circle)
                          : Icon(FontAwesome.user_circle_o),
                          label: "Profile"
                          ),
                    ])),
          )
        ],
      ),
    ),);
    
  }
}
