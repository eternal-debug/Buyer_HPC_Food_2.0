import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hpc_food/common/app_style.dart';
import 'package:hpc_food/common/reusable_text.dart';
import 'package:hpc_food/constants/constants.dart';
import 'package:hpc_food/models/restaurants_model.dart';
import 'package:hpc_food/views/restaurant/directions_page.dart';
import 'package:hpc_food/views/restaurant/widget/recommend_widget.dart';
import 'package:hpc_food/views/restaurant/widget/restaurant_bottom_bar.dart';
import 'package:hpc_food/views/restaurant/widget/restaurant_menu.dart';
import 'package:hpc_food/views/restaurant/widget/row_text.dart';

class RestaurantPage extends StatefulWidget {
  const RestaurantPage({super.key, required this.restaurant});

  final RestaurantsModel? restaurant;

  @override
  State<RestaurantPage> createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage>
    with TickerProviderStateMixin {
  late final TabController _tabController = TabController(
    length: 2,
    vsync: this,
  );

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: cLightWhite,
        body: ListView(
          padding: EdgeInsets.zero,
          children: [
            Stack(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 230.h,
                      width: width,
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: widget.restaurant!.imageUrl,
                      ),
                    ),
                    RestaurantBottomBar(widget: widget),
                    SizedBox(height: 8.h),
                    ReusableText(
                      text: widget.restaurant!.title,
                      style: appStyle(20, cDark, FontWeight.bold),
                    ),
                  ],
                ),
                Positioned(
                  top: 40.h,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: const Icon(
                            Icons.arrow_back_ios_rounded,
                            size: 28,
                            color: cPrimaryLight,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(() => const DirectionsPage());
                          },
                          child: const Icon(
                            Icons.location_on_outlined,
                            size: 28,
                            color: cPrimaryLight,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  RowText(
                    first: "Khoảng cách đến cửa hàng",
                    second: "2.7 km",
                  ),
                  RowText(
                    first: "Thời gian di chuyển",
                    second: "30 min",
                  ),
                  RowText(
                    first: "Giá trung bình",
                    second: "\$2.7",
                  ),
                  Divider(thickness: 1),
                ],
              ),
            ),
            Container(
              height: 50.h,
              width: width,
              decoration: BoxDecoration(
                color: cOffWhite,
                borderRadius: BorderRadius.circular(25.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TabBar(
                  controller: _tabController,
                  physics: const NeverScrollableScrollPhysics(),
                  indicator: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [cPrimary, cPrimary.withOpacity(0.7)],
                    ),
                    borderRadius: BorderRadius.circular(25.r),
                    boxShadow: [
                      BoxShadow(
                        color: cPrimary.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  labelPadding: EdgeInsets.zero,
                  labelColor: cWhite,
                  labelStyle: appStyle(16, cLightWhite, FontWeight.normal),
                  unselectedLabelStyle: appStyle(12, cDark, FontWeight.normal),
                  dividerColor: Colors.transparent,
                  tabs: [
                    Tab(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.restaurant_menu_rounded,
                              size: 16, color: cLightWhite),
                          SizedBox(width: 4.w),
                          const Text("Menu"),
                        ],
                      ),
                    ),
                    Tab(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.explore,
                              size: 16, color: cLightWhite),
                          SizedBox(width: 4.w),
                          const Text("Gợi ý"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: SizedBox(
                height: height - 250.h,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    RestaurantMenuWidget(restaurantId: widget.restaurant!.id),
                    const RecommendWidget(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
