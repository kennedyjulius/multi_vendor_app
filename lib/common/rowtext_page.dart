import 'package:flutter/material.dart';
import 'package:multi_vendor_app/constants/constants.dart';
import 'package:multi_vendor_app/home/widgets/app_style.dart';
import 'package:multi_vendor_app/home/widgets/reusable_text.dart';

class RowtextPage extends StatelessWidget {

  final String first;
  final String second;
  const RowtextPage({super.key, 
  required this.first, 
  required this.second
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ReusableText(
          text: first,
          style: appStyle(13, kDark, FontWeight.w600),
        ),
        ReusableText(
          text: second,
          style: appStyle(13, kDark, FontWeight.w600),
        ),
      ],
    );
  }
}
