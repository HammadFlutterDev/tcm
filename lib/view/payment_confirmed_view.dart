import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tcm/config/app_colors.dart';
import 'package:tcm/config/app_styles.dart';
import 'package:tcm/config/asset_path.dart';
import 'package:tcm/utils/app_extensions.dart';
import 'package:tcm/utils/app_router.dart';
import 'package:tcm/view/ad_preview_view.dart';
import 'package:tcm/view/ad_product_view.dart';
import 'package:tcm/view/checkout_payment_selection_view.dart';
import 'package:tcm/widgets/common_screen_template_widget.dart';
import 'package:tcm/widgets/custom_back_button_widget.dart';
import 'package:tcm/widgets/user_profile_widget.dart';

import '../widgets/custom_button_widget.dart';
import '../widgets/display_network_image.dart';

class PaymentConfirmedView extends StatelessWidget {
  const PaymentConfirmedView({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonScreenTemplateWidget(
        title: "Checkout",
        leadingWidget: const CustomBackButtonWidget(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppStyles.screenHorizontalPadding),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        UserProfileWidget(radius: 15.r, imageUrl: "ah"),
                        10.pw,
                        Text(
                          "Cristiano David",
                          style: context.textStyle.displayMedium,
                        )
                      ],
                    ),
                    20.ph,
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.r),
                          child: DisplayNetworkImage(
                            imageUrl: "",
                            width: 77.297.w,
                            height: 75.595.h,
                          ),
                        ),
                        10.pw,
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                "Red Bull Energy Drink Can 250ml Pack of 4 full Extreme Energy",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: context.textStyle.displayMedium!
                                    .copyWith(fontSize: 16.sp),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "\$12.00",
                                    style: context.textStyle.displayLarge!
                                        .copyWith(fontWeight: FontWeight.w700),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    20.ph,
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Payment Method",
                            style: context.textStyle.displayMedium!
                                .copyWith(fontWeight: FontWeight.w700),
                          ),
                        ),
                        // GestureDetector(
                        //   onTap: () {
                        //     AppRouter.push(
                        //         const CheckoutPaymentSelectionView());
                        //   },
                        //   child: Text(
                        //     "Edit",
                        //     style: context.textStyle.displayMedium,
                        //   ),
                        // )
                      ],
                    ),
                    12.ph,
                    GestureDetector(
                      onTap: () {
                        AppRouter.push(const CheckoutPaymentSelectionView());
                      },
                      child: Container(
                        height: 44.h,
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.symmetric(horizontal: 12.r),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(color: AppColors.borderColor)),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                              child: Text(
                                "Mastercard ****8018",
                                style: context.textStyle.displayMedium!,
                              ),
                            ),
                            SvgPicture.asset(Assets.masterCard)
                          ],
                        ),
                      ),
                    ),
                    30.ph,
                    const TitleHeadingWidget(title: "Details"),
                    const ProductDetailTitleWidget(
                      description: "19 may 2024, 7:00pm",
                      title: "Purchase Date",
                    ),
                    const ProductDetailTitleWidget(
                      description: "19 may 2024, 7:00pm",
                      title: "Check-In",
                    ),
                    const ProductDetailTitleWidget(
                      description: "26 may 2024, 3:20pm",
                      title: "Check-Out",
                    )
                  ],
                ),
              ),
            )),
            Container(
              padding: EdgeInsets.all(AppStyles.screenHorizontalPadding),
              decoration: BoxDecoration(
                  color: AppColors.secondaryColor1,
                  border:
                      Border(top: BorderSide(color: AppColors.borderColor))),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Payment Confirmed",
                        style: context.textStyle.displayMedium!.copyWith(
                            fontSize: 20.sp, fontWeight: FontWeight.w700),
                      ),
                      const Spacer(),
                      Text(
                        "\$15.00",
                        style: context.textStyle.displayMedium!.copyWith(
                            fontSize: 20.sp, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  15.ph,
                  Row(
                    children: [
                      Expanded(
                          child: CustomButtonWidget(
                        title: "Go Back",
                        onPressed: () {},
                        border: Border.all(color: AppColors.borderColor),
                        textColor: Colors.black,
                        color: const Color(0xffEFEDEC),
                      )),
                      9.pw,
                      Expanded(
                          child: CustomButtonWidget(
                              title: "Chat",
                              onPressed: () {
                                // AppRouter.push( );
                              }))
                    ],
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
