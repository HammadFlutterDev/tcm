import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tcm/config/app_styles.dart';
import 'package:tcm/config/asset_path.dart';
import 'package:tcm/providers/product_provider.dart';
import 'package:tcm/utils/app_extensions.dart';
import 'package:tcm/view/vender_view.dart';
import 'package:tcm/widgets/common_screen_template_widget.dart';
import 'package:tcm/widgets/custom_back_button_widget.dart';
import 'package:tcm/widgets/custom_menu_icon_shape_widget.dart';
import 'package:tcm/widgets/custom_search_bar_widget.dart';

class SearchProductView extends StatefulWidget {
  final String title;
  const SearchProductView({super.key, required this.title});

  @override
  State<SearchProductView> createState() => _SearchProductViewState();
}

class _SearchProductViewState extends State<SearchProductView> {
  final searchTextEditController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CommonScreenTemplateWidget(
      title: widget.title,
      leadingWidget: const CustomBackButtonWidget(),
      appBarHeight: 100.h,
      actionWidget: Row(
        children: [
          CustomMenuIconShape(icon: Assets.messageicon, onTap: () {}),
          20.pw
        ],
      ),
      child: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppStyles.screenHorizontalPadding),
            child: CustomSearchBarWidget(
                controller: searchTextEditController,
                hintText: "Search product"),
          ),
          14.ph,
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppStyles.screenHorizontalPadding),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Showing:  ",
                  style: context.textStyle.bodyMedium,
                ),
                Text(
                  "152 Products",
                  style: context.textStyle.displayMedium!
                      .copyWith(fontSize: 18.sp),
                ),
              ],
            ),
          ),
          10.ph,
          Consumer(builder: (context, ref, child) {
            final product = ref.watch(productDataProvider).nearByProducts;
            return VerticalProjectsDisplayLayoutWidget(temp: product);
          })
        ],
      ),
    );
  }
}