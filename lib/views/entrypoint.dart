// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:hpc_food/constants/constants.dart';
import 'package:hpc_food/controller/tab_index_controller.dart';
import 'package:hpc_food/views/cart/cart_page.dart';
import 'package:hpc_food/views/home/home_page.dart';
import 'package:hpc_food/views/profile/profile_page.dart';
import 'package:hpc_food/views/search/search_page.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  List<Widget> pageList = const [
    HomePage(),
    SearchPage(),
    CartPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TabIndexController());

    return Obx(
      () => Scaffold(
        body: Stack(
          children: [
            pageList[controller.tabIndex],
            Align(
              alignment: Alignment.bottomCenter,
              child: Theme(
                data: Theme.of(context).copyWith(canvasColor: cPrimary),
                child: BottomNavigationBar(
                  elevation: 0,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  unselectedIconTheme:
                      const IconThemeData(color: Colors.white70),
                  selectedIconTheme: const IconThemeData(color: cSecondary),
                  onTap: (value) {
                    controller.setTabIndex = value;
                  },
                  currentIndex: controller.tabIndex,
                  items: [
                    BottomNavigationBarItem(
                      icon: controller.tabIndex == 0
                          ? const Icon(AntDesign.appstore1)
                          : const Icon(AntDesign.appstore_o),
                      label: 'Trang chủ',
                    ),
                    const BottomNavigationBarItem(
                      icon: Icon(AntDesign.search1),
                      label: 'Tìm kiếm',
                    ),
                    const BottomNavigationBarItem(
                      icon: Badge(
                        label: Text('1'),
                        child: Icon(FontAwesome.opencart),
                      ),
                      label: 'Giỏ hàng',
                    ),
                    BottomNavigationBarItem(
                      icon: controller.tabIndex == 3
                          ? const Icon(FontAwesome.user_circle)
                          : const Icon(FontAwesome.user_circle_o),
                      label: 'Tài khoản',
                    ),
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