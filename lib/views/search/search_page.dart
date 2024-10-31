import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hpc_food/common/custom_container.dart';
import 'package:hpc_food/common/custom_text_field.dart';
import 'package:hpc_food/common/shimmers/foodlist_shimmer.dart';
import 'package:hpc_food/constants/constants.dart';
import 'package:hpc_food/controller/search_controller.dart';
import 'package:hpc_food/views/search/loading_widget.dart';
import 'package:hpc_food/views/search/search_results.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SearchFoodController());
    return Obx(
      () => Scaffold(
        backgroundColor: cPrimary,
        appBar: AppBar(
          toolbarHeight: 74.h,
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: cOffWhite,
          title: Padding(
            padding: EdgeInsets.only(top: 12.h),
            child: CustomTextWidget(
              controller: _searchController,
              keyboardType: TextInputType.text,
              hintText: 'Bạn muốn ăn gì?',
              suffixIcon: GestureDetector(
                onTap: () {
                  if (controller.isTriggered == false) {
                    controller.searchFoods(_searchController.text);
                    controller.setTrigger = true;
                  } else {
                    controller.searchResults = null;
                    controller.setTrigger = false;
                    _searchController.clear();
                  }
                },
                child: controller.isTriggered == false
                    ? Icon(Icons.search_rounded, size: 40.h, color: cPrimary)
                    : Icon(Icons.close_rounded, size: 40.h, color: cRed),
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: CustomContainer(
            height: 656.h,
            color: Colors.white,
            containerContent: controller.isLoading
                ? const FoodsListShimmer()
                : controller.searchResults == null
                    ? const LoadingWidget()
                    : const SearchResults(),
          ),
        ),
      ),
    );
  }
}
