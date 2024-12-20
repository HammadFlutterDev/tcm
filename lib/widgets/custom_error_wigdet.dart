import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tcm/utils/app_extensions.dart';


// import '../config/asset_path.dart';
import 'custom_button_widget.dart';

class CustomErrorWidget extends StatelessWidget {
  final bool isLoad;
  final VoidCallback onPressed;
  const CustomErrorWidget(
      {super.key, this.isLoad = false, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Lottie.asset(Assets.internetIssueAnimation,
        //     repeat: true, width: 200.r, fit: BoxFit.fill),
        Text(
          "Something went wrong!\nPlease check your internet connection",
          style: context.textStyle.bodyMedium!.copyWith(fontSize: 16.sp),
          textAlign: TextAlign.center,
        ),
        10.ph,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 120.w,
              height: 40.h,
              child: CustomOutlineButtonWidget(
                  isLoad: isLoad,
                  outlineColor: context.colors.primary,
                  textColor: context.colors.primary,
                  color: Colors.white,
                  title: "Load Again",
                  onPressed: onPressed),
            ),
          ],
        )
      ],
    );
  }
}
