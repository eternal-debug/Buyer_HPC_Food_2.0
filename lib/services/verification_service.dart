// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/foundation.dart';
// import 'package:get/get.dart';
// import 'package:hpc_food/controllers/phone_verification_controller.dart';

// class VerificationService {
//   final controller = Get.put(PhoneVerificationController());
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   Future<void> verifyPhoneNumber(String phoneNumber,
//       {required Null Function(String verificationId, int? resendToken)
//           codeSent}) async {
//     await _auth.verifyPhoneNumber(
//         phoneNumber: phoneNumber,
//         verificationCompleted: (PhoneAuthCredential credentials) async {
//           controller.verifyPhone();
//         },
//         verificationFailed: (FirebaseAuthException e) {
//           debugPrint(e.message);
//         },
//         codeSent: (String verificationId, int? resendToken) {
//           codeSent(verificationId, resendToken);
//         },
//         codeAutoRetrievalTimeout: (String verificationId) {});
//   }
// dart pub global activate flutterfire_cli

//   Future<void> verifySmsCode(String verificationId, String smsCode) async {
//     final PhoneAuthCredential credential = PhoneAuthProvider.credential(
//         verificationId: verificationId, smsCode: smsCode);

//     await _auth.signInWithCredential(credential).then((value) {
//       controller.verifyPhone();
//     });
//   }
// }