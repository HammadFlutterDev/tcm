import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tcm/config/app_styles.dart';
import 'package:tcm/utils/app_extensions.dart';
import 'package:tcm/widgets/custom_search_bar_widget.dart';

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
      padding: EdgeInsets.only(
          left: AppStyles.screenHorizontalPadding,
          right: AppStyles.screenHorizontalPadding,
          bottom: 40.r),
      children: [
        if (widget.searchEnable!) ...[
          CustomSearchBarWidget(
              controller: TextEditingController(), hintText: "Search product"),
          20.ph,
        ],
        Text(
          widget.title,
          style: context.textStyle.displayMedium!.copyWith(fontSize: 18.sp),
        ),
        10.ph,
        ...widget.childrens
      ],
    );
  }
}
