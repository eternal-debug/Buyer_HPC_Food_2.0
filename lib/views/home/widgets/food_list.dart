import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hpc_food/constants/uidata.dart';
import 'package:hpc_food/views/home/widgets/food_widget.dart';

class FoodList extends StatelessWidget {
  const FoodList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 205.h,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(
          foods.length > 5 ? 5 : foods.length,
          (index) {
            var food = foods[index];
            return FoodWidget(
              image: food['imageUrl'],
              title: food['title'],
              time: food['time'],
              price: food['price'],
            );
          },
        ),
      ),
    );
  }
}
