// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:multi_vendor_app/categories/allcategories_page.dart';
// import 'package:multi_vendor_app/constants/constants.dart';
// import 'package:multi_vendor_app/constants/uidata.dart'; // Ensure this file has 'categories' data defined
// import 'package:multi_vendor_app/controllers/category_controller.dart';

// class CategoryList extends StatelessWidget {
//   const CategoryList({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(CategoryController());
//     return Container(
//       height: 80.h,
//       padding: EdgeInsets.only(
//         left: 12.w,
//         top: 10.h,
//       ),
//       child: ListView(
//         scrollDirection: Axis.horizontal,
//         children: List.generate(
//           categories.length,
//           (i) {
//             var category = categories[i];

//             return GestureDetector(
//               onTap: () {
//                 if (controller.categoryValue == category['_id']) {
//                   controller.updateCategory('');
//                   controller.updateTitle('');
//                 } else if (category['title'] == 'More') {
//                   Get.to(() => const AllCategories()); // Ensure AllCategories() is navigable
//                 } else {
//                   controller.updateCategory(category['_id']);
//                   controller.updateTitle(category['title']);
//                 }
//               },
//               child: Obx(
//                 () => Container(
//                   margin: EdgeInsets.only(right: 5.w), // Replace EdgeI with EdgeInsets
//                   padding: EdgeInsets.only(top: 4.h),
//                   width: MediaQuery.of(context).size.width * 0.19, // Use context size instead of 'width'
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10.r),
//                     border: Border.all(
//                       color: controller.categoryValue == category['_id'] ? kSecondary : kWhite,
//                       width: 1.w,
//                     ),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey.withOpacity(0.5),
//                         spreadRadius: 2,
//                         blurRadius: 5,
//                         offset: const Offset(0, 3),
//                       ),
//                     ],
//                   ),
//                   child: Column(
//                     children: [
//                       SizedBox(
//                         height: 35.h,
//                         child: Image.network(
//                           category['imageUrl'] ?? '', // Ensure 'imageUrl' is not null
//                           fit: BoxFit.contain,
//                           errorBuilder: (context, error, stackTrace) {
//                             return const Icon(Icons.broken_image);
//                           },
//                         ),
//                       ),
//                       Text(
//                         category['title'] ?? 'Unknown', // Ensure 'title' is not null
//                         style: TextStyle(
//                           color: kDark,
//                           fontSize: 12.sp,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
