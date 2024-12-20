import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tcm/config/app_colors.dart';
import 'package:tcm/config/app_styles.dart';
import 'package:tcm/config/asset_path.dart';
import 'package:tcm/utils/app_extensions.dart';
import 'package:tcm/utils/app_router.dart';
import 'package:tcm/view/select_location_view.dart';
import 'package:tcm/widgets/common_screen_template_widget.dart';
import 'package:tcm/widgets/custom_back_button_widget.dart';
import 'package:tcm/widgets/custom_button_widget.dart';
import 'package:tcm/widgets/display_network_image.dart';

class CheckoutView extends StatefulWidget {
  final bool? isLocationSet;
  final bool? isPaymentMethodSet;
  final bool? isDeliveryOptionSet;

  const CheckoutView(
      {super.key,
      this.isLocationSet = false,
      this.isDeliveryOptionSet = false,
      this.isPaymentMethodSet = false});

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  int quantity = 1;
  bool selectFastDeliveryOpt = false;
  bool selectStandardDeliveryOpt = false;

  @override
  Widget build(BuildContext context) {
    return CommonScreenTemplateWidget(
      title: "Checkout",
      leadingWidget: const CustomBackButtonWidget(),
      appBarHeight: 70.h,
      child: Column(
        children: [
          Expanded(
              child: ListView(
            padding: EdgeInsets.symmetric(
                horizontal: AppStyles.screenHorizontalPadding),
            children: [
              GestureDetector(
                onTap: () {
                  AppRouter.push(const SelectLocationView());
                },
                child: Container(
                  height: 67.h,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 10.r),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(color: AppColors.borderColor),
                      color: const Color(0xffEFEDEC)),
                  child: !widget.isLocationSet!
                      ? Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                              Assets.plusIcon,
                              width: 24.r,
                            ),
                            Text(
                              "Add Shipping Address",
                              style: context.textStyle.displayMedium!
                                  .copyWith(fontSize: 16.sp),
                            )
                          ],
                        )
                      : Row(
                          children: [
                            Container(
                              width: 50.r,
                              height: 50.r,
                              padding: EdgeInsets.all(8.r),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(3.13.r)),
                              child:
                                  SvgPicture.asset(Assets.setPinLocationIcon),
                            ),
                            10.pw,
                            Expanded(
                                child: Text(
                              "12348 street, LA",
                              style: context.textStyle.displayMedium!,
                            )),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 17.r,
                            )
                          ],
                        ),
                ),
              ),
              20.ph,
              Row(
                children: [
                  SvgPicture.asset(
                    Assets.addCartIcon,
                    width: 18.r,
                  ),
                  4.pw,
                  Expanded(
                      child: Text(
                    "BTX Traders",
                    style: context.textStyle.displayMedium!
                        .copyWith(fontWeight: FontWeight.w700),
                  ))
                ],
              ),
              if (quantity != 0) ...[
                20.ph,
                Row(
                  children: [
                    DisplayNetworkImage(
                      imageUrl: "",
                      width: 77.297.w,
                      height: 75.595.h,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "\$12.00",
                                style: context.textStyle.displayLarge!
                                    .copyWith(fontWeight: FontWeight.w700),
                              ),
                              Container(
                                height: 40.h,
                                padding: EdgeInsets.all(1.r),
                                decoration: BoxDecoration(
                                    color: const Color(0xffEFEDEC),
                                    borderRadius: BorderRadius.circular(421.r)),
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        if (quantity > 0) {
                                          quantity--;
                                          setState(() {});
                                        }
                                      },
                                      child: Container(
                                        height: 36.r,
                                        width: 36.r,
                                        padding: EdgeInsets.all(3.r),
                                        decoration: const BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle),
                                        child: SvgPicture.asset(
                                          Assets.minusIcon,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 18.r),
                                      child: Text(
                                        "$quantity",
                                        style: context.textStyle.displayMedium!
                                            .copyWith(fontSize: 18.sp),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        quantity++;
                                        setState(() {});
                                      },
                                      child: Container(
                                        height: 36.r,
                                        width: 36.r,
                                        padding: EdgeInsets.all(5.r),
                                        decoration: const BoxDecoration(
                                            gradient: AppColors.primaryGradinet,
                                            shape: BoxShape.circle),
                                        child: SvgPicture.asset(
                                          Assets.plusIcon,
                                          colorFilter: const ColorFilter.mode(
                                              Colors.white, BlendMode.srcIn),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
              20.ph,
              Text(
                "Delivery Options",
                style: context.textStyle.displayMedium!
                    .copyWith(fontWeight: FontWeight.w700),
              ),
              18.ph,
              DeliverOptionSelectionWidget(
                deliveryTime: "Delivery in 26-43min",
                isSelect: selectFastDeliveryOpt,
                price: "3.00",
                title: "Fast Delivery",
                onTap: () {
                  selectFastDeliveryOpt = true;
                  selectStandardDeliveryOpt = false;
                  setState(() {});
                },
              ),
              10.ph,
              DeliverOptionSelectionWidget(
                deliveryTime: "Delivery on 19-20 Nov",
                isSelect: selectStandardDeliveryOpt,
                price: "1.00",
                title: "Standard Delivery",
                onTap: () {
                  selectFastDeliveryOpt = false;
                  selectStandardDeliveryOpt = true;
                  setState(() {});
                },
              )
            ],
          )),
          if (quantity != 0)
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: AppStyles.screenHorizontalPadding,
                  vertical: 30.r),
              decoration: const BoxDecoration(color: Color(0xffF8F8F8)),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Merchandise Subtotal",
                        style: context.textStyle.displayMedium,
                      ),
                      10.pw,
                      Text(
                        "($quantity items)",
                        style: context.textStyle.bodySmall,
                      ),
                      const Spacer(),
                      Text(
                        "\$12.00",
                        style: context.textStyle.bodyMedium!.copyWith(
                            fontSize: 18.sp, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  5.ph,
                  Row(
                    children: [
                      Text(
                        "Shipping Fee Subtotal",
                        style: context.textStyle.displayMedium,
                      ),
                      const Spacer(),
                      Text(
                        selectFastDeliveryOpt ? "\$3.00" : "\$1.00",
                        style: context.textStyle.bodyMedium!.copyWith(
                            fontSize: 18.sp, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  const Divider(),
                  10.ph,
                  Row(
                    children: [
                      Text(
                        "Total",
                        style: context.textStyle.displayMedium!.copyWith(
                            fontSize: 20.sp, fontWeight: FontWeight.w700),
                      ),
                      const Spacer(),
                      Text(
                        selectFastDeliveryOpt ? "\$15.00" : "\$13.00",
                        style: context.textStyle.displayMedium!.copyWith(
                            fontSize: 20.sp, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  20.ph,
                  CustomButtonWidget(title: "Checkout", onPressed: () {}),
                ],
              ),
            )
        ],
      ),
    );
  }
}

class DeliverOptionSelectionWidget extends StatelessWidget {
  final bool isSelect;
  final String title;
  final String deliveryTime;
  final String price;
  final VoidCallback onTap;
  const DeliverOptionSelectionWidget(
      {super.key,
      required this.title,
      required this.deliveryTime,
      required this.isSelect,
      required this.price,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 74.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            border: Border(
                top: BorderSide(
                  color: AppColors.borderColor,
                ),
                right: BorderSide(
                  color: AppColors.borderColor,
                ),
                bottom: BorderSide(
                  color: AppColors.borderColor,
                ))),
        child: Row(
          children: [
            Container(
              width: 38.w,
              height: double.infinity,
              decoration: BoxDecoration(
                  gradient: isSelect ? AppColors.primaryGradinet : null,
                  color: !isSelect
                      ? AppColors.borderColor
                      : const Color(0xffDADADA),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.r),
                      bottomLeft: Radius.circular(10.r))),
              child: Icon(
                Icons.check,
                color: Colors.white,
                size: 18.r,
              ),
            ),
            Expanded(
                child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.r, vertical: 8.r),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: context.textStyle.displayMedium,
                      ),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(4.r),
                            decoration: BoxDecoration(
                                color: isSelect
                                    ? const Color(0xffFFFF00)
                                    : const Color(0xffDADADA),
                                shape: BoxShape.circle),
                            child: SvgPicture.asset(Assets.deliveryVanIcon),
                          ),
                          Text(
                            deliveryTime,
                            style: context.textStyle.bodySmall,
                          )
                        ],
                      )
                    ],
                  ),
                  Text(
                    "\$$price",
                    style: context.textStyle.bodyMedium!
                        .copyWith(fontSize: 16.sp, fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
