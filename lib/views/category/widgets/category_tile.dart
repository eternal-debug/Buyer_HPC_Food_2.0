// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hpc_food/common/app_style.dart';
import 'package:hpc_food/common/reusable_text.dart';
import 'package:hpc_food/constants/constants.dart';
import 'package:hpc_food/controllers/category_controller.dart';
import 'package:hpc_food/models/categories_model.dart';
import 'package:hpc_food/views/category/category_page.dart';

class CategoryTile extends StatelessWidget {
  CategoryTile({
    super.key,
    required this.category,
  });

  CategoriesModel category;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());
    return SizedBox(
      height: 80.h,
      child: ListTile(
        onTap: () {
          controller.updateCategory = category.id;
          controller.updateTitle = category.title;
          Get.to(
            () => const CategoryPage(),
            transition: Transition.rightToLeftWithFade,
            duration: const Duration(milliseconds: 250),
          );
        },
        leading: Material(
          elevation: 3,
          borderRadius: BorderRadius.circular(100),
          color: cDark,
          child: SizedBox(
            width: 65.r,
            height: 65.r,
            child: Padding(
              padding: EdgeInsets.all(10.r),
              child: Image.network(category.imageUrl, fit: BoxFit.contain),
            ),
          ),
        ),
        title: ReusableText(
          text: category.title,
          style: appStyle(20, cDark, FontWeight.normal),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios_rounded,
          color: cGray,
          size: 30.r,
        ),
      ),
    );
  }
}
