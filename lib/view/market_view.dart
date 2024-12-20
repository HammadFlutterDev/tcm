import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tcm/config/app_styles.dart';
import 'package:tcm/config/asset_path.dart';
import 'package:tcm/providers/product_provider.dart';
import 'package:tcm/view/home_view.dart';
import 'package:tcm/view/search_product_view.dart';
import 'package:tcm/widgets/category_widget.dart';
import 'package:tcm/widgets/custom_search_bar_widget.dart';
import 'package:tcm/widgets/tab_screen_template.dart';
import '../models/category_data_model.dart';
import '../utils/app_router.dart';

class MarketView extends ConsumerStatefulWidget {
  const MarketView({super.key});

  @override
  ConsumerState<MarketView> createState() => _MarketViewConsumerState();
}

class _MarketViewConsumerState extends ConsumerState<MarketView> {
  @override
  Widget build(BuildContext context) {
    final products = ref.watch(productDataProvider).nearByProducts;
    return TabScreenTemplate(
        tabIndex: 1,
        height: 162.h,
        topImage: Assets.marketTopViewImage,
        childrens: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppStyles.screenHorizontalPadding),
            child: CustomSearchBarWidget(
                controller: TextEditingController(), hintText: "What are you looking for?"),
          ),
          CategoriesWidget(items: CategoryDataModel.categories),
          ProductDisplayWidget(
            title: "Marketplace All Prodcuts",
            items: products,
            onTap: (){
            AppRouter.push(const SearchProductView(
              title:"Marketplace All Prodcuts",
            ));
          },
          ),
          ProductDisplayWidget(
            title: "Discounted Pre-owned Beverages",
            items: products,
            onTap: (){
            AppRouter.push(const SearchProductView(
              title:"Discounted Pre-owned Beverages",
            ));
          },
          ),
          const OfferWidget(),
          ProductDisplayWidget(
            title: "Discounted Pre-owned Grocery",
            items: products,
            onTap: (){
               AppRouter.push(const SearchProductView(
              title:"Discounted Pre-owned Grocery",
            ));
            },
          ),
          ProductDisplayWidget(
            title: "Pre-owned Entertainment",
            items: products,
            onTap: (){
 AppRouter.push(const SearchProductView(
              title:"Pre-owned Entertainment",
            ));
            },
          ),
          ProductDisplayWidget(
            title: "Pre-owned Infant",
            items: products,
            onTap: (){
              AppRouter.push(const SearchProductView(
              title:"Pre-owned Infant",
            ));
            },
          ),
          const BannerWidget()
        ]);
  }
}
