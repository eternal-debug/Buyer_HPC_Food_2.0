import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hpc_food/constants/constants.dart';
import 'package:lottie/lottie.dart';
import 'dart:math';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  String _getRandomLottieAsset() {
    final randomIndex = Random().nextInt(assets.length);
    return assets[randomIndex];
  }

  @override
  Widget build(BuildContext context) {
    final lottieAsset = _getRandomLottieAsset();

    return SizedBox(
      width: width,
      height: height,
      child: Padding(
        padding: EdgeInsets.only(bottom: 260.h),
        child: LottieBuilder.asset(
          lottieAsset,
          width: width,
          height: height / 2,
        ),
      ),
    );
  }
}
