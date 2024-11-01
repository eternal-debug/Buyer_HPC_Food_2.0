import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hpc_food/common/app_style.dart';
import 'package:hpc_food/common/reusable_text.dart';
import 'package:hpc_food/constants/constants.dart';

class ProfileTileWidget extends StatelessWidget {
  const ProfileTileWidget(
      {super.key, required this.title, required this.icon, this.onTap});

  final String title;
  final IconData icon;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      visualDensity: VisualDensity.compact,
      minLeadingWidth: 0,
      onTap: onTap,
      leading: Icon(
        icon,
        size: 26,
      ),
      title: ReusableText(
          text: title, style: appStyle(16, cDark, FontWeight.normal)),
      trailing: title != 'Cài đặt'
          ? const Icon(
              AntDesign.right,
              size: 16,
            )
          : SvgPicture.asset(
              'assets/icons/vn.svg',
              width: 20.w,
              height: 30.h,
            ),
    );
  }
}
