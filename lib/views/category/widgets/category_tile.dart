// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hpc_food/common/app_style.dart';
import 'package:hpc_food/common/reusable_text.dart';
import 'package:hpc_food/constants/constants.dart';
import 'package:hpc_food/views/category/category_page.dart';

class CategoryTile extends StatelessWidget {
  CategoryTile({
    super.key,
    required this.category,
  });

  dynamic category;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Get.to(
          () => const CategoryPage(),
          transition: Transition.rightToLeftWithFade,
          duration: const Duration(milliseconds: 250),
        );
      },
      leading: ClipOval(
        child: Image.network(
          category['imageUrl'],
          fit: BoxFit.contain,
          width: 36.r,
          height: 36.r,
        ),
      ),
      title: ReusableText(
        text: category['title'],
        style: appStyle(12, cDark, FontWeight.normal),
      ),
      trailing: Icon(
        Icons.arrow_forward_rounded,
        color: cGray,
        size: 15.r,
      ),
    );
  }
}
