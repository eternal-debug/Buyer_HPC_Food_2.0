import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hpc_food/controllers/registration_controller.dart';
import 'package:hpc_food/models/registration_model.dart';
import 'package:hpc_food/views/auth/widget/email_textfield.dart';
import 'package:hpc_food/common/app_style.dart';
import 'package:hpc_food/common/background_container.dart';
import 'package:hpc_food/common/custom_button.dart';
import 'package:hpc_food/common/reusable_text.dart';
import 'package:hpc_food/constants/constants.dart';
import 'package:hpc_food/views/auth/widget/password_textfield.dart';
import 'package:lottie/lottie.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  late final TextEditingController _emailController = TextEditingController();
  late final TextEditingController _userController = TextEditingController();
  late final TextEditingController _passwordController =
      TextEditingController();

  final FocusNode _passwordFocusNode = FocusNode();

  String _getRandomLottieAsset() {
    final randomIndex = Random().nextInt(assets.length);
    return assets[randomIndex];
  }

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegistrationController());
    final lottieAsset = _getRandomLottieAsset();
    return Scaffold(
      backgroundColor: cPrimary,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: cPrimary,
        title: ReusableText(
            text: 'ĐĂNG KÝ', style: appStyle(20, cLightWhite, FontWeight.bold)),
      ),
      body: BackgroundContainer(
        btmL: 0,
        btmR: 0,
        color: Colors.white,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.r),
            topRight: Radius.circular(30.r),
          ),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              SizedBox(
                height: 30.h,
              ),
              SizedBox(
                width: width,
                height: 300.h,
                child: LottieBuilder.asset(
                  lottieAsset,
                  width: width,
                  height: height,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    EmailTextField(
                      hintText: 'Tên người dùng',
                      keyboardType: TextInputType.text,
                      prefixIcon: const Icon(
                        CupertinoIcons.profile_circled,
                        size: 22,
                        color: cGray,
                      ),
                      controller: _userController,
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    EmailTextField(
                      hintText: 'Email',
                      prefixIcon: const Icon(
                        CupertinoIcons.mail,
                        size: 22,
                        color: cGray,
                      ),
                      controller: _emailController,
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    PasswordTextField(
                      controller: _passwordController,
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    CustomButton(
                      text: 'Đăng ký',
                      onTap: () {
                        if (_emailController.text.isNotEmpty &&
                            _userController.text.isNotEmpty &&
                            _passwordController.text.length >= 8) {
                          RegistrationModel model = RegistrationModel(
                              username: _userController.text,
                              email: _emailController.text,
                              password: _passwordController.text);

                          String data = registrationModelToJson(model);

                          controller.registrationFunction(data);
                        }
                      },
                      btnHeight: 35.h,
                      btnWidth: width,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
