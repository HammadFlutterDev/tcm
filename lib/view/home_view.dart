import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tcm/config/app_colors.dart';
import 'package:tcm/config/app_styles.dart';
import 'package:tcm/config/asset_path.dart';
import 'package:tcm/models/category_data_model.dart';
import 'package:tcm/models/product_data_model.dart';
import 'package:tcm/providers/product_provider.dart';
import 'package:tcm/utils/app_extensions.dart';
import 'package:tcm/utils/app_router.dart';
import 'package:tcm/view/search_product_view.dart';
import 'package:tcm/widgets/cutom_dot_slide_widget.dart';
import 'package:tcm/widgets/display_network_image.dart';
import 'package:tcm/widgets/tab_screen_template.dart';
import '../widgets/category_widget.dart';
import '../widgets/product_widget.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewConsumerState();
}

class _HomeViewConsumerState extends ConsumerState<HomeView> {
  @override
  Widget build(BuildContext context) {
    final products = ref.watch(productDataProvider).nearByProducts;
    return TabScreenTemplate(
      height: 288.h,
      tabIndex: 0,
      topImage: Assets.beachViewImage,
      childrens: [
        20.ph,
        const AdSliderWidget(
          images: [
            // Add your image URLs here
            "https://i.ibb.co/ftqt8BH/Frame-719.png",
            "https://i.ibb.co/ftqt8BH/Frame-719.png",
            "https://i.ibb.co/ftqt8BH/Frame-719.png",
          ],
        ),
        10.ph,
        CategoriesWidget(
          items: CategoryDataModel.categories,
          isShowTitle: true,
        ),
        ProductDisplayWidget(
          items: products,
          title: "Pre-owned Items Nearby",
          onTap: () {
            AppRouter.push(const SearchProductView(
              title: "Pre-owned Items Nearby",
            ));
          },
        ),
        const BannerWidget(),
        ProductDisplayWidget(
          items: products,
          title: "Discounted Pre-owned Beverages",
          onTap: (){
            AppRouter.push(const SearchProductView(
              title:"Discounted Pre-owned Beverages",
            ));
          },
        ),
        const OfferWidget(),
        ProductDisplayWidget(
          items: products,
          showAddCard: true,
          title: "Buy from Stores",
          onTap: (){
             AppRouter.push(const SearchProductView(
              title:"Buy from Stores",
            ));
          },
        ),
      ],
    );
  }
}

class OfferWidget extends StatelessWidget {
  const OfferWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.h,
      padding: EdgeInsets.only(
          top: 15.r, left: AppStyles.screenHorizontalPadding, bottom: 15.r),
      margin: EdgeInsets.only(bottom: 10.r),
      color: AppColors.primaryColor,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: Text(
                "Hurry! Vacation deals vanish fast!",
                style: context.textStyle.displayMedium!
                    .copyWith(color: Colors.white, fontSize: 18.sp),
              ))
            ],
          ),
          Row(
            children: [
              Expanded(
                  child: Text(
                "These pre-owned vacation treasures disappear soon",
                style:
                    context.textStyle.bodyMedium!.copyWith(color: Colors.white),
              ))
            ],
          ),
          Expanded(
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 30.r),
              physics:
                  const ClampingScrollPhysics() // Horizontal scrolling without overflow
              , // Disable scrolling if it's vertical
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:
                    1, // Single column horizontally, 2 columns vertically
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 1.0,
                childAspectRatio: 0.65.r, // Adjust aspect ratio based on layout
              ),
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.all(10.r),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.r)),
                  child: Row(
                    children: [
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10.r),
                                height: 22.h,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    gradient: AppColors.primaryGradinet,
                                    borderRadius: BorderRadius.circular(500.r)),
                                child: Text(
                                  "${index + 1} Day Left",
                                  style: context.textStyle.bodySmall!.copyWith(
                                      color: Colors.white, fontSize: 10.sp),
                                ),
                              ),
                            ],
                          ),
                          3.ph,
                          Text(
                            "Feelflows twin fish keel",
                            style: context.textStyle.labelMedium,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            "\$320.00",
                            style: context.textStyle.displayMedium!
                                .copyWith(fontSize: 18.sp),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      )),
                      Container(
                        width: 84.r,
                        decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(8.r)),
                      )
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class BannerWidget extends StatelessWidget {
  const BannerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      margin: EdgeInsets.only(bottom: 10.r),
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                Assets.bannerImage,
              ),
              fit: BoxFit.cover)),
    );
  }
}

class ProductDisplayWidget extends StatelessWidget {
  final String title;
  final List<ProductDataModel> items;
  final VoidCallback? onTap;
  final bool? showSeeAll;
  final bool? showAddCard;
  final double? height;
  const ProductDisplayWidget({
    super.key,
    required this.title,
    required this.items,
    this.onTap,
    this.showSeeAll = true,
    this.showAddCard = false,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 320.h,
      margin: EdgeInsets.only(bottom: 20.r),
      padding:
          EdgeInsets.symmetric(horizontal: AppStyles.screenHorizontalPadding),
      width: double.infinity,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: Text(
                title,
                style:
                    context.textStyle.displayMedium!.copyWith(fontSize: 18.sp),
              )),
              if (showSeeAll!)
                TextButton(
                    onPressed: onTap,
                    child: Text(
                      "See All",
                      style: context.textStyle.bodyMedium!
                          .copyWith(color: AppColors.primaryColor),
                    ))
            ],
          ),
          Expanded(
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: items.length,
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics:
                  const ClampingScrollPhysics() // Horizontal scrolling without overflow
              , // Disable scrolling if it's vertical
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:
                    1, // Single column horizontally, 2 columns vertically
                mainAxisSpacing: 12.r,
                crossAxisSpacing: 1.r,
                childAspectRatio: 1.7.r, // Adjust aspect ratio based on layout
              ),
              itemBuilder: (context, index) {
                return ProductItemCard(
                  product: items[index],
                  isAddToCard: showAddCard,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class AdSliderWidget extends StatefulWidget {
  final List<String> images;
  const AdSliderWidget({super.key, required this.images});

  @override
  State<AdSliderWidget> createState() => _AdSliderWidgetState();
}

class _AdSliderWidgetState extends State<AdSliderWidget> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();

    // Automatically transition images every 3 seconds
    _timer = Timer.periodic(const Duration(seconds: 3), _onTimerTick);
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _onTimerTick(Timer timer) {
    if (_currentIndex < widget.images.length - 1) {
      _currentIndex++;
    } else {
      _currentIndex = 0;
    }

    _pageController.animateToPage(
      _currentIndex,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: AppStyles.screenHorizontalPadding),
      child: Column(
        children: [
          Container(
            height: 105.0,
            decoration: BoxDecoration(
              color: Colors.blue, // Use your primary color here
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: PageView.builder(
                controller: _pageController,
                itemCount: widget.images.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return DisplayNetworkImage(imageUrl: widget.images[index]);
                },
              ),
            ),
          ),
          7.ph,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PagerDot(
                length: widget.images.length,
                currentIndex: _currentIndex,
                isCircle: true,
              )
            ],
          ),
        ],
      ),
    );
  }
}
