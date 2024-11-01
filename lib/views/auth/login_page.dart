import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hpc_food/controllers/login_controller.dart';
import 'package:hpc_food/models/login_model.dart';
import 'package:hpc_food/views/auth/registration_page.dart';
import 'package:hpc_food/views/auth/widget/email_textfield.dart';
import 'package:hpc_food/common/app_style.dart';
import 'package:hpc_food/common/background_container.dart';
import 'package:hpc_food/common/custom_button.dart';
import 'package:hpc_food/common/reusable_text.dart';
import 'package:hpc_food/constants/constants.dart';
import 'package:hpc_food/views/auth/widget/password_textfield.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final TextEditingController _emailController = TextEditingController();
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
    final controller = Get.put(LoginController());
    final lottieAsset = _getRandomLottieAsset();
    return Scaffold(
      backgroundColor: cPrimary,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: cPrimary,
        title: ReusableText(
            text: 'ĐĂNG NHẬP',
            style: appStyle(20, cLightWhite, FontWeight.bold)),
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
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                              onTap: () {
                                Get.to(() => const RegistrationPage(),
                                    transition: Transition.fadeIn,
                                    duration:
                                        const Duration(milliseconds: 250));
                              },
                              child: ReusableText(
                                  text: 'Đăng ký',
                                  style: appStyle(
                                      12, Colors.blue, FontWeight.normal))),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    CustomButton(
                      text: 'Đăng nhập',
                      onTap: () {
                        if (_emailController.text.isNotEmpty &&
                            _passwordController.text.length >= 8) {
                          LoginModel model = LoginModel(
                              email: _emailController.text,
                              password: _passwordController.text);

                          String data = loginModelToJson(model);

                          controller.loginFunction(data);
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
