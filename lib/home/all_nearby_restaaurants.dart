import 'package:flutter/material.dart';

class AllNearbyRestaaurants extends StatelessWidget {
  const AllNearbyRestaaurants({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.3,
        title: const Text("All Nearby Restaurants"),
      ),
      body: const Center(
        child: Text("All Nearby Restaurants"),
      ),
    );
  }
}