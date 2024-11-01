import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hpc_food/common/custom_appbar.dart';
import 'package:hpc_food/common/custom_container.dart';
import 'package:hpc_food/common/heading.dart';
import 'package:hpc_food/constants/constants.dart';
import 'package:hpc_food/controllers/category_controller.dart';
import 'package:hpc_food/views/home/all_fastest_foods.dart';
import 'package:hpc_food/views/home/all_nearby_restaurants.dart';
import 'package:hpc_food/views/home/recommendations.dart';
import 'package:hpc_food/views/home/widgets/category_foods_list.dart';
import 'package:hpc_food/views/home/widgets/category_list.dart';
import 'package:hpc_food/views/home/widgets/all_food_list.dart';
import 'package:hpc_food/views/home/widgets/fastest_food_list.dart';
import 'package:hpc_food/views/home/widgets/nearby_restaurants_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());
    return Scaffold(
      backgroundColor: cPrimary,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(130.h), child: const CustomAppBar()),
      body: SafeArea(
        child: CustomContainer(
          height: 648.h,
          containerContent: Column(
            children: [
              const CategoryList(),
              Obx(
                () => controller.categoryValue == ''
                    ? Column(
                        children: [
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
                          const FastestFoodList(),
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
                          const AllFoodList(),
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
                          SizedBox(height: 16.h)
                        ],
                      )
                    : CustomContainer(
                        height: 648.h,
                        containerContent: Column(
                          children: [
                            Heading(
                              more: true,
                              text: "${controller.titleValue}:",
                              onTap: () {
                                Get.to(
                                  () => const Recommendations(),
                                  transition: Transition.cupertino,
                                  duration: const Duration(milliseconds: 900),
                                );
                              },
                            ),
                            const CategoryFoodsList(),
                          ],
                        ),
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
