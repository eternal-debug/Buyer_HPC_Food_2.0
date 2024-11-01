import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hpc_food/common/shimmers/foodlist_shimmer.dart';
import 'package:hpc_food/constants/constants.dart';
import 'package:hpc_food/hooks/fetch_all_foods.dart';
import 'package:hpc_food/models/foods_model.dart';
import 'package:hpc_food/views/home/widgets/food_tile.dart';

class RecommendWidget extends HookWidget {
  const RecommendWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResults = useFetchAllFoods();
    final foods = hookResults.data;
    final isLoading = hookResults.isLoading;
    return Scaffold(
      backgroundColor: cLightWhite,
      body: isLoading
          ? const FoodsListShimmer()
          : SizedBox(
              height: height * 0.7,
              child: ListView(
                padding: EdgeInsets.zero,
                children: List.generate(
                  foods.length,
                  (index) {
                    final FoodsModel food = foods[index];
                    return FoodTile(food: food);
                  },
                ),
              ),
            ),
    );
  }
}
