import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tcm/utils/app_extensions.dart';

class CustomSocialButtonWidget extends StatelessWidget {
  final String title;
  final String icon;
  final VoidCallback onTap;
  const CustomSocialButtonWidget({super.key, required this.title, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
                    width: double.infinity,
                    height: 50.h,
                    padding: EdgeInsets.symmetric(horizontal: 20.r, vertical: 3),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: context.colors.secondary,
                        borderRadius: BorderRadius.circular(500.r)),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                         icon,
                        ),
                        const Spacer(),
                        Text(
                         title,
                          style: context.textStyle.labelMedium!
                              .copyWith(fontSize: 16.sp),
                        ),
                        20.pw,
                        const Spacer(),
                      ],
                    ),
                  ),
    );
  }
}