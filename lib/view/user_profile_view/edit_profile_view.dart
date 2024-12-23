import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tcm/config/app_colors.dart';
import 'package:tcm/config/asset_path.dart';
import 'package:tcm/utils/app_extensions.dart';
import 'package:tcm/widgets/user_profile_widget.dart';

import '../../config/app_styles.dart';
import '../../widgets/common_screen_template_widget.dart';
import '../../widgets/custom_back_button_widget.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    String imageurl = "";
    return CommonScreenTemplateWidget(
      appBarHeight: 60.h,
      title: "Basic Infromation",
      leadingWidget: const CustomBackButtonWidget(),
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: AppStyles.screenHorizontalPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Leading Widget (User Profile Image)
                UserProfileWidget(radius: 60, imageUrl: imageurl),

                12.pw, // Add spacing between the image and the text content

                // Text Content (Title and Subtitle)
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      28.ph,
                      // Title
                      Text(
                        "Liam Sebastian",
                        style: context.textStyle.displayMedium?.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      4.ph, // Add spacing between title and subtitle

                      // Subtitle
                      Text(
                        "Replace Image",
                        style: context.textStyle.displayMedium?.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primaryColor,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            40.ph,
            const TextFieldUnderGround(
              hintText: "First Name",
              title: "First Name",
              hasIcon: true,
            ),
            const TextFieldUnderGround(
              hintText: "Last Name",
              title: "Last Name",
              hasIcon: true,
            ),
            const TextFieldUnderGround(
              hintText: "Gender",
              title: "Gender",
              hasIcon: true,
            ),
            const TextFieldUnderGround(
              hintText: "xyz@gmail.com",
              title: "Email",
              hasIcon: true,
            ),
            const TextFieldUnderGround(
              hintText: "Password",
              title: "Password",
            ),
            Text(
              "Delete Account",
              style: context.textStyle.displayMedium?.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.deleteButtonColor,
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TextFieldUnderGround extends StatelessWidget {
  const TextFieldUnderGround(
      {super.key,
      this.hintText,
      this.text,
      this.title,
      this.hasIcon,
      this.controller});

  final String? hintText;
  final String? text;
  final String? title;
  final bool? hasIcon;

  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title ?? "",
          style: context.textStyle.displayMedium!.copyWith(
              fontSize: 14.sp,
              color: AppColors.lightIconColor.withValues(alpha: 0.5),
              fontWeight: FontWeight.w500),
        ),
        12.ph,
        TextField(
          controller: controller,
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
                fontWeight: FontWeight.w500,
                color: AppColors.lightIconColor.withValues(alpha: 0.5)),

            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: AppColors.lightIconColor.withValues(alpha: 0.05)),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.blue, width: 2.0),
            ),
            errorBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 2.0),
            ),
          ),
        ),
        24.ph,
      ],
    );
  }
}
