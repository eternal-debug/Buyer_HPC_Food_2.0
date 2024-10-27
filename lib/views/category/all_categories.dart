import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hpc_food/common/app_style.dart';
import 'package:hpc_food/common/background_container.dart';
import 'package:hpc_food/common/reusable_text.dart';
import 'package:hpc_food/constants/constants.dart';
import 'package:hpc_food/constants/uidata.dart';
import 'package:hpc_food/views/category/widgets/category_tile.dart';

class AllCategories extends StatelessWidget {
  const AllCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: cOffWhite,
        title: ReusableText(
          text: 'Tất cả danh mục',
          style: appStyle(
            14,
            cDark,
            FontWeight.w600,
          ),
        ),
      ),
      body: BackgroundContainer(
        color: cOffWhite,
        child: Padding(
          padding: EdgeInsets.only(left: 12.w, top: 10.h),
          child: ListView.builder(
            itemCount: categories.length,
            itemBuilder: (context, i) {
              var category = categories[i];
              return CategoryTile(category: category);
            },
          ),
        ),
      ),
    );
  }
}
