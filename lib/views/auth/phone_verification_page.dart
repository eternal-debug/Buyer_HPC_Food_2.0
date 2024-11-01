// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:hpc_food/common/app_style.dart';
// import 'package:hpc_food/constants/constants.dart';
// import 'package:hpc_food/controllers/phone_verification_controller.dart';
// import 'package:hpc_food/services/verification_service.dart';
// import 'package:phone_otp_verification/phone_verification.dart';

// class PhoneVerificationPage extends StatefulWidget {
//   const PhoneVerificationPage({super.key});

//   @override
//   State<PhoneVerificationPage> createState() => _PhoneVerificationPageState();
// }

// class _PhoneVerificationPageState extends State<PhoneVerificationPage> {
//   final VerificationService _verificationService = VerificationService();

//   String _verificationId = '';

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(PhoneVerificationController());
//     return Obx(() => controller.isLoading == false
//         ? PhoneVerification(
//             isFirstPage: false,
//             enableLogo: false,
//             themeColor: cPrimary,
//             backgroundColor: cLightWhite,
//             initialPageText: 'Xác minh số điện thoại',
//             initialPageTextStyle: appStyle(20, cPrimary, FontWeight.bold),
//             textColor: cDark,
//             onSend: (String value) {
//               controller.setPhoneNumber = value;
//               _verifyPhoneNumber(value);
//             },
//             onVerification: (String value) {
//               _submitVerificationCode(value);
//             },
//           )
//         : Container(
//             color: cLightWhite,
//             width: width,
//             height: height,
//             child: const Center(
//               child: CircularProgressIndicator(),
//             ),
//           ));
//   }

//   void _verifyPhoneNumber(String phoneNumber) async {
//     final controller = Get.put(PhoneVerificationController());

//     await _verificationService.verifyPhoneNumber(controller.phone,
//         codeSent: (String verificationId, int? resendToken) {
//       setState(() {
//         _verificationId = verificationId;
//       });
//     });
//   }

//   void _submitVerificationCode(String code) async {
//     await _verificationService.verifySmsCode(_verificationId, code);
//   }
// }
