import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hpc_food/common/shimmers/foodlist_shimmer.dart';
import 'package:hpc_food/constants/constants.dart';
import 'package:hpc_food/hooks/fetch_foods_by_category.dart';
import 'package:hpc_food/models/foods_model.dart';
import 'package:hpc_food/views/home/widgets/food_tile.dart';

class CategoryFoodsList extends HookWidget {
  const CategoryFoodsList({super.key});
  @override
  Widget build(BuildContext context) {
    final hookResults = useFetchFoodsByCategory();
    List<FoodsModel>? foods = hookResults.data;
    final isLoading = hookResults.isLoading;

    return SizedBox(
      width: width,
      height: height,
      child: isLoading
          ? const FoodsListShimmer()
          : Padding(
              padding: EdgeInsets.all(12.h),
              child: ListView(
                children: List.generate(foods.length, (i) {
                  FoodsModel food = foods[i];
                  return FoodTile(
                    color: Colors.white,
                    food: food,
                  );
                }),
              ),
            ),
    );
  }
}
