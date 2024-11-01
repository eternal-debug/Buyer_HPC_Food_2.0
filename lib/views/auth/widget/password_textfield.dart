import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hpc_food/common/app_style.dart';
import 'package:hpc_food/constants/constants.dart';
import 'package:hpc_food/controllers/password_controller.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({
    super.key,
    this.controller,
  });

  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    final passwordController = Get.put(PasswordController());
    return Obx(() => TextFormField(
          cursorColor: cDark,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.visiblePassword,
          controller: controller,
          obscureText: passwordController.password,
          validator: (value) {
            if (value!.isEmpty) {
              return "Hãy nhập mật khẩu hợp lệ";
            } else {
              return null;
            }
          },
          style: appStyle(16, cDark, FontWeight.normal),
          decoration: InputDecoration(
              hintText: "Mật khẩu",
              prefixIcon: const Icon(
                CupertinoIcons.lock_circle,
                size: 26,
                color: cGray,
              ),
              suffixIcon: GestureDetector(
                onTap: () {
                  passwordController.setPassword = !passwordController.password;
                },
                child: Icon(
                  passwordController.password
                      ? Icons.visibility
                      : Icons.visibility_off,
                  size: 26,
                  color: cGray,
                ),
              ),
              isDense: true,
              contentPadding: EdgeInsets.all(6.h),
              hintStyle: appStyle(16, cGray, FontWeight.normal),
              errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: cRed, width: .5),
                  borderRadius: BorderRadius.all(Radius.circular(12.r))),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: cPrimary, width: .5),
                  borderRadius: BorderRadius.all(Radius.circular(12.r))),
              focusedErrorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: cRed, width: .5),
                  borderRadius: BorderRadius.all(Radius.circular(12.r))),
              disabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: cGray, width: .5),
                  borderRadius: BorderRadius.all(Radius.circular(12.r))),
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: cPrimary, width: .5),
                  borderRadius: BorderRadius.all(Radius.circular(12.r))),
              border: OutlineInputBorder(
                  borderSide: const BorderSide(color: cPrimary, width: .5),
                  borderRadius: BorderRadius.all(Radius.circular(12.r)))),
        ));
  }
}
