import 'package:flutter/material.dart';
import 'package:hpc_food/common/app_style.dart';
import 'package:hpc_food/constants/constants.dart';
import 'package:phone_otp_verification/phone_verification.dart';

class PhoneVerificationPage extends StatelessWidget {
  const PhoneVerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PhoneVerification(
      isFirstPage: false,
      enableLogo: false,
      themeColor: cPrimary,
      backgroundColor: cLightWhite,
      initialPageText: 'Xác minh số điện thoại',
      initialPageTextStyle: appStyle(20, cPrimary, FontWeight.bold),
      textColor: cDark,
      onSend: (String value) {
        print('Số điện thoại: $value');
      },
      onVerification: (String value) {
        print('OTP: $value');
      },
    );
  }
}
