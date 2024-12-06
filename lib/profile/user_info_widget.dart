import 'package:flutter/material.dart';

class UserInfoWidget extends StatelessWidget {
  const UserInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    // Define colors (replace with your actual constants)
    const Color kPrimary = Colors.blue; // Example color

    return Container(
      height: height * 0.06,
      width: width,
      color: kPrimary,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(12, 0, 16, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Example child widgets
                Text(
                  'User Name',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                Icon(Icons.person, color: Colors.white),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
