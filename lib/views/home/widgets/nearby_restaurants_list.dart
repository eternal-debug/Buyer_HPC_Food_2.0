import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hpc_food/common/shimmers/nearby_shimmer.dart';
import 'package:hpc_food/hooks/fetch_all_restaurants.dart';
import 'package:hpc_food/models/restaurants_model.dart';
import 'package:hpc_food/views/home/widgets/restaurant_widget.dart';
import 'package:hpc_food/views/restaurant/restaurant_page.dart';

class NearbyRestaurantsList extends HookWidget {
  const NearbyRestaurantsList({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResults = useFetchAllRestaurant();
    List<RestaurantsModel>? restaurants = hookResults.data;
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
                  restaurants!.length > 5 ? 5 : restaurants.length,
                  (index) {
                    var restaurant = restaurants[index];
                    return RestaurantWidget(
                      onTap: () {
                        Get.to(() => RestaurantPage(restaurant: restaurant));
                      },
                      image: restaurant.imageUrl,
                      logo: restaurant.logoUrl,
                      title: restaurant.title,
                      time: restaurant.time,
                      rating: restaurant.rating,
                      ratingCount: restaurant.ratingCount,
                    );
                  },
                ),
              ),
            ),
    );
  }
}
