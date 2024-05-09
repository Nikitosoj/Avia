import 'package:flutter/material.dart';

class PlaceholderScreen extends StatelessWidget {
  const PlaceholderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Заглушка'),
      ),
      backgroundColor: Colors.black,
      body: const Placeholder(),
    );
  }
}
