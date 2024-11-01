import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hpc_food/common/custom_button.dart';
import 'package:hpc_food/common/custom_container.dart';
import 'package:hpc_food/constants/constants.dart';
import 'package:hpc_food/controllers/login_controller.dart';
import 'package:hpc_food/models/login_response.dart';
import 'package:hpc_food/views/auth/login_redirect.dart';
import 'package:hpc_food/views/auth/verification_page.dart';
import 'package:hpc_food/views/profile/widget/profile_app_bar.dart';
import 'package:hpc_food/views/profile/widget/profile_tile_widget.dart';
import 'package:hpc_food/views/profile/widget/user_info_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    LoginResponse? user;
    final controller = Get.put(LoginController());
    final box = GetStorage();
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
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(40.h), child: const ProfileAppBar()),
      body: SafeArea(
        child: CustomContainer(
          containerContent: Column(
            children: [
              UserInfoWidget(user: user),
              SizedBox(
                height: 10.h,
              ),
              Container(
                height: 581.h,
                decoration: const BoxDecoration(color: cOffWhite),
                child: ListView(
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    ProfileTileWidget(
                        onTap: () {
                          Get.to(() => const LoginRedirect());
                        },
                        title: 'Đơn hàng của tôi',
                        icon: Ionicons.fast_food_outline),
                    ProfileTileWidget(
                        onTap: () {},
                        title: 'Nhà hàng yêu thích',
                        icon: Ionicons.heart_outline),
                    ProfileTileWidget(
                        onTap: () {},
                        title: 'Đánh giá',
                        icon: Ionicons.chatbubble_outline),
                    ProfileTileWidget(
                        onTap: () {},
                        title: 'Voucher',
                        icon: MaterialCommunityIcons.tag_outline),
                    ProfileTileWidget(
                        onTap: () {},
                        title: 'Địa chỉ giao hàng',
                        icon: SimpleLineIcons.location_pin),
                    ProfileTileWidget(
                        onTap: () {},
                        title: 'Trung tâm dịch vụ',
                        icon: AntDesign.customerservice),
                    ProfileTileWidget(
                        onTap: () {},
                        title: 'Tin tức',
                        icon: MaterialIcons.rss_feed),
                    ProfileTileWidget(
                        onTap: () {},
                        title: 'Cài đặt',
                        icon: AntDesign.setting),
                  ],
                ),
              ),
              CustomButton(
                onTap: () {
                  controller.logout();
                },
                btnColor: cRed,
                text: 'Đăng xuất',
                radius: 0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
