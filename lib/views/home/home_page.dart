import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hpc_food/common/custom_appbar.dart';
import 'package:hpc_food/common/custom_container.dart';
import 'package:hpc_food/common/heading.dart';
import 'package:hpc_food/views/home/all_fastest_foods.dart';
import 'package:hpc_food/views/home/all_nearby_restaurants.dart';
import 'package:hpc_food/views/home/recommendations.dart';
import 'package:hpc_food/views/home/widgets/category_list.dart';
import 'package:hpc_food/views/home/widgets/food_list.dart';
import 'package:hpc_food/views/home/widgets/nearby_restaurants_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(130.h), child: const CustomAppBar()),
      body: SafeArea(
        child: CustomContainer(
          containerContent: Column(
            children: [
              const CategoryList(),
              Heading(
                text: 'Nhà hàng quanh bạn',
                onTap: () {
                  Get.to(
                    () => const AllNearbyRestaurants(),
                    transition: Transition.fadeIn,
                    duration: const Duration(milliseconds: 250),
                  );
                },
              ),
              const NearbyRestaurantsList(),
              Heading(
                text: 'Của ngon vật lạ',
                onTap: () {
                  Get.to(
                    () => const Recommendations(),
                    transition: Transition.fadeIn,
                    duration: const Duration(milliseconds: 250),
                  );
                },
              ),
              const FoodList(),
              Heading(
                text: 'Bạn đang vội?',
                onTap: () {
                  Get.to(
                    () => const AllFastestFoods(),
                    transition: Transition.fadeIn,
                    duration: const Duration(milliseconds: 250),
                  );
                },
              ),
              const FoodList(),
            ],
          ),
        ),
      ),
    );
  }
}
