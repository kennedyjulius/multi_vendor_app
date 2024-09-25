import 'package:flutter/material.dart';

class AllFastetstFoods extends StatelessWidget {
  const AllFastetstFoods({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.3,
        title: Text("Foods closer to you"),
      ),
      body: Center(
        child: Text("Foods closer to you"),
      ),
    );
  }
}