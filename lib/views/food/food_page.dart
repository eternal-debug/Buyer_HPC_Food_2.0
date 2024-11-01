import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hpc_food/common/app_style.dart';
import 'package:hpc_food/common/custom_button.dart';
import 'package:hpc_food/common/custom_text_field.dart';
import 'package:hpc_food/common/reusable_text.dart';
import 'package:hpc_food/constants/constants.dart';
import 'package:hpc_food/controllers/food_controller.dart';
import 'package:hpc_food/hooks/fetch_restaurants.dart';
import 'package:hpc_food/models/foods_model.dart';
import 'package:hpc_food/views/restaurant/restaurant_page.dart';
import 'package:intl/intl.dart';

class FoodPage extends StatefulHookWidget {
  const FoodPage({super.key, required this.food});

  final FoodsModel food;

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  final TextEditingController _preferences = TextEditingController();
  final controller = Get.put(FoodController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.loadAdditives(widget.food.additives);
    });
  }

  @override
  Widget build(BuildContext context) {
    final hookResult = useFetchRestaurantsById(widget.food.restaurant);
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(30.r)),
            child: Stack(
              children: [
                Container(
                  width: width,
                  height: 280.h,
                  color: cLightWhite,
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: widget.food.imageUrl,
                  ),
                ),
                Positioned(
                  top: 40.h,
                  left: 12.w,
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: const Icon(
                      Icons.arrow_back_ios_rounded,
                      color: cPrimary,
                      size: 30,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 12,
                  left: 12.w,
                  child: CustomButton(
                    onTap: () {
                      Get.to(
                        () => RestaurantPage(
                          restaurant: hookResult.data,
                        ),
                      );
                    },
                    btnWidth: 140.w,
                    text: "Đến trang cửa hàng",
                    radius: 100,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 220.w,
                        child: ReusableText(
                            text: widget.food.title,
                            style: appStyle(20, cDark, FontWeight.w600)),
                      ),
                      Obx(
                        () => ReusableText(
                            text:
                                '${NumberFormat.currency(locale: 'vi', symbol: '').format((widget.food.price + controller.additivePrice) * controller.count.value).replaceAll(',', '.')} đ',
                            style: appStyle(20, cPrimary, FontWeight.w600)),
                      )
                    ],
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    widget.food.description,
                    textAlign: TextAlign.justify,
                    maxLines: 8,
                    style: appStyle(12, cDark, FontWeight.w400),
                  ),
                  SizedBox(height: 6.h),
                  SizedBox(
                    height: 22.h,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children:
                          List.generate(widget.food.foodTags.length, (index) {
                        final tag = widget.food.foodTags[index];
                        return Container(
                          margin: EdgeInsets.only(right: 6.w),
                          decoration: BoxDecoration(
                            color: cTertiary,
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.r),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 6.w),
                            child: ReusableText(
                              text: tag,
                              style: appStyle(12, cWhite, FontWeight.w400),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  ReusableText(
                    text: "Chọn topping",
                    style: appStyle(18, cDark, FontWeight.w600),
                  ),
                  SizedBox(height: 10.h),
                  Obx(
                    () => Column(
                      children: List.generate(
                        controller.additivesList.length,
                        (index) {
                          final additive = controller.additivesList[index];
                          return CheckboxListTile(
                            contentPadding: EdgeInsets.zero,
                            visualDensity: VisualDensity.compact,
                            dense: true,
                            activeColor: cSecondary,
                            value: additive.isChecked.value,
                            tristate: false,
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 240.w,
                                  child: ReusableText(
                                      text: additive.title,
                                      style:
                                          appStyle(12, cDark, FontWeight.w400)),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                ReusableText(
                                  text:
                                      '${NumberFormat.currency(locale: 'vi', symbol: '').format(additive.price).replaceAll(',', '.')}đ',
                                  style:
                                      appStyle(12, cPrimary, FontWeight.w600),
                                ),
                              ],
                            ),
                            onChanged: (bool? value) {
                              additive.toggleChecked();
                              controller.getTotalPrice();
                            },
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ReusableText(
                          text: 'Số lượng',
                          style: appStyle(18, cDark, FontWeight.bold)),
                      SizedBox(
                        width: 5.w,
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              controller.decrement();
                            },
                            child: const Icon(Icons.remove_circle_outline),
                          ),
                          Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Obx(
                                () => ReusableText(
                                    text: '${controller.count.value}',
                                    style:
                                        appStyle(16, cDark, FontWeight.w600)),
                              )),
                          GestureDetector(
                            onTap: () {
                              controller.increment();
                            },
                            child: const Icon(Icons.add_circle_outline),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  ReusableText(
                    text: 'Lời nhắn',
                    style: appStyle(18, cDark, FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  SizedBox(
                    height: 100.h,
                    child: CustomTextWidget(
                      controller: _preferences,
                      hintText: '...',
                      maxLines: 3,
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      showVerificationSheet(context);
                    },
                    child: Container(
                      height: 50.h,
                      decoration: BoxDecoration(
                        color: cPrimary,
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 18.w),
                            child: ReusableText(
                              text: 'Đặt món',
                              style: appStyle(18, cLightWhite, FontWeight.w600),
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
                              Icons.shopping_cart_rounded,
                              color: cLightWhite,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
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
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage("assets/images/restaurant_bk.png"),
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
              padding: EdgeInsets.all(8.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10.h),
                  ReusableText(
                    text: 'Hãy xác minh số điện thoại của bạn',
                    style: appStyle(18, cPrimary, FontWeight.w600),
                  ),
                  SizedBox(
                    height: 250.h,
                    child: ListView.builder(
                      itemCount: verificationReasons.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: const Icon(
                            Icons.check_circle_outline,
                            color: cPrimary,
                          ),
                          title: Text(
                            verificationReasons[index],
                            textAlign: TextAlign.justify,
                            style: appStyle(12, cDark, FontWeight.normal),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 10.h),
                  CustomButton(
                    text: 'Bắt đầu xác minh',
                    btnWidth: 250.w,
                    btnHeight: 40.h,
                    btnFontSite: 14.sp,
                    onTap: () {
                      // Get.to(() => const PhoneVerificationPage());
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
