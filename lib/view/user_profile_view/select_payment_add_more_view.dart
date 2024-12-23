import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tcm/utils/app_extensions.dart';
import 'package:tcm/utils/app_router.dart';
import 'package:tcm/view/user_profile_view/add_card_view.dart';
import 'package:tcm/widgets/custom_list_widget.dart';

import '../../config/app_colors.dart';
import '../../config/app_styles.dart';
import '../../config/asset_path.dart';
import '../../widgets/common_screen_template_widget.dart';
import '../../widgets/custom_back_button_widget.dart';

class SelectPaymentAddMoreView extends StatelessWidget {
  const SelectPaymentAddMoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonScreenTemplateWidget(
        title: "Select Payment",
        leadingWidget: const CustomBackButtonWidget(),
        appBarHeight: 60.h,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppStyles.screenHorizontalPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("My Card",
                      style: context.textStyle.displayMedium!.copyWith(
                          fontSize: 16.sp,
                          color: AppColors.lightIconColor,
                          fontWeight: FontWeight.w700)),
                  Text("Remove",
                      style: context.textStyle.displayMedium!.copyWith(
                          fontSize: 16.sp,
                          color: AppColors.lightIconColor,
                          fontWeight: FontWeight.w600)),
                ],
              ),
              12.ph,
              Container(
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      width: 1,
                      color: AppColors.lightIconColor.withOpacity(0.1)),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Text("Mastercard  ****8018",
                          style: context.textStyle.displayMedium!.copyWith(
                              fontSize: 14.sp,
                              color: AppColors.lightIconColor,
                              fontWeight: FontWeight.w600)),
                      const Spacer(),
                      Container(
                        width: 40.r,
                        height: 40.r,
                        padding: EdgeInsets.all(8.r),
                        child: SvgPicture.asset(Assets.masterCard),
                      ),
                    ],
                  ),
                ),
              ),
              32.ph,
              Text("Add More",
                  style: context.textStyle.displayMedium!.copyWith(
                      fontSize: 16.sp,
                      color: AppColors.lightIconColor,
                      fontWeight: FontWeight.w700)),
              12.ph,
              CustomListWidget(
                iconPayment: Assets.visa,
                title: "Visa",
                onTap: () {
                  AppRouter.push(const AddCardView());
                },
              ),
              12.ph,
              CustomListWidget(
                iconPayment: Assets.masterCard,
                title: "Master card",
                onTap: () {
                  AppRouter.push(const AddCardView());
                },
              ),
              12.ph,
              CustomListWidget(
                iconPayment: Assets.paypal,
                title: "PayPal",
                onTap: () {
                  AppRouter.push(const AddCardView());
                },
              )
            ],
          ),
        ));
  }
}
