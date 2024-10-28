import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hpc_food/common/app_style.dart';
import 'package:hpc_food/common/reusable_text.dart';
import 'package:hpc_food/constants/constants.dart';
import 'package:intl/intl.dart';

class FoodTile extends StatelessWidget {
  const FoodTile({super.key, required this.food});

  final dynamic food;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 8.h),
            height: 70.h,
            width: width,
            decoration: BoxDecoration(
              color: cLightWhite,
              borderRadius: BorderRadius.circular(9.r),
            ),
            child: Container(
              child: Padding(
                padding: EdgeInsets.all(4.r),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(12.r)),
                      child: Stack(
                        children: [
                          SizedBox(
                            width: 70.w,
                            height: 70.h,
                            child: Image.network(
                              food['imageUrl'],
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            child: Container(
                              padding: EdgeInsets.only(left: 6.w, bottom: 2.h),
                              color: cDark.withOpacity(0.6),
                              width: width,
                              height: 16.h,
                              child: RatingBarIndicator(
                                rating: food['rating'],
                                itemCount: 5,
                                itemBuilder: (context, index) => const Icon(
                                  Icons.star,
                                  color: cOffWhite,
                                ),
                                itemSize: 15.h,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ReusableText(
                          text: food['title'],
                          style: appStyle(11, cDark, FontWeight.w400),
                        ),
                        ReusableText(
                          text: 'Thời gian chế biến: ~${food['time']} phút',
                          style: appStyle(9, cGray, FontWeight.w400),
                        ),
                        SizedBox(
                          width: width * 0.7,
                          height: 16.h,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: food['additives'].length,
                            itemBuilder: (context, index) {
                              var additive = food['additives'][index];
                              return Container(
                                margin: EdgeInsets.only(right: 5.w),
                                decoration: BoxDecoration(
                                  color: cTertiary,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(9.r)),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 4.w),
                                    child: ReusableText(
                                        text: additive['title'],
                                        style: appStyle(
                                            8, cLightWhite, FontWeight.w400)),
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
            right: 5.w,
            top: 5.h,
            child: Container(
              width: 80.w,
              height: 20.h,
              decoration: BoxDecoration(
                color: cPrimary,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Center(
                child: ReusableText(
                  text:
                      '${NumberFormat.currency(locale: 'vi', symbol: '').format(food['price']).replaceAll(',', '.')}đ',
                  style: appStyle(10, cLightWhite, FontWeight.w600),
                ),
              ),
            ),
          ),
          Positioned(
            right: 95.w,
            top: 5.h,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                width: 20.w,
                height: 20.h,
                decoration: BoxDecoration(
                  color: cRed,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: const Center(
                  child: Icon(
                    MaterialCommunityIcons.cart,
                    size: 13,
                    color: cLightWhite,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
