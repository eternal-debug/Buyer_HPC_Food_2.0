import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:hpc_food/common/app_style.dart';
import 'package:hpc_food/common/reusable_text.dart';
import 'package:hpc_food/constants/constants.dart';
import 'package:hpc_food/models/foods_model.dart';
import 'package:hpc_food/views/food/food_page.dart';
import 'package:intl/intl.dart';

class FoodTile extends StatelessWidget {
  FoodTile({super.key, required this.food, this.color});

  FoodsModel food;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => FoodPage(food: food));
      },
      child: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 8.h),
            height: 100.h,
            width: width,
            decoration: BoxDecoration(
              color: color ?? cLightWhite,
              borderRadius: BorderRadius.circular(9.r),
            ),
            child: Container(
              child: Padding(
                padding: EdgeInsets.all(4.r),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(9.r)),
                      child: Stack(
                        children: [
                          SizedBox(
                            width: 100.w,
                            height: 100.h,
                            child: Image.network(
                              food.imageUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            child: Container(
                              color: cDark.withOpacity(0.6),
                              alignment: Alignment.center,
                              width: 100.w,
                              height: 20.h,
                              child: RatingBarIndicator(
                                rating: food.rating,
                                itemCount: 5,
                                itemBuilder: (context, index) => const Icon(
                                  Icons.star,
                                  color: cOffWhite,
                                ),
                                itemSize: 16.h,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: 6.w),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ReusableText(
                          text: food.title,
                          style: appStyle(16, cDark, FontWeight.w500),
                        ),
                        SizedBox(
                          width: width * 0.63,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ReusableText(
                                text: 'Thời gian chế biến: ~${food.time} phút',
                                style: appStyle(10, cGray, FontWeight.w500),
                              ),
                              ReusableText(
                                text:
                                    '${NumberFormat.currency(locale: 'vi', symbol: '').format(food.price).replaceAll(',', '.')}đ',
                                style: appStyle(14, cRed, FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: width * 0.63,
                          height: 20.h,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: food.additives.length,
                            itemBuilder: (context, index) {
                              var additive = food.additives[index];
                              return Container(
                                margin: EdgeInsets.only(right: 6.w),
                                decoration: BoxDecoration(
                                  color: cTertiary,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(9.r),
                                  ),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 4.w),
                                    child: ReusableText(
                                      text: additive.title,
                                      style: appStyle(
                                        10,
                                        cOffWhite,
                                        FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 4.w,
            top: 10.h,
            child: GestureDetector(
              onTap: () {},
              child: const Center(
                child: Icon(
                  MaterialCommunityIcons.cart,
                  size: 25,
                  color: cRed,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
