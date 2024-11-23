import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hpc_food/common/app_style.dart';
import 'package:hpc_food/common/custom_container.dart';
import 'package:hpc_food/common/reusable_text.dart';
import 'package:hpc_food/common/shimmers/foodlist_shimmer.dart';
import 'package:hpc_food/constants/constants.dart';
import 'package:hpc_food/controllers/login_controller.dart';
import 'package:hpc_food/hooks/fetch_cart.dart';
import 'package:hpc_food/hooks/fetch_default.dart';
import 'package:hpc_food/models/addresses_response.dart';
import 'package:hpc_food/models/cart_response.dart';
import 'package:hpc_food/models/login_response.dart';
import 'package:hpc_food/views/auth/login_redirect.dart';
import 'package:hpc_food/views/auth/verification_page.dart';
import 'package:hpc_food/views/cart/widget/cart_tile.dart';
import 'package:hpc_food/views/search/loading_widget.dart';

class CartPage extends HookWidget {
  const CartPage({super.key});

  String _getRandomLottieAsset() {
    final randomIndex = Random().nextInt(assets.length);
    return assets[randomIndex];
  }

  @override
  Widget build(BuildContext context) {
    final lottieAsset = _getRandomLottieAsset();
    final box = GetStorage();
    final hookResult = useFetchCart();
    final List<CartResponse> carts = hookResult.data ?? [];
    final isLoading = hookResult.isLoading;
    final refetch = hookResult.refetch;
    final data = useFetchDefault();
    AddressResponse? address = data.data;

    LoginResponse? user;

    final controller = Get.put(LoginController());

    String? token = box.read('token');

    if (token != null) {
      user = controller.getUserInfo();
    }

    if (token == null) {
      return const LoginRedirect();
    }

    if (user != null && user.verification == false) {
      return const VerificationPage();
    }

    return Scaffold(
      backgroundColor: cPrimary,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: cPrimary,
        title: ReusableText(
          text: 'Giỏ hàng',
          style: appStyle(18, cLightWhite, FontWeight.w600),
        ),
      ),
      body: SafeArea(
        child: CustomContainer(
          height: 664.h,
          containerContent: isLoading
              ? const FoodsListShimmer()
              : carts.isEmpty
                  ? Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Column(
                        children: [
                          ReusableText(
                            text: 'Giỏ hàng trống',
                            style: appStyle(16, cDark, FontWeight.w600),
                          ),
                          ReusableText(
                            text: 'Hãy thêm món ăn vào giỏ hàng',
                            style: appStyle(16, cDark, FontWeight.w600),
                          ),
                          const LoadingWidget()
                        ],
                      ),
                    )
                  : Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      child: Column(
                        children: [
                          SizedBox(height: 8.h),
                          GestureDetector(
                            onTap: () {
                              // final orderItems = carts.map((cart) {
                              //   return OrderItem(
                              //     foodId: cart.productId.id,
                              //     quantity: cart.quantity,
                              //     price: cart.totalPrice,
                              //     additives: cart.additives,
                              //     instructions: cart.instructions ?? '',
                              //   );
                              // }).toList();

                              // int orderTotal = orderItems.fold(
                              //   0,
                              //   (sum, item) =>
                              //       sum + (item.price * item.quantity),
                              // );

                              // const int deliveryFee = 5000;
                              // int grandTotal = orderTotal + deliveryFee;

                              // final orderRequest = OrderRequest(
                              //   userId: user!.id,
                              //   orderItems: orderItems,
                              //   orderTotal: orderTotal,
                              //   deliveryFee: deliveryFee.toStringAsFixed(2),
                              //   grandTotal: grandTotal,
                              //   deliveryAddress: user.address,
                              //   restaurantAddress:
                              //       carts.first.productId.restaurant,
                              //   restaurantId: carts.first.productId.id,
                              //   restaurantDescription: [0.0, 0.0],
                              //   recipientDescription: [0.0, 0.0],
                              // );

                              // Get.to(
                              //   () => OrderPage(
                              //     orderRequest: orderRequest,
                              //     restaurant: null,
                              //     food: null,
                              //     address: null,
                              //   ),
                              //   transition: Transition.cupertino,
                              //   duration: const Duration(milliseconds: 900),
                              // );
                            },
                            child: Container(
                              height: 50.h,
                              decoration: BoxDecoration(
                                color: cPrimary,
                                borderRadius: BorderRadius.circular(30.r),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 18.w),
                                    child: ReusableText(
                                      text: 'Đến trang thanh toán',
                                      style: appStyle(
                                          18, cLightWhite, FontWeight.w600),
                                    ),
                                  ),
                                  Container(
                                    height: 50.h,
                                    width: 50.h,
                                    decoration: const BoxDecoration(
                                      color: cSecondary,
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.attach_money_rounded,
                                      color: cLightWhite,
                                      size: 35,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 8.h),
                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: carts.length,
                            itemBuilder: (context, i) {
                              var cart = carts[i];
                              return CartTile(
                                refetch: refetch,
                                color: cLightWhite,
                                cart: cart,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
        ),
      ),
    );
  }
}
