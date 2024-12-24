import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tcm/utils/app_extensions.dart';
import 'package:tcm/utils/app_router.dart';
import 'package:tcm/view/user_profile_view/money_deposit_view.dart';
import 'package:tcm/widgets/custom_button_widget.dart';

import '../../config/app_colors.dart';
import '../../config/app_styles.dart';
import '../../config/asset_path.dart';
import '../../widgets/common_screen_template_widget.dart';
import '../../widgets/custom_back_button_widget.dart';

class AddCardView extends StatelessWidget {
  final VoidCallback? onTap;
  const AddCardView({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return CommonScreenTemplateWidget(
      title: "Add Card",
      leadingWidget: const CustomBackButtonWidget(),
      appBarHeight: 60.h,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: AppStyles.screenHorizontalPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height: 50.h,
                  width: 50.w,
                  decoration: BoxDecoration(
                    color: AppColors.secondaryColor1,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.all(8.r),
                  child: SvgPicture.asset(Assets.masterCard),
                ),
                8.pw,
                Text("Master Card",
                    style: context.textStyle.displayMedium!.copyWith(
                        fontSize: 16.sp,
                        color: AppColors.lightIconColor,
                        fontWeight: FontWeight.w600)),
              ],
            ),
            16.ph,
            Text("Card Number",
                style: context.textStyle.displayMedium!.copyWith(
                    fontSize: 16.sp,
                    color: AppColors.lightIconColor,
                    fontWeight: FontWeight.w300)),
            const TextFieldUnderGround(
              hintText: "0000 0000 0000 ",
              keyboardType: TextInputType.number,
            ),
            24.ph,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Expiry Field
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Expiry",
                        style: context.textStyle.displayMedium!.copyWith(
                          fontSize: 16.sp,
                          color: AppColors.lightIconColor,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      8.ph, // Space between label and field
                      const TextFieldUnderGround(hintText: "MM/YY",  keyboardType: TextInputType.number,),
                    ],
                  ),
                ),

                16.pw, // Space between fields

                // CVV Field
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "CVV",
                        style: context.textStyle.displayMedium!.copyWith(
                          fontSize: 16.sp,
                          color: AppColors.lightIconColor,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      8.ph, // Space between label and field
                      const TextFieldUnderGround(hintText: "MM/YY",  keyboardType: TextInputType.number,),
                    ],
                  ),
                ),

                16.pw, // Space between fields

                // Postcode Field
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Postcode",
                        style: context.textStyle.displayMedium!.copyWith(
                          fontSize: 16.sp,
                          color: AppColors.lightIconColor,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      8.ph, // Space between label and field
                      const TextFieldUnderGround(hintText: "MM/YY",  keyboardType: TextInputType.number,),
                    ],
                  ),
                ),
              ],
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: AppStyles.screenHorizontalPadding),
              child: CustomButtonWidget(
                  title: "Add Card",
                  onPressed: onTap ??
                      () {
                        AppRouter.push(const MoneyDepositView());
                      }),
            )
          ],
        ),
      ),
    );
  }
}

class TextFieldUnderGround extends StatelessWidget {
  const TextFieldUnderGround(
      {super.key,
        this.keyboardType,
      this.hintText,
      this.text,
      this.title,
      this.hasIcon,
      this.controller});

  final String? hintText;
  final String? text;
  final String? title;
  final bool? hasIcon;
  final TextInputType? keyboardType;

  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      textAlign: TextAlign.left,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.only(left: 0, right: 0, bottom: 0, top: 0),
        fillColor: Colors.transparent,
        hintText: hintText ?? "Enter",
        suffixIcon: title == "Password"
            ? Text(
                "Change",
                style: context.textStyle.displayMedium?.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryColor,
                  decoration: TextDecoration.underline,
                ),
              )
            : (hasIcon == true
                ? Container(
                    width: 10.r,
                    height: 10.r,
                    padding: EdgeInsets.all(16.r),
                    child: SvgPicture.asset(Assets.editProfile),
                  )
                : null),
        // Display icon if hasIcon is true
        hintStyle: context.textStyle.displayMedium?.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.greyColor70.withOpacity( 0.4)),

        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
              color: AppColors.lightIconColor.withOpacity( 0.05)),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.blue, width: 2.0),
        ),
        errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2.0),
        ),
      ),
    );
  }
}
