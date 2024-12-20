import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tcm/config/app_styles.dart';
import 'package:tcm/utils/app_extensions.dart';

class BuySellScreenTemplateWidget extends StatefulWidget {
  final String title;
  final List<Widget> childrens;
  final bool? searchEnable;
  const BuySellScreenTemplateWidget(
      {super.key,
      required this.title,
      required this.childrens,
      this.searchEnable = false});

  @override
  State<BuySellScreenTemplateWidget> createState() =>
      _BuySellScreenTemplateWidgetState();
}

class _BuySellScreenTemplateWidgetState
    extends State<BuySellScreenTemplateWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding:
          EdgeInsets.symmetric(horizontal: AppStyles.screenHorizontalPadding),
      children: [
        Text(
          widget.title,
          style: context.textStyle.displayMedium!.copyWith(fontSize: 18.sp),
        ),
        20.ph,
        ...widget.childrens
      ],
    );
  }
}
