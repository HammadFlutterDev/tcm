import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tcm/config/app_colors.dart';
import 'package:tcm/config/app_styles.dart';
import 'package:tcm/config/asset_path.dart';
import 'package:tcm/utils/app_extensions.dart';
import 'package:tcm/utils/app_router.dart';

import 'package:tcm/widgets/custom_button_widget.dart';

class ProductAdLiveNowView extends StatelessWidget {
  const ProductAdLiveNowView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.scaffoldColor1,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "Your Ad",
          style: context.textStyle.displayMedium!.copyWith(fontSize: 18.sp),
        ),
      ),
      bottomSheet: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: AppStyles.screenHorizontalPadding,
            vertical: AppStyles.screenHorizontalPadding),
        child: CustomButtonWidget(
            title: "Preview Ad",
            onPressed: () {
              AppRouter.back();
            }),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              Assets.doneIcon,
              width: 70.r,
            ),
            20.ph,
            Text(
              "Your Ad is now Live!",
              style: context.textStyle.displayLarge!.copyWith(fontSize: 22.sp),
            )
          ],
        ),
      ),
    );
  }
}
