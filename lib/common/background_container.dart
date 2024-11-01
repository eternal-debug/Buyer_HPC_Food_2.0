import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hpc_food/constants/constants.dart';

class BackgroundContainer extends StatelessWidget {
  const BackgroundContainer({
    super.key,
    required this.child,
    required this.color,
    this.btmL,
    this.btmR,
  });

  final double? btmL;
  final double? btmR;
  final Widget child;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(btmL ?? 20.r),
          bottomRight: Radius.circular(btmR ?? 20.r),
        ),
        image: const DecorationImage(
          image: AssetImage('assets/images/restaurant_bk.png'),
          alignment: Alignment.bottomCenter,
          fit: BoxFit.cover,
          opacity: 0.15,
        ),
      ),
      child: child,
    );
  }
}
