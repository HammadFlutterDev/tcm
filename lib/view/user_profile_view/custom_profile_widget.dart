import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tcm/config/app_colors.dart';
import 'package:tcm/utils/app_extensions.dart';

class CustomProfileScreenWidget extends StatelessWidget {
  final String icon;
  final String title;
  final VoidCallback? onTap;
  final double? width;
  final double? height;
  final Color? color;

  const CustomProfileScreenWidget({
    Key? key,
    required this.icon,
    required this.title,
    this.width,
    this.height,
    this.color,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: AppColors.scaffoldColor1,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              width: 1, color: AppColors.lightIconColor.withOpacity( 0.1)),
        ),
        child: Row(
          children: [
            SizedBox(width: 12.w),
            Container(
              width: width ?? 40.r,
              height: height ?? 40.r,
              padding: EdgeInsets.all(8.r),
              child: SvgPicture.asset(icon),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: color ?? AppColors.lightIconColor),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: color ?? AppColors.lightIconColor,
              size: 16.r,
            ),
            12.pw,
          ],
        ),
      ),
    );
  }
}
