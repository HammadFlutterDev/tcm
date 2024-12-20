import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tcm/config/asset_path.dart';
import 'package:tcm/providers/product_provider.dart';
import 'package:tcm/view/home_view.dart';
import 'package:tcm/widgets/category_widget.dart';
import 'package:tcm/widgets/tab_screen_template.dart';
import '../models/category_data_model.dart';


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
          CategoriesWidget(items: CategoryDataModel.categories),
          ProductDisplayWidget(
              title: "Marketplace All Prodcuts",
              items: products,
              ),
          ProductDisplayWidget(
              title: "Discounted Pre-owned Beverages",
              items: products,
              ),
          const OfferWidget(),
          ProductDisplayWidget(
              title: "Discounted Pre-owned Grocery",
              items: products,
              ),
          ProductDisplayWidget(
              title: "Pre-owned Entertainment",
              items: products,
             ),
          ProductDisplayWidget(
              title: "Pre-owned Infant",
              items: products,
             ),
          const BannerWidget()
        ]);
  }
}
