import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hpc_food/common/app_style.dart';
import 'package:hpc_food/common/reusable_text.dart';
import 'package:hpc_food/constants/constants.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: cOffWhite,
      elevation: 0,
      actions: [
        GestureDetector(
          onTap: () {},
          child: Padding(
            padding: EdgeInsets.only(right: 12.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/icons/vn.svg',
                  width: 15.w,
                  height: 25.h,
                ),
                SizedBox(
                  width: 5.w,
                ),
                Container(
                  width: 1.w,
                  height: 15.h,
                  color: cGrayLight,
                ),
                SizedBox(
                  width: 5.w,
                ),
                ReusableText(
                    text: 'VN', style: appStyle(16, cDark, FontWeight.normal)),
                SizedBox(
                  width: 5.w,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 4.h),
                    child: Icon(
                      SimpleLineIcons.settings,
                      size: 16.h,
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
