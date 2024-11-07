import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_vendor_app/common/custom_container.dart';
import 'package:multi_vendor_app/common/custom_text_field.dart';
import 'package:multi_vendor_app/constants/constants.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimary,
      appBar: AppBar(
        toolbarHeight: 74.h,
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: kOffWhite,
        title: Padding(
          padding: EdgeInsets.only(top: 12.h),
          child: CustomTextField(
            controller: _searchController,
            keyboardType: TextInputType.text,
            hintText: "Search For Foods",
            suffixIcon: GestureDetector(
              onTap: () {
                
              },
              child: Icon(Icons.search, color: kGray, size: 40.h,),
            ),
            
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 130.h,
              color: Colors.grey[200], // example styling for visibility
              child: Center(child: Text("Search Results Area")),
            ),
            Expanded(
              child: CustomContainer(
                containerContent: Container(
                  child: Text("Additional content goes here"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
