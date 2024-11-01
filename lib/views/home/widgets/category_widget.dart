// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hpc_food/common/app_style.dart';
import 'package:hpc_food/common/reusable_text.dart';
import 'package:hpc_food/constants/constants.dart';
import 'package:hpc_food/controllers/category_controller.dart';
import 'package:hpc_food/models/categories_model.dart';
import 'package:hpc_food/views/category/all_categories.dart';

class CategoryWidget extends StatelessWidget {
  CategoryWidget({
    super.key,
    required this.category,
  });

  CategoriesModel category;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());
    return GestureDetector(
      onTap: () {
        if (controller.categoryValue == category.id) {
          controller.updateCategory = '';
          controller.updateTitle = '';
        } else if (category.value == 'all') {
          Get.to(
            () => const AllCategories(),
            transition: Transition.fadeIn,
            duration: const Duration(milliseconds: 200),
          );
        } else {
          controller.updateCategory = category.id;
          controller.updateTitle = category.title;
        }
      },
      child: Obx(
        () => Container(
          margin: EdgeInsets.only(right: 5.w),
          padding: EdgeInsets.only(top: 4.w),
          width: width * 0.23,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: controller.categoryValue == category.id
                ? cGrayLight
                : cOffWhite,
          ),
          child: Column(
            children: [
              SizedBox(
                height: 60.h,
                child: Image.network(
                  category.imageUrl,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.error);
                  },
                ),
              ),
              SizedBox(height: 4.h),
              ReusableText(
                text: category.title,
                style: appStyle(
                  16,
                  cDark,
                  FontWeight.normal,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
