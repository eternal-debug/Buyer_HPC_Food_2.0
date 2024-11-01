// ignore_for_file: depend_on_referenced_packages

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hpc_food/common/app_style.dart';
import 'package:hpc_food/common/custom_button.dart';
import 'package:hpc_food/common/custom_container.dart';
import 'package:hpc_food/common/reusable_text.dart';
import 'package:hpc_food/constants/constants.dart';
import 'package:hpc_food/controllers/login_controller.dart';
import 'package:hpc_food/controllers/verification_controller.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class VerificationPage extends StatelessWidget {
  const VerificationPage({super.key});

  String _getRandomLottieAsset() {
    final randomIndex = Random().nextInt(assets.length);
    return assets[randomIndex];
  }

  @override
  Widget build(BuildContext context) {
    final verificationController = Get.put(VerificationController());
    final loginController = Get.put(LoginController());
    final lottieAsset = _getRandomLottieAsset();
    return Scaffold(
      backgroundColor: cPrimary,
      appBar: AppBar(
        title: ReusableText(
            text: 'Hãy xác minh tài khoản',
            style: appStyle(20, cOffWhite, FontWeight.bold)),
        centerTitle: true,
        backgroundColor: cPrimary,
        elevation: 0,
      ),
      body: CustomContainer(
        color: cOffWhite,
        containerContent: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SizedBox(
                height: 636.h,
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    SizedBox(
                      width: width,
                      height: 300.h,
                      child: LottieBuilder.asset(
                        lottieAsset,
                        width: width,
                        height: height,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    ReusableText(
                        text: 'Nhập mã OTP',
                        style: appStyle(20, cPrimary, FontWeight.w600)),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text('Mã OTP đã được gửi đến email của bạn',
                        textAlign: TextAlign.justify,
                        style: appStyle(12, cDark, FontWeight.normal)),
                    SizedBox(
                      height: 20.h,
                    ),
                    OtpTextField(
                      numberOfFields: 6,
                      borderColor: cPrimary,
                      borderWidth: 2.0,
                      textStyle: appStyle(18, cPrimary, FontWeight.w500),
                      onCodeChanged: (String code) {},
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      onSubmit: (String verificationCode) {
                        verificationController.setCode = verificationCode;
                      },
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomButton(
                      text: 'Xác minh',
                      onTap: () {
                        verificationController.verificationFunction();
                      },
                      btnHeight: 35.h,
                      btnWidth: width,
                    ),
                  ],
                ),
              ),
            ),
            CustomButton(
              onTap: () {
                loginController.logout();
              },
              btnColor: cRed,
              text: 'Đăng xuất',
              radius: 0,
            )
          ],
        ),
      ),
    );
  }
}
