import 'package:flutter/material.dart';

class ReccomendationsPage extends StatelessWidget {
  const ReccomendationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.3,
        title: const Text("Try Something New"),
      ),
      body: const Center(
        child: Text("Try Something NEw"),
      ),
    );
  }
}