import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tcm/config/app_colors.dart';
import 'package:tcm/config/app_styles.dart';
import 'package:tcm/config/asset_path.dart';
import 'package:tcm/utils/app_extensions.dart';
import 'package:tcm/utils/app_router.dart';
import 'package:tcm/view/navigation_view.dart';
import 'package:tcm/view/payment_confirmed_view.dart';
import 'package:tcm/widgets/common_screen_template_widget.dart';
import 'package:tcm/widgets/custom_back_button_widget.dart';
import 'package:tcm/widgets/custom_button_widget.dart';

class OrderConfirmationView extends StatelessWidget {
  final bool? isVender;
  OrderConfirmationView({super.key, this.isVender = false});
  final List<String> safetyInstruction = [
    "Only meet in public / crowded places.",
    "Never go alone to meet a buyer/seller always take someone with you.",
    "Trust your instincts—if something feels off, walk away from the deal.",
    "Check and inspect the product properly"
  ];
  @override
  Widget build(BuildContext context) {
    return CommonScreenTemplateWidget(
        title: "",
        leadingWidget: const CustomBackButtonWidget(),
        bottomWidget: Padding(
          padding: EdgeInsets.all(AppStyles.screenHorizontalPadding),
          child: CustomButtonWidget(
            title: "Done",
            onPressed: () {
              if (isVender ?? false) {
                AppRouter.pushAndRemoveUntil(const NavigationView());
              } else {
                AppRouter.pushReplacement(const PaymentConfirmedView());
              }
            },
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(
              left: AppStyles.screenHorizontalPadding,
              right: AppStyles.screenHorizontalPadding,
              bottom: !(isVender ?? false) ? 120.r : 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                Assets.confirmOrderIcon,
                width: 200.r,
              ),
              Text(
                "Your order has been confirmed",
                style:
                    context.textStyle.displayMedium!.copyWith(fontSize: 18.sp),
              ),
              20.ph,
              if (!(isVender ?? false)) ...[
                Container(
                  padding: EdgeInsets.only(bottom: 10.r),
                  margin: EdgeInsets.only(top: 10.r),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: AppColors.borderColor))),
                  child: Row(
                    children: [
                      Text(
                        "Product Price",
                        style: context.textStyle.displayMedium!
                            .copyWith(fontWeight: FontWeight.w700),
                      ),
                      const Spacer(),
                      Text(
                        "\$12.00",
                        style: context.textStyle.displayMedium!
                            .copyWith(fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 10.r),
                  margin: EdgeInsets.only(top: 10.r),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: AppColors.borderColor))),
                  child: Row(
                    children: [
                      Text(
                        "Application Fee",
                        style: context.textStyle.displayMedium!
                            .copyWith(fontWeight: FontWeight.w700),
                      ),
                      const Spacer(),
                      Text(
                        "\$1.00",
                        style: context.textStyle.displayMedium!
                            .copyWith(fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                ),
              ],
              if (isVender ?? false) ...[
                Container(
                  padding: EdgeInsets.only(bottom: 10.r),
                  margin: EdgeInsets.only(top: 10.r),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: AppColors.borderColor))),
                  child: Row(
                    children: [
                      Text(
                        "Merchandise Subtotal",
                        style: context.textStyle.displayMedium!
                            .copyWith(fontWeight: FontWeight.w700),
                      ),
                      const Spacer(),
                      Text(
                        "\$12.00",
                        style: context.textStyle.displayMedium!
                            .copyWith(fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 10.r),
                  margin: EdgeInsets.only(top: 10.r),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: AppColors.borderColor))),
                  child: Row(
                    children: [
                      Text(
                        "Shipping Fee Subtotal",
                        style: context.textStyle.displayMedium!
                            .copyWith(fontWeight: FontWeight.w700),
                      ),
                      const Spacer(),
                      Text(
                        "\$1.00",
                        style: context.textStyle.displayMedium!
                            .copyWith(fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 10.r),
                  margin: EdgeInsets.only(top: 10.r),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: AppColors.borderColor))),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Fast Delivery",
                            style: context.textStyle.displayMedium!
                                .copyWith(fontWeight: FontWeight.w700),
                          ),
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(4.r),
                                decoration: const BoxDecoration(
                                    color: Color(0xffFFFF00),
                                    shape: BoxShape.circle),
                                child: SvgPicture.asset(Assets.deliveryVanIcon),
                              ),
                              Text(
                                "Delivery in 26-43min",
                                style: context.textStyle.bodySmall,
                              )
                            ],
                          )
                        ],
                      ),
                      const Spacer(),
                      Text(
                        "\$3.00",
                        style: context.textStyle.displayMedium!
                            .copyWith(fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                ),
              ],
              if (!(isVender ?? false)) ...[
                const Spacer(),
                Row(
                  children: [
                    Text(
                      "Your safety matters to us!",
                      style: context.textStyle.displayMedium!
                          .copyWith(color: context.colors.primary),
                    ),
                  ],
                ),
                10.ph,
                ...List.generate(
                  safetyInstruction.length,
                  (index) => Row(
                    children: [
                      10.pw,
                      const Text("•"),
                      10.pw,
                      Expanded(child: Text(safetyInstruction[index]))
                    ],
                  ),
                )
              ]
            ],
          ),
        ));
  }
}
