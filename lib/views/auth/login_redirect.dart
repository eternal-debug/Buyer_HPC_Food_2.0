import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hpc_food/views/auth/login_page.dart';
import 'package:hpc_food/common/app_style.dart';
import 'package:hpc_food/common/custom_button.dart';
import 'package:hpc_food/common/custom_container.dart';
import 'package:hpc_food/common/reusable_text.dart';
import 'package:hpc_food/constants/constants.dart';
import 'package:lottie/lottie.dart';

class LoginRedirect extends StatelessWidget {
  const LoginRedirect({super.key});

  String _getRandomLottieAsset() {
    final randomIndex = Random().nextInt(assets.length);
    return assets[randomIndex];
  }

  @override
  Widget build(BuildContext context) {
    final lottieAsset = _getRandomLottieAsset();
    return Scaffold(
      backgroundColor: cPrimary,
      appBar: AppBar(
        backgroundColor: cPrimary,
        elevation: 0,
        title: ReusableText(
          text: 'Hãy đăng nhập để tiếp tục',
          style: appStyle(18, cLightWhite, FontWeight.w600),
        ),
      ),
      body: SafeArea(
        child: CustomContainer(
            height: 700.h,
            containerContent: Column(
              children: [
                Container(
                  width: width,
                  height: 550.h,
                  color: Colors.white,
                  child: LottieBuilder.asset(
                    lottieAsset,
                    width: width,
                    height: height,
                  ),
                ),
                CustomButton(
                  text: 'Đăng nhập',
                  onTap: () {
                    Get.to(() => const LoginPage(),
                        transition: Transition.cupertino,
                        duration: const Duration(milliseconds: 250));
                  },
                  btnHeight: 40.h,
                  btnWidth: width - 20,
                )
              ],
            )),
      ),
    );
  }
}
