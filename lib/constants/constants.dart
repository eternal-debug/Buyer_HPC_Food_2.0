import 'dart:io';
import 'dart:ui';

import 'package:flutter_screenutil/flutter_screenutil.dart';

String googleApiKey = '';

// const cPrimary = Color(0xFF30b9b2);
// const cPrimaryLight = Color(0xFF40F3EA);
// const cSecondary = Color(0xffffa44f);
// const cSecondaryLight = Color(0xFFffe5db);
// const cTertiary = Color(0xff0078a6);
// const cGray = Color(0xff83829A);
// const cGrayLight = Color(0xffC1C0C8);
// const cLightWhite = Color(0xffFAFAFC);
// const cWhite = Color(0xfffFFFFF);
// const cDark = Color(0xff000000);
// const cRed = Color(0xffe81e4d);
// const cOffWhite = Color(0xffF3F4F8);

const cPrimary = Color(0xFF6C63FF);
const cPrimaryLight = Color(0xFF8A85FF);
const cSecondary = Color(0xFFFFC107);
const cSecondaryLight = Color(0xFFFFE082);
const cTertiary = Color(0xFF29B6F6);
const cGray = Color(0xFFB0BEC5);
const cGrayLight = Color(0xFFCFD8DC);
const cLightWhite = Color(0xFFF0F4F8);
const cWhite = Color(0xFFFFFFFF);
const cDark = Color(0xFF212121);
const cRed = Color(0xFFFF5252);
const cOffWhite = Color(0xFFF5F5F5);

// const cPrimary = Color(0xFF64B5F6);
// const cPrimaryLight = Color(0xFFBBDEFB);
// const cSecondary = Color(0xFFFFD54F);
// const cSecondaryLight = Color(0xFFFFF9C4);
// const cTertiary = Color(0xFF4DB6AC);
// const cGray = Color(0xFF90A4AE);
// const cGrayLight = Color(0xFFCFD8DC);
// const cLightWhite = Color(0xFFF5F5F5);
// const cWhite = Color(0xFFFFFFFF);
// const cDark = Color(0xFF37474F);
// const cRed = Color(0xFFE57373);
// const cOffWhite = Color(0xFFFAFAFA);

double height = 825.h;
double width = 375.w;

String appBaseUrl =
    Platform.isAndroid ? "http://10.0.2.2:6013" : "http://localhost:6013";

final List<String> verificationReasons = [
  'Cập nhật nhanh chóng: Nhận thông báo tức thì về trạng thái đơn hàng.',
  'Liên lạc trực tiếp: Số điện thoại xác minh giúp giao tiếp dễ dàng hơn.',
  'Bảo mật cao: Bảo vệ tài khoản và xác nhận đơn hàng an toàn.',
  'Dễ dàng thay đổi: Xử lý các vấn đề nhanh chóng qua một cuộc gọi.',
  'Ưu đãi đặc biệt: Nhận thông tin về các khuyến mãi và ưu đãi hấp dẫn.'
];
