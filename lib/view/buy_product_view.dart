import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tcm/config/app_styles.dart';

import 'package:tcm/providers/product_provider.dart';
import 'package:tcm/utils/app_extensions.dart';
import 'package:tcm/view/sell_product_view.dart';

import 'package:tcm/widgets/buy_sell_screen_template_widget.dart';
import 'package:tcm/widgets/common_screen_template_widget.dart';
import 'package:tcm/widgets/custom_button_widget.dart';

import '../models/category_data_model.dart';
import '../utils/app_router.dart';
import '../widgets/custom_back_button_widget.dart';
import 'set_location_radius_view.dart';

class BuyProductView extends StatefulWidget {
  final String? title;
  final List<Widget>? children;
  final bool? showSearchBar;
  final Widget? bottomWidget;
  final bool? isSelectionList;
  const BuyProductView(
      {super.key,
      this.title,
      this.children,
      this.showSearchBar = false,
      this.isSelectionList = false,
      this.bottomWidget});

  @override
  State<BuyProductView> createState() => _BuyProductViewState();
}

class _BuyProductViewState extends State<BuyProductView> {
  List<bool> isSelect = [];
  @override
  void initState() {
    if (widget.isSelectionList!) {
      isSelect = List.generate(
        widget.children!.length,
        (index) => false,
      );
      setState(() {});
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CommonScreenTemplateWidget(
        title: "Buy Your Desired Products",
        leadingWidget: const CustomBackButtonWidget(),
        bottomWidget: widget.bottomWidget,
        child: BuySellScreenTemplateWidget(
            title: widget.title ?? "All Categories",
            searchEnable: widget.showSearchBar,
            childrens: widget.children ??
                List.generate(
                  CategoryDataModel.categories.length,
                  (index) => Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ProductCategoryTitleWidget(
                        showLeadWidget: true,
                        title: CategoryDataModel.categories[index].title,
                        onTap: () {
                          AppRouter.push(BuyProductView(
                            children: List.generate(
                                CategoryDataModel.buySubCategories.length,
                                (index) => ProductCategoryTitleWidget(
                                      title: CategoryDataModel
                                          .buySubCategories[index].title,
                                      onTap: () {
                                        AppRouter.push(BuyProductView(
                                          title: CategoryDataModel
                                              .buySubCategories[index].title,
                                          children: List.generate(
                                              CategoryDataModel
                                                  .buyInnerCategories.length,
                                              (index) =>
                                                  ProductCategoryTitleWidget(
                                                    title: CategoryDataModel
                                                        .buyInnerCategories[
                                                            index]
                                                        .title,
                                                    onTap: () {
                                                      AppRouter.push(
                                                          BuyProductView(
                                                      
                                                        showSearchBar: true,
                                                        bottomWidget: Padding(
                                                          padding: EdgeInsets
                                                              .all(AppStyles
                                                                  .screenHorizontalPadding),
                                                          child:
                                                              CustomButtonWidget(
                                                                  title: "Next",
                                                                  onPressed:
                                                                      () {
                                                                    AppRouter.push(
                                                                        const SetLocationRadiusView());
                                                                  }),
                                                        ),
                                                        title: CategoryDataModel
                                                            .buyInnerCategories[
                                                                index]
                                                            .title,
                                                        children: List.generate(
                                                            CategoryDataModel
                                                                .buyInnerSuCategories
                                                                .length,
                                                            (index) =>
                                                                Consumer(builder:
                                                                    (context,
                                                                        ref,
                                                                        child) {
                                                                  final fruits = ref
                                                                      .watch(
                                                                          productDataProvider)
                                                                      .fruits;
                                                                  return ProductCategoryTitleWidget(
                                                                    isSelectOpt:
                                                                        true,
                                                                    isCheck: fruits[
                                                                            index]
                                                                        .isSelected,
                                                                    title: fruits[
                                                                            index]
                                                                        .title,
                                                                    onTap: () {
                                                                      ref
                                                                          .read(
                                                                              productDataProvider)
                                                                          .checkList(
                                                                              index);
                                                                    },
                                                                    showLeadWidget:
                                                                        false,
                                                                  );
                                                                })),
                                                      ));
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
