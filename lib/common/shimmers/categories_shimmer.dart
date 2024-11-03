import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hpc_food/common/shimmers/shimmer_widget.dart';
import 'package:hpc_food/constants/constants.dart';

class CategoriesShimmer extends StatelessWidget {
  const CategoriesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 12, top: 10),
      height: 110.h,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 6,
          itemBuilder: (context, index) {
            return Column(
              children: [
                ShimmerWidget(
                  shimmerWidth: width * 0.23,
                  shimmerHeight: 98.h,
                  shimmerRadius: 12,
                ),
              ],
            );
          }),
    );
  }
}
