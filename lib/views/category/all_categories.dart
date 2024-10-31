import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hpc_food/common/app_style.dart';
import 'package:hpc_food/common/background_container.dart';
import 'package:hpc_food/common/reusable_text.dart';
import 'package:hpc_food/common/shimmers/foodlist_shimmer.dart';
import 'package:hpc_food/constants/constants.dart';
import 'package:hpc_food/hooks/fetch_all_categories.dart';
import 'package:hpc_food/model/categories_model.dart';
import 'package:hpc_food/views/category/widgets/category_tile.dart';

class AllCategories extends HookWidget {
  const AllCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResult = useFetchAllCategories();
    List<CategoriesModel>? categoriesList = hookResult.data;
    final isLoading = hookResult.isLoading;
    final error = hookResult.error;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: cOffWhite,
        title: ReusableText(
          text: 'Tất cả danh mục',
          style: appStyle(
            18,
            cDark,
            FontWeight.w600,
          ),
        ),
      ),
      body: BackgroundContainer(
        color: cOffWhite,
        child: Container(
          padding: EdgeInsets.only(left: 12.w, top: 10.h),
          height: height,
          child: isLoading
              ? const FoodsListShimmer()
              : ListView.builder(
                  itemCount: categoriesList!.length,
                  itemBuilder: (context, i) {
                    var category = categoriesList[i];
                    return CategoryTile(category: category);
                  },
                ),
        ),
      ),
    );
  }
}
