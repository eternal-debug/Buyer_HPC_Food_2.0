import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hpc_food/common/app_style.dart';
import 'package:hpc_food/common/reusable_text.dart';
import 'package:hpc_food/constants/constants.dart';
import 'package:intl/intl.dart';

class FoodWidget extends StatelessWidget {
  const FoodWidget({
    super.key,
    required this.image,
    required this.title,
    required this.time,
    required this.price,
    this.onTap,
  });

  final String image;
  final String title;
  final String time;
  final int price;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(right: 12.w),
        child: Container(
          width: width * 0.8,
          height: 230.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: cLightWhite,
          ),
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Padding(
                padding: EdgeInsets.all(8.r),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: SizedBox(
                    height: 160.h,
                    width: width * 0.8,
                    child: Image.network(
                      image,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 160.w,
                          child: ReusableText(
                            text: title,
                            style: appStyle(16, cDark, FontWeight.w500),
                          ),
                        ),
                        ReusableText(
                          text:
                              '${NumberFormat.currency(locale: 'vi', symbol: '').format(price).replaceAll(',', '.')}đ',
                          style: appStyle(16, cPrimary, FontWeight.w600),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ReusableText(
                          text: 'Thời gian chế biến',
                          style: appStyle(10, cGray, FontWeight.w600),
                        ),
                        ReusableText(
                          text: '~$time phút',
                          style: appStyle(10, cDark, FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
