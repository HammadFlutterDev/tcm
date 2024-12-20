import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_router.dart';

class CustomBackButtonWidget extends StatelessWidget {
  final VoidCallback? onTap;
  const CustomBackButtonWidget({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        padding: EdgeInsets.zero,
        visualDensity: const VisualDensity(horizontal: -4.0),
        onPressed: onTap ??
            () {
              AppRouter.back();
            },
        icon: Container(
          width: 31.r,
          height: 31.r,
          padding: EdgeInsets.all(5.r),
          alignment: Alignment.center,
          decoration:
              const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
          child: Icon(
            Icons.arrow_back_ios_new,
            size: 21.r,
          ),
        ));
  }
}