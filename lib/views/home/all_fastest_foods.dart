import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hpc_food/common/app_style.dart';
import 'package:hpc_food/common/background_container.dart';
import 'package:hpc_food/common/reusable_text.dart';
import 'package:hpc_food/constants/constants.dart';
import 'package:hpc_food/constants/uidata.dart';
import 'package:hpc_food/views/home/widgets/food_tile.dart';

class AllFastestFoods extends StatelessWidget {
  const AllFastestFoods({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: cTertiary,
        title: ReusableText(
          text: 'Nhanh chóng tiện lợi',
          style: appStyle(14, cLightWhite, FontWeight.w600),
        ),
        iconTheme: const IconThemeData(color: cLightWhite),
      ),
      body: SafeArea(
        child: BackgroundContainer(
          color: cOffWhite,
          child: Padding(
            padding: EdgeInsets.all(12.w),
            child: ListView(
              scrollDirection: Axis.vertical,
              children: List.generate(
                foods.length,
                (index) {
                  var food = foods[index];
                  return FoodTile(food: food);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
