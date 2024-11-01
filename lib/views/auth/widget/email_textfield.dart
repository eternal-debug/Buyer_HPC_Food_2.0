import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hpc_food/common/app_style.dart';
import 'package:hpc_food/constants/constants.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField(
      {super.key,
      this.onEditingComplete,
      this.keyboardType,
      this.initialValue,
      this.controller,
      this.hintText,
      this.prefixIcon});

  final void Function()? onEditingComplete;
  final TextInputType? keyboardType;
  final String? initialValue;
  final TextEditingController? controller;
  final String? hintText;
  final Widget? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: cDark,
      textInputAction: TextInputAction.next,
      onEditingComplete: onEditingComplete,
      keyboardType: keyboardType ?? TextInputType.emailAddress,
      initialValue: initialValue,
      controller: controller,
      validator: (value) {
        if (value!.isEmpty) {
          return "Xin hãy nhập thông tin hợp lệ";
        } else {
          return null;
        }
      },
      style: appStyle(16, cDark, FontWeight.normal),
      decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: prefixIcon,
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
    );
  }
}
