import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hpc_food/common/custom_button.dart';
import 'package:hpc_food/constants/constants.dart';
import 'package:hpc_food/views/restaurant/rating_page.dart';
import 'package:hpc_food/views/restaurant/restaurant_page.dart';

class RestaurantBottomBar extends StatelessWidget {
  const RestaurantBottomBar({
    super.key,
    required this.widget,
  });

  final RestaurantPage widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      width: width,
      height: 40.h,
      decoration: BoxDecoration(
          color: cPrimaryLight,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(16.r),
            bottomLeft: Radius.circular(16.r),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RatingBarIndicator(
              itemCount: 5,
              itemSize: 25,
              rating: widget.restaurant!.rating,
              itemBuilder: (context, i) => const Icon(
                    Icons.star,
                    color: cSecondary,
                  )),
          CustomButton(
            onTap: () {
              Get.to(() => const RatingPage());
            },
            btnColor: cSecondary,
            btnWidth: width / 5,
            text: "Đánh giá",
          )
        ],
      ),
    );
  }
}
