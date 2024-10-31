import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hpc_food/common/app_style.dart';
import 'package:hpc_food/common/background_container.dart';
import 'package:hpc_food/common/reusable_text.dart';
import 'package:hpc_food/common/shimmers/shimmer_widget.dart';
import 'package:hpc_food/constants/constants.dart';
import 'package:hpc_food/hooks/fetch_all_foods.dart';
import 'package:hpc_food/model/foods_model.dart';
import 'package:hpc_food/views/home/widgets/food_tile.dart';

class Recommendations extends HookWidget {
  const Recommendations({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResults = useFetchAllFoods();
    List<FoodsModel>? foods = hookResults.data;
    final isLoading = hookResults.isLoading;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: cPrimary,
        title: ReusableText(
          text: 'Của ngon vật lạ',
          style: appStyle(18, cLightWhite, FontWeight.w600),
        ),
        iconTheme: const IconThemeData(color: cLightWhite),
      ),
      body: SafeArea(
        child: BackgroundContainer(
          color: cOffWhite,
          child: Padding(
            padding: EdgeInsets.all(12.w),
            child: isLoading
                ? ShimmerWidget(
                    shimmerWidth: width,
                    shimmerHeight: 100.h,
                    shimmerRadius: 9,
                  )
                : ListView(
                    scrollDirection: Axis.vertical,
                    children: List.generate(
                      foods!.length,
                      (index) {
                        var food = foods[index];
                        return FoodTile(food: food);
                      },
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
