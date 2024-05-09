import 'package:flutter/material.dart';

import 'presentation/body_search.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodySearch(
        toController: TextEditingController(),
        fromController: TextEditingController(),
      ),
    );
  }
}
