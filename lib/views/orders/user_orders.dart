import 'package:flutter/material.dart';
import 'package:hpc_food/common/app_style.dart';
import 'package:hpc_food/common/background_container.dart';
import 'package:hpc_food/common/reusable_text.dart';
import 'package:hpc_food/constants/constants.dart';

class UserOrders extends StatefulWidget {
  const UserOrders({super.key});

  @override
  State<UserOrders> createState() => _UserOrdersState();
}

class _UserOrdersState extends State<UserOrders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: cOffWhite,
        elevation: 0,
        title: ReusableText(
          text: 'My Orders',
          style: appStyle(14, cPrimary, FontWeight.w600),
        ),
      ),
      body: BackgroundContainer(
        color: cLightWhite,
        child: Container(),
      ),
    );
  }
}

List<String> orderList = [
  'Pending',
  'Preparing',
  'Delivering',
  'Delivered',
  'Cancelled',
];
