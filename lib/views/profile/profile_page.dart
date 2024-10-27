import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hpc_food/common/custom_container.dart';
import 'package:hpc_food/constants/constants.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cPrimary,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(130.h),
        child: Container(
          height: 130,
        ),
      ),
      body: SafeArea(child: CustomContainer(containerContent: Container())),
    );
  }
}
