import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hpc_food/common/shimmers/foodlist_shimmer.dart';
import 'package:hpc_food/constants/constants.dart';
import 'package:hpc_food/hooks/fetch_foods_by_restaurant.dart';
import 'package:hpc_food/models/foods_model.dart';
import 'package:hpc_food/views/home/widgets/food_tile.dart';

class RestaurantMenuWidget extends HookWidget {
  const RestaurantMenuWidget({super.key, required this.restaurantId});

  final String restaurantId;

  @override
  Widget build(BuildContext context) {
    final hookResults = useFetchFoodsByRestaurant(restaurantId);
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
                  foods.length > 5 ? 5 : foods.length,
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
