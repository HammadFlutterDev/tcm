import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tcm/utils/app_extensions.dart';
import 'package:tcm/widgets/scroll_behavior.dart';

import '../config/app_colors.dart';

class CommonScreenTemplateWidget extends StatelessWidget {
  final String title;
  final Widget? leadingWidget;
  final Widget? actionWidget;
  final Widget child;
  final double? appBarHeight;
  final PreferredSizeWidget? bottomAppbarWidget;
  final Widget? bottomWidget;

  const CommonScreenTemplateWidget(
      {super.key,
      this.leadingWidget,
      required this.title,
      required this.child,
      this.actionWidget,
      this.appBarHeight,
      this.bottomWidget,
      this.bottomAppbarWidget});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor1,
      bottomSheet: bottomWidget,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
            appBarHeight ?? AppBar().preferredSize.height + 40.h),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: leadingWidget,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            title,
            style: context.textStyle.displayMedium!.copyWith(fontSize: 18.sp),
          ),
          iconTheme: IconThemeData(size: 100.r),
          actions: actionWidget != null ? [actionWidget!, 20.pw] : null,
          bottom: bottomAppbarWidget,
        ),
      ),
      body: ScrollConfiguration(behavior: MyBehavior(), child: child),
    );
  }
}
