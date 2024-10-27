import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hpc_food/common/app_style.dart';
import 'package:hpc_food/common/reusable_text.dart';
import 'package:hpc_food/constants/constants.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      width: width,
      height: 110.h,
      color: cOffWhite,
      child: Container(
        margin: EdgeInsets.only(top: 20.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CircleAvatar(
                  radius: 25.r,
                  backgroundColor: cSecondary,
                  backgroundImage: const NetworkImage(
                      'https://i.pinimg.com/736x/83/ce/80/83ce8048cba3acd196ce2db255e9c53a.jpg'),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 6.h, left: 8.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ReusableText(
                        text: 'Địa chỉ của bạn',
                        style: appStyle(13, cSecondary, FontWeight.w600),
                      ),
                      SizedBox(
                        width: width * 0.65,
                        child: Text(
                          'Nguyễn Văn A, Phòng 504, Tòa nhà A',
                          overflow: TextOverflow.ellipsis,
                          style: appStyle(11, cGray, FontWeight.normal),
                        ),
                      ),
                    ],
                  ),
                ),
                Text(getTimeOfDay(), style: const TextStyle(fontSize: 35))
              ],
            ),
          ],
        ),
      ),
    );
  }

  String getTimeOfDay() {
    DateTime now = DateTime.now();
    int hour = now.hour;

    if (hour >= 0 && hour < 12) {
      return ' ☀️ ';
    } else if (hour >= 12 && hour < 16) {
      return ' ⛅ ';
    } else {
      return ' 🌙 ';
    }
  }
}
