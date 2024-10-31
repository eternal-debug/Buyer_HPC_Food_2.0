import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hpc_food/common/shimmers/nearby_shimmer.dart';
import 'package:hpc_food/hooks/fetch_all_foods.dart';
import 'package:hpc_food/model/foods_model.dart';
import 'package:hpc_food/views/food/food_page.dart';
import 'package:hpc_food/views/home/widgets/food_widget.dart';

class AllFoodList extends HookWidget {
  const AllFoodList({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResults = useFetchAllFoods();
    List<FoodsModel>? foods = hookResults.data;
    final isLoading = hookResults.isLoading;
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: isLoading
          ? const NearbyShimmer()
          : SizedBox(
              height: 230.h,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(
                  foods!.length > 5 ? 5 : foods.length,
                  (index) {
                    var food = foods[index];
                    return FoodWidget(
                      onTap: () {
                        Get.to(() => FoodPage(food: food));
                      },
                      image: food.imageUrl,
                      title: food.title,
                      time: food.time,
                      price: food.price,
                    );
                  },
                ),
              ),
            ),
    );
  }
}
