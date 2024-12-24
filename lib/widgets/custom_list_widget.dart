import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tcm/utils/app_extensions.dart';

import '../config/app_colors.dart';

class CustomListWidget extends StatelessWidget {
  const CustomListWidget({
    super.key,
    required this.iconPayment,
    required this.title,
    this.width,
    this.height,
    this.color,
    this.onTap,
  });

  final String? iconPayment;
  final String title;
  final VoidCallback? onTap;
  final double? width;
  final double? height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              width: 1, color: AppColors.lightIconColor.withOpacity( 0.1)),
        ),
        child: ListTile(
          leading: Container(
            height: 50.h,
            width: 50.w,
            decoration: BoxDecoration(
              color: AppColors.secondaryColor1,
              borderRadius: BorderRadius.circular(8),
            ),
            padding: EdgeInsets.all(8.r),
            child: SvgPicture.asset(iconPayment!),
          ),
          title: Text(title,
              style: context.textStyle.displayMedium!.copyWith(
                  fontSize: 16.sp,
                  color: AppColors.lightIconColor,
                  fontWeight: FontWeight.w600)),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: color ?? AppColors.lightIconColor,
            size: 16.r,
          ),
        ),
      ),
    );
  }
}
