import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:hpc_food/common/app_style.dart';
import 'package:hpc_food/common/reusable_text.dart';
import 'package:hpc_food/constants/constants.dart';
import 'package:hpc_food/controllers/cart_controller.dart';
import 'package:hpc_food/models/cart_response.dart';
import 'package:intl/intl.dart';

class CartTile extends StatelessWidget {
  const CartTile({super.key, required this.cart, this.color, this.refetch});

  final CartResponse cart;
  final Color? color;
  final Function()? refetch;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CartController());
    return GestureDetector(
      onTap: () {
        showVerificationSheet(context);
      },
      child: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 8.h),
            height: 100.h,
            width: width,
            decoration: BoxDecoration(
              color: color ?? cLightWhite,
              borderRadius: BorderRadius.circular(9.r),
            ),
            child: Container(
              child: Padding(
                padding: EdgeInsets.all(4.r),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(9.r)),
                      child: Stack(
                        children: [
                          SizedBox(
                            width: 100.w,
                            height: 100.h,
                            child: Image.network(
                              cart.productId.imageUrl,
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
                                rating: cart.productId.rating,
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
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ReusableText(
                          text: cart.productId.title,
                          style: appStyle(16, cDark, FontWeight.w500),
                        ),
                        SizedBox(
                          width: width * 0.63,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ReusableText(
                                text: 'Số lượng: ${cart.quantity}',
                                style: appStyle(12, cGray, FontWeight.w500),
                              ),
                              ReusableText(
                                text:
                                    '${NumberFormat.currency(locale: 'vi', symbol: '').format(cart.totalPrice).replaceAll(',', '.')}đ',
                                style: appStyle(14, cRed, FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: width * 0.63,
                          height: 20.h,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: cart.additives.length,
                            itemBuilder: (context, index) {
                              var additive = cart.additives[index];
                              return Container(
                                margin: EdgeInsets.only(right: 6.w),
                                decoration: BoxDecoration(
                                  color: cTertiary,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(9.r),
                                  ),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 4.w),
                                    child: ReusableText(
                                      text: additive,
                                      style: appStyle(
                                        10,
                                        cOffWhite,
                                        FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
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
            right: 4.w,
            top: 10.h,
            child: GestureDetector(
              onTap: () {
                controller.removeFrom(cart.id, refetch!);
              },
              child: const Center(
                child: Icon(
                  MaterialCommunityIcons.cart_remove,
                  size: 25,
                  color: cRed,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> showVerificationSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage('assets/images/restaurant_bk.png'),
              alignment: Alignment.bottomCenter,
              fit: BoxFit.cover,
              opacity: 0.15,
            ),
            color: cLightWhite,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12.r),
              topRight: Radius.circular(12.r),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(16.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.h),
                Center(
                  child: ReusableText(
                    text: cart.productId.title,
                    style: appStyle(20, cPrimary, FontWeight.w600),
                  ),
                ),
                SizedBox(height: 10.h),
                SizedBox(height: 5.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ReusableText(
                      text: 'Số lượng: ${cart.quantity}',
                      style: appStyle(18, cDark, FontWeight.w500),
                    ),
                    ReusableText(
                      text:
                          'Giá: ${NumberFormat.currency(locale: 'vi', symbol: '').format(cart.totalPrice).replaceAll(',', '.')}đ',
                      style: appStyle(18, cRed, FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 5.h),
                if (cart.instructions != null && cart.instructions!.isNotEmpty)
                  Text(
                    'Ghi chú: ${cart.instructions}',
                    style: appStyle(14, cDark, FontWeight.w400),
                  ),
                SizedBox(height: 5.h),
                ReusableText(
                  text: 'Topping:',
                  style: appStyle(18, cDark, FontWeight.w500),
                ),
                SizedBox(height: 5.h),
                if (cart.additives.isNotEmpty)
                  ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: cart.additives.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 4.w),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: ReusableText(
                            text: cart.additives[index],
                            style: appStyle(16, cDark, FontWeight.w400),
                          ),
                        ),
                      );
                    },
                  )
                else
                  Align(
                    alignment: Alignment.centerRight,
                    child: ReusableText(
                      text: 'Không có topping đi kèm',
                      style: appStyle(16, cDark, FontWeight.w400),
                    ),
                  ),
                SizedBox(height: 40.h),
              ],
            ),
          ),
        );
      },
    );
  }
}
