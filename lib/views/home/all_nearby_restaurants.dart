import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hpc_food/common/app_style.dart';
import 'package:hpc_food/common/background_container.dart';
import 'package:hpc_food/common/reusable_text.dart';
import 'package:hpc_food/common/shimmers/shimmer_widget.dart';
import 'package:hpc_food/constants/constants.dart';
import 'package:hpc_food/hooks/fetch_all_restaurants.dart';
import 'package:hpc_food/models/restaurants_model.dart';
import 'package:hpc_food/views/home/widgets/restaurant_tile.dart';

class AllNearbyRestaurants extends HookWidget {
  const AllNearbyRestaurants({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResults = useFetchAllRestaurant();
    List<RestaurantsModel>? restaurants = hookResults.data;
    final isLoading = hookResults.isLoading;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: cPrimary,
        title: ReusableText(
          text: 'Nhà hàng quanh bạn',
          style: appStyle(18, cLightWhite, FontWeight.w600),
        ),
        iconTheme: const IconThemeData(color: cLightWhite),
      ),
      body: isLoading
          ? ShimmerWidget(
              shimmerWidth: width,
              shimmerHeight: 100.h,
              shimmerRadius: 9,
            )
          : SafeArea(
              child: BackgroundContainer(
                color: cOffWhite,
                child: Padding(
                  padding: EdgeInsets.all(12.w),
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: List.generate(
                      restaurants!.length,
                      (index) {
                        var restaurant = restaurants[index];
                        return RestaurantTile(restaurant: restaurant);
                      },
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
