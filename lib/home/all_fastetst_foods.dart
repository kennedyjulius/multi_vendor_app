import 'package:flutter/material.dart';

class AllFastetstFoods extends StatelessWidget {
  const AllFastetstFoods({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.3,
        title: const Text("Foods closer to you"),
      ),
      body: const Center(
        child: Text("Foods closer to you"),
      ),
    );
  }
}