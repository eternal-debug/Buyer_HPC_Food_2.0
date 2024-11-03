import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hpc_food/common/app_style.dart';
import 'package:hpc_food/common/reusable_text.dart';
import 'package:hpc_food/constants/constants.dart';
import 'package:hpc_food/models/addresses_response.dart';

class AddressTile extends StatelessWidget {
  const AddressTile({super.key, required this.address});

  final AddressResponse address;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      visualDensity: VisualDensity.compact,
      leading: Icon(
        SimpleLineIcons.location_pin,
        color: cPrimary,
        size: 28.h,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      title: ReusableText(
          text: address.addressLine1,
          style: appStyle(11, cDark, FontWeight.w500)),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ReusableText(
              text: address.postalCode,
              style: appStyle(11, cGray, FontWeight.w500)),
          ReusableText(
              text: "Tap to set address as default",
              style: appStyle(8, cGray, FontWeight.w500)),
        ],
      ),
    );
  }
}