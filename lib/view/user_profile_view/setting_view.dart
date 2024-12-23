import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tcm/config/app_colors.dart';
import 'package:tcm/config/asset_path.dart';
import 'package:tcm/utils/app_extensions.dart';
import 'package:tcm/view/user_profile_view/custom_profile_widget.dart';
import 'package:tcm/view/user_profile_view/edit_profile_view.dart';
import 'package:tcm/view/user_profile_view/wallet_view.dart';
import 'package:tcm/widgets/common_screen_template_widget.dart';
import 'package:tcm/widgets/user_profile_widget.dart';

import '../../utils/app_router.dart';
import '../../widgets/custom_back_button_widget.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    String userImageUrl = "";

    // List of items for the profile screen
    final List<Map<String, dynamic>> profileItems = [
      {
        "icon": Assets.wallet,
        "title": "Wallet",
        "onTap": () {
          AppRouter.push(const WalletView());
        },
        "color": AppColors.lightIconColor
      },
      {
        "icon": Assets.buyProfile,
        "title": "My Purchase",
        "onTap": () {},
        "color": AppColors.lightIconColor,
      },
      {
        "icon": Assets.arrowStrip,
        "title": "My Refund Products",
        "onTap": () {},
        "color": AppColors.lightIconColor,
      },
      {
        "icon": Assets.alignRight,
        "title": "My Ads",
        "onTap": () {},
        "color": AppColors.lightIconColor,
      },
      {
        "icon": Assets.volumeHigh,
        "title": "Notify Products",
        "onTap": () {},
        "color": AppColors.lightIconColor,
      },
      {
        "icon": Assets.logout,
        "title": "Log Out",
        "onTap": () {},
        "color": Colors.red,
      },
    ];

    final screenHeight = MediaQuery.of(context).size.height;
    return CommonScreenTemplateWidget(
      title: "More",
      leadingWidget: const CustomBackButtonWidget(),
      appBarHeight: 120.h,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.primaryColor.withValues(alpha: 0.05),

          // borderRadius: const BorderRadius.only(
          //     topLeft: Radius.circular(40), topRight: Radius.circular(40)
          // )
          borderRadius: const BorderRadius.only(
              topLeft: Radius.elliptical(200, 50),
              topRight: Radius.elliptical(200, 50)),
        ),
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
                top: screenHeight * -0.85,
                bottom: 0,
                left: 0,
                right: 0,
                child: Center(
                    child:
                        UserProfileWidget(radius: 40, imageUrl: userImageUrl))),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                40.ph,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Liam Sebastian",
                      style: context.textStyle.displayMedium
                          ?.copyWith(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    GestureDetector(
                        onTap: () {
                          AppRouter.push(const EditProfileView());
                        },
                        child: const Icon(Icons.edit_square))
                  ],
                ),
                Center(
                  child: Text(
                    "liamsebastiam12@gmail.com",
                    style: context.textStyle.displayMedium?.copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.lightIconColor.withValues(alpha: 0.7)),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "My Account",
                    style: context.textStyle.displayMedium?.copyWith(
                        fontSize: 16.sp, fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(
                  height: 13,
                ),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemCount: profileItems.length,
                    itemBuilder: (context, index) {
                      final item = profileItems[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: CustomProfileScreenWidget(
                          icon: item['icon'],
                          title: item['title'],
                          onTap: item['onTap'],
                          color: item['color'],
                        ),
                      );
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
