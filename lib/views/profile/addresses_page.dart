import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hpc_food/common/app_style.dart';
import 'package:hpc_food/common/background_container.dart';
import 'package:hpc_food/common/custom_button.dart';
import 'package:hpc_food/common/reusable_text.dart';
import 'package:hpc_food/common/shimmers/foodlist_shimmer.dart';
import 'package:hpc_food/constants/constants.dart';
import 'package:hpc_food/hooks/fetch_address.dart';
import 'package:hpc_food/models/addresses_response.dart';
import 'package:hpc_food/views/profile/shipping_address.dart';
import 'package:hpc_food/views/profile/widget/address_list.dart';

class Addresses extends HookWidget {
  const Addresses({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResult = useFetchAddresses();

    final List<AddressResponse> addresses = hookResult.data ?? [];
    final isLoading = hookResult.isLoading;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: cOffWhite,
        title: ReusableText(
          text: 'Addresses',
          style: appStyle(13, cGray, FontWeight.w600),
        ),
      ),
      body: BackgroundContainer(
        color: cOffWhite,
        child: Stack(
          children: [
            isLoading
                ? const FoodsListShimmer()
                : Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30.0),
                    child: AddressListWidget(addresses: addresses),
                  ),
            Align(
              alignment: AlignmentDirectional.bottomCenter,
              child: Padding(
                padding: EdgeInsets.fromLTRB(12.w, 0, 12.w, 30.h),
                child: CustomButton(
                  onTap: () {
                    Get.to(() => const ShippingAddress());
                  },
                  text: 'Add Address',
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
