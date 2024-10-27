import 'package:flutter/material.dart';
import 'package:hpc_food/constants/constants.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: cOffWhite,
        title: const Text('category page'),
      ),
      body: const Text('data'),
    );
  }
}
