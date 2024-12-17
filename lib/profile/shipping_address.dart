import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:multi_vendor_app/constants/constants.dart';
import 'package:multi_vendor_app/controllers/user_location_controller.dart';
import 'package:multi_vendor_app/home/widgets/app_style.dart';
import 'package:multi_vendor_app/home/widgets/reusable_text.dart';

class ShippingAddress extends StatefulWidget {
  const ShippingAddress({super.key});

  @override
  State<ShippingAddress> createState() => _ShippingAddressState();
}

final PageController _pageController = PageController();
GoogleMapController? _mapController;
LatLng? _selectedPosition;




class _ShippingAddressState extends State<ShippingAddress> {
  @override
void initState() {
  super.initState();
  _pageController.addListener(() {
    // Add your listener logic here if needed
  });
}
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserLocationController());
    return Scaffold(
      appBar: AppBar(
        title: ReusableText(
          text: "Shipping Address", style: appStyle(13, kDark, FontWeight.bold)),
      ),
      body: SizedBox(
        height: height,
        width: width,
        child: PageView(
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          pageSnapping: false,
          onPageChanged: (value) {
            setState(() {
              _pageController.jumpToPage(value);
            });
          },

          children: [
            Stack(
              children: [
                GoogleMap(
                  onMapCreated: (GoogleMapController controller) {
                    _mapController = controller;
                  },
                  initialCameraPosition: CameraPosition(
                  target: _selectedPosition ?? LatLng(37.785834, -122.406417),
                  zoom: 14,
                )
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}