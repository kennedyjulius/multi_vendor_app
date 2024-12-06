// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:multi_vendor_app/constants/constants.dart';
import 'package:multi_vendor_app/home/widgets/app_style.dart';
import 'package:multi_vendor_app/home/widgets/reusable_text.dart';

class ProfileTileWidget extends StatelessWidget {
  const ProfileTileWidget({
    Key? key,
    required this.title,
    required this.icon,
    this.ontap,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final Function()? ontap;
  

  @override
  Widget build(BuildContext context) {
    return ListTile(
      visualDensity: VisualDensity.compact,
      minLeadingWidth: 0,
      onTap: ontap,
      leading: Icon(icon),
      title: ReusableText(text: title, 
      style: appStyle(11, kGray, FontWeight.normal)),
      trailing: title != "Settings" ?
      Icon(AntDesign.right, size: 16,)
      : SvgPicture.asset(
        "assets/icons/usa.svg", 
        width: 15.w, 
        height: 20.h,)
    );
  }
}
