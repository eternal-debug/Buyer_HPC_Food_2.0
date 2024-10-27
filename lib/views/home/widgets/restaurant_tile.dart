import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hpc_food/common/app_style.dart';
import 'package:hpc_food/common/reusable_text.dart';
import 'package:hpc_food/constants/constants.dart';

class RestaurantTile extends StatelessWidget {
  const RestaurantTile({super.key, required this.restaurant});

  final dynamic restaurant;

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
                              restaurant['imageUrl'],
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
                                rating: restaurant['rating'],
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
                          text: restaurant['title'],
                          style: appStyle(11, cDark, FontWeight.w400),
                        ),
                        ReusableText(
                          text: 'Giờ mở cửa: ${restaurant['time']}',
                          style: appStyle(9, cGray, FontWeight.w400),
                        ),
                        SizedBox(
                          width: width * 0.7,
                          child: Text(
                            restaurant['description']['address'],
                            style: appStyle(9, cGray, FontWeight.w400),
                            overflow: TextOverflow.ellipsis,
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
              width: 70.w,
              height: 20.h,
              decoration: BoxDecoration(
                color: restaurant['isAvailable'] == true ||
                        restaurant['isAvailable'] == null
                    ? cTertiary
                    : cGray,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Center(
                child: ReusableText(
                  text: restaurant['isAvailable'] == true ||
                          restaurant['isAvailable'] == null
                      ? 'Mở cửa'
                      : 'Đóng cửa',
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
