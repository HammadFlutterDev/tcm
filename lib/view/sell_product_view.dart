import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tcm/config/app_colors.dart';
import 'package:tcm/models/category_data_model.dart';
import 'package:tcm/utils/app_extensions.dart';
import 'package:tcm/utils/app_router.dart';
import 'package:tcm/view/ad_product_view.dart';
import 'package:tcm/widgets/buy_sell_screen_template_widget.dart';
import 'package:tcm/widgets/common_screen_template_widget.dart';
import 'package:tcm/widgets/custom_back_button_widget.dart';

import '../widgets/display_network_image.dart';

class SellProductView extends StatelessWidget {
  final String? title;
  final List<Widget>? children;
  final bool? showSearchBar;
  // final CategoryDataModel? category;
  const SellProductView({
    super.key,
    this.title,
    this.children,
    this.showSearchBar = false,
  });

  @override
  Widget build(BuildContext context) {
    return CommonScreenTemplateWidget(
        title: "Sell Your Pre-owned Product",
        leadingWidget: const CustomBackButtonWidget(),
        child: BuySellScreenTemplateWidget(
            title: title ?? "All Categories",
            searchEnable: showSearchBar,
            childrens: children ??
                List.generate(
                  CategoryDataModel.categories.length,
                  (index) => Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ProductCategoryTitleWidget(
                        showLeadWidget: true,
                        title: CategoryDataModel.categories[index].title,
                        onTap: () {
                          AppRouter.push(SellProductView(
                            children: List.generate(
                                CategoryDataModel.sellSubCategories.length,
                                (index) => ProductCategoryTitleWidget(
                                      title: CategoryDataModel
                                          .sellSubCategories[index].title,
                                      onTap: () {
                                        AppRouter.push(SellProductView(
                                          showSearchBar: true,
                                          title: CategoryDataModel
                                              .sellSubCategories[index].title,
                                          children: List.generate(
                                              CategoryDataModel
                                                  .sellSubInnerCategories
                                                  .length,
                                              (index) =>
                                                  ProductCategoryTitleWidget(
                                                    title: CategoryDataModel
                                                        .sellSubInnerCategories[
                                                            index]
                                                        .title,
                                                    onTap: () {
                                                      AppRouter.push(AdProductView(
                                                          category:
                                                              CategoryDataModel
                                                                      .categories[
                                                                  index],
                                                          subCategoryTitle:
                                                              CategoryDataModel
                                                                  .sellSubInnerCategories[
                                                                      index]
                                                                  .title));
                                                    },
                                                    showLeadWidget: false,
                                                  )),
                                        ));
                                      },
                                      showLeadWidget: false,
                                    )),
                          ));
                        },
                        imageUrl: CategoryDataModel.categories[index].imageUrl,
                      ),
                      15.ph
                    ],
                  ),
                )));
  }
}

class ProductCategoryTitleWidget extends StatelessWidget {
  final bool? showLeadWidget;
  final String title;
  final String? imageUrl;
  final VoidCallback onTap;
  final bool? isSelectOpt;
  final bool? isCheck;
  const ProductCategoryTitleWidget(
      {super.key,
      this.showLeadWidget = false,
      required this.title,
      required this.onTap,
      this.isSelectOpt = false,
      this.isCheck = false,
      this.imageUrl = ""});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
      visualDensity: const VisualDensity(horizontal: -4.0),
      horizontalTitleGap: showLeadWidget! ? 25.r : null,
      leading: showLeadWidget!
          ? Container(
              height: 62.r,
              width: 62.r,
              decoration: BoxDecoration(
                  color: context.colors.onInverseSurface,
                  borderRadius: BorderRadius.circular(5000.r)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5000.r),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      left: -20,
                      bottom: -1,
                      child: ClipRRect(
                        clipBehavior: Clip.none,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(500.r)),
                        child: DisplayNetworkImage(
                          imageUrl: imageUrl!,
                          width: 70.r,
                          height: 40.r,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : null,
      title: Text(
        title,
        style: context.textStyle.bodyMedium!.copyWith(
            fontSize: 16.sp,
            color: isSelectOpt!
                ? Colors.black.withValues(alpha: 0.5)
                : Colors.black),
      ),
      trailing: !isSelectOpt!
          ? Icon(
              Icons.arrow_forward_ios,
              size: 15.r,
              color: Colors.black,
            )
          : GestureDetector(
              child: Container(
                width: 30.r,
                height: 30.r,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: isCheck! ? AppColors.primaryGradinet : null,
                  color: !isCheck! ? Colors.grey.withValues(alpha: 0.2) : null,
                ),
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 18.r,
                ),
              ),
            ),
    );
  }
}
