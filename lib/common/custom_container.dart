// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:hpc_food/constants/constants.dart';

class CustomContainer extends StatelessWidget {
  CustomContainer({super.key, required this.containerContent});

  Widget containerContent;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.78,
      child: Container(
        width: width,
        color: cOffWhite,
        child: SingleChildScrollView(
          child: containerContent,
        ),
      ),
    );
  }
}
