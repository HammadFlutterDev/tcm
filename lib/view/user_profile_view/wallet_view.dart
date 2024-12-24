import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tcm/utils/app_extensions.dart';
import 'package:tcm/view/user_profile_view/select_paymet_view.dart';
import 'package:tcm/widgets/custom_button_widget.dart';

import '../../config/app_colors.dart';
import '../../config/app_styles.dart';
import '../../config/asset_path.dart';
import '../../utils/app_router.dart';
import '../../widgets/common_screen_template_widget.dart';
import '../../widgets/custom_back_button_widget.dart';

class WalletView extends StatelessWidget {
  const WalletView({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonScreenTemplateWidget(
      appBarHeight: 80.h,
      title: "Wallet",
      leadingWidget: const CustomBackButtonWidget(),
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: AppStyles.screenHorizontalPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(bottom: 10.r),
              decoration: BoxDecoration(
                color: AppColors.scaffoldColor,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Column(
                children: [
                  Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: AppColors.primaryGradinet,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20.r),
                            topLeft: Radius.circular(20.r)),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppStyles.screenHorizontalPadding,
                            vertical: 16),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Total Balance",
                                  style:
                                      context.textStyle.displayMedium?.copyWith(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.scaffoldColor,
                                  ),
                                ),
                                Text(
                                  "\$120.50",
                                  style:
                                      context.textStyle.displayMedium?.copyWith(
                                    fontSize: 34.sp,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.scaffoldColor,
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            SizedBox(
                                height: 42.h,
                                width: 119.w,
                                child: CustomButtonWidget(
                                  title: "Deposit",
                                  onPressed: () {
                                    AppRouter.push(const SelectPaymetView());
                                  },
                                  color: AppColors.greyColor,
                                  textColor: AppColors.lightIconColor,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Desposit",
                                        style: context.textStyle.displayMedium!
                                            .copyWith(
                                          height: 1.8,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 6.r),
                                        child: Image.asset(Assets.walletIcon),
                                      )
                                    ],
                                  ),
                                ))
                          ],
                        ),
                      )),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppStyles.screenHorizontalPadding,
                        vertical: 8),
                    child: Row(
                      children: [
                        Text(
                          "Deposits",
                          style: context.textStyle.displayMedium?.copyWith(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.lightIconColor,
                          ),
                        ),
                        124.pw,
                        Text(
                          "Refunds",
                          style: context.textStyle.displayMedium?.copyWith(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.lightIconColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppStyles.screenHorizontalPadding),
                    child: Row(
                      children: [
                        Text(
                          "\$100.00",
                          style: context.textStyle.displayMedium?.copyWith(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.lightIconColor,
                          ),
                        ),
                        114.pw,
                        Text(
                          "\$20.00",
                          style: context.textStyle.displayMedium?.copyWith(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.lightIconColor,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            20.ph,
            Text(
              "Recent Transactions",
              style: context.textStyle.displayMedium?.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            customDepositedStatus(
                "Deposit Successfully",
                AppColors.greenColor.withValues(alpha: 0.1),
                "\$1000",
                Assets.down,
                context),
            customDepositedStatus(
                "Refund Successfully",
                AppColors.blueColor.withValues(alpha: 0.1),
                "\$1000",
                Assets.refresh,
                context),
            customDepositedStatus(
                "Deposit Successfully",
                AppColors.greenColor.withValues(alpha: 0.1),
                "\$1000",
                Assets.down,
                context),
            customDepositedStatus(
                "Deposit Successfully",
                AppColors.greenColor.withValues(alpha: 0.1),
                "\$1000",
                Assets.down,
                context),
          ],
        ),
      ),
    );
  }

  customDepositedStatus(String? text, Color? color, String? amountText,
      String? icon, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor:
                color ?? AppColors.greenColor.withValues(alpha: 0.1),
            radius: 35.r,
            child: SvgPicture.asset(
              icon!,
            ),
          ),
          8.pw,
          Text(
            text!,
            style: context.textStyle.displayMedium?.copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          const Spacer(),
          Text(
            amountText!,
            style: context.textStyle.displayMedium?.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.greenColor50),
          ),
        ],
      ),
    );
  }
}
