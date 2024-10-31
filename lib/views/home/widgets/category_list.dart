import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hpc_food/common/shimmers/categories_shimmer.dart';
import 'package:hpc_food/hooks/fetch_categories.dart';
import 'package:hpc_food/model/categories_model.dart';
import 'package:hpc_food/views/home/widgets/category_widget.dart';

class CategoryList extends HookWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResults = useFetchCategories();
    List<CategoriesModel>? categoriesList = hookResults.data;
    final isLoading = hookResults.isLoading;
    final error = hookResults.error;

    return isLoading
        ? const CategoriesShimmer()
        : Container(
            height: 100.h,
            margin: EdgeInsets.only(top: 10.h),
            padding: EdgeInsets.only(left: 12.w),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                categoriesList!.length,
                (index) {
                  CategoriesModel category = categoriesList[index];
                  return CategoryWidget(category: category);
                },
              ),
            ),
          );
  }
}
