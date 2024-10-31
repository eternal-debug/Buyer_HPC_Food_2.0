import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hpc_food/common/app_style.dart';
import 'package:hpc_food/common/reusable_text.dart';
import 'package:hpc_food/constants/constants.dart';
import 'package:hpc_food/model/restaurants_model.dart';

class RestaurantTile extends StatelessWidget {
  const RestaurantTile({super.key, required this.restaurant});

  final RestaurantsModel restaurant;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 8.h),
            height: 100.h,
            width: width,
            decoration: BoxDecoration(
              color: cLightWhite,
              borderRadius: BorderRadius.circular(9.r),
            ),
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
                          width: 100.w,
                          height: 100.h,
                          child: Image.network(
                            restaurant.imageUrl,
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
                              rating: restaurant.rating,
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: width * 0.63,
                        child: ReusableText(
                          text: restaurant.title,
                          style: appStyle(16, cDark, FontWeight.w500),
                        ),
                      ),
                      SizedBox(height: 4.h),
                      ReusableText(
                        text: 'Giờ mở cửa: ${restaurant.time}',
                        style: appStyle(10, cGray, FontWeight.w400),
                      ),
                      SizedBox(
                        width: width * 0.63,
                        child: Text(
                          restaurant.description.address,
                          style: appStyle(10, cGray, FontWeight.w400),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 4.w,
            bottom: 12.h,
            child: Container(
              width: 70.w,
              height: 20.h,
              decoration: BoxDecoration(
                color: restaurant.isAvailable == true ? cTertiary : cGray,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Center(
                child: ReusableText(
                  text: restaurant.isAvailable == true ? 'Mở cửa' : 'Đóng cửa',
                  style: appStyle(10, cLightWhite, FontWeight.w600),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
