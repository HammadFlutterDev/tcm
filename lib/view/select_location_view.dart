import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tcm/config/app_styles.dart';
import 'package:tcm/config/asset_path.dart';
import 'package:tcm/models/product_data_model.dart';
import 'package:tcm/utils/app_router.dart';
import 'package:tcm/view/checkout_view.dart';
import 'package:tcm/widgets/common_screen_template_widget.dart';
import 'package:tcm/widgets/custom_back_button_widget.dart';
import 'package:tcm/widgets/custom_button_widget.dart';

import '../widgets/custom_search_bar_widget.dart';

class SelectLocationView extends StatelessWidget {
  final ProductDataModel ?product;
  const SelectLocationView({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return CommonScreenTemplateWidget(
        leadingWidget: const CustomBackButtonWidget(),
        appBarHeight: 150.h,
        bottomAppbarWidget: PreferredSize(
            preferredSize: Size.fromHeight(200.h),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppStyles.screenHorizontalPadding,
                  vertical: AppStyles.screenHorizontalPadding),
              child: CustomSearchBarWidget(
                  controller: TextEditingController(),
                  hintText: "Search Product"),
            )),
        title: "Select Location",
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(Assets.map), fit: BoxFit.cover)),
            ),
            Container(
              height: 165.h,
              width: double.infinity,
              padding: EdgeInsets.only(
                  top: 50.r,
                  left: AppStyles.screenHorizontalPadding,
                  right: AppStyles.screenHorizontalPadding),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white.withAlpha(2), // rgba(255, 255, 255, 0.00)
                  Colors.white, // #FFF
                ],
                stops: const [
                  0.0,
                  0.5
                ], // First color at 0% and second color at 50%
              )),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButtonWidget(
                      title: "Select",
                      onPressed: () {
                        AppRouter.back();
                        AppRouter.pushReplacement( CheckoutView(
                          isLocationSet: true,
                          product: product,
                        ));
                      }),
                ],
              ),
            )
          ],
        ));
  }
}
