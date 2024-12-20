import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tcm/config/app_styles.dart';
import 'package:tcm/providers/bottom_index_provider.dart';
import 'package:tcm/utils/app_extensions.dart';
import 'package:tcm/utils/app_router.dart';
import 'package:tcm/view/buy_product_view.dart';
import 'package:tcm/view/community_view.dart';
import 'package:tcm/view/home_view.dart';
import 'package:tcm/view/market_view.dart';
import 'package:tcm/view/sell_product_view.dart';
import 'package:tcm/view/vender_view.dart';
import 'package:tcm/widgets/custom_bottom_app_bar_widget.dart';

import '../config/asset_path.dart';

class NavigationView extends StatefulWidget {
  const NavigationView({super.key});

  @override
  State<NavigationView> createState() => _NavigationViewState();
}

class _NavigationViewState extends State<NavigationView> {
  List<BottomItemDataModel> tabs = BottomItemDataModel.bottomTabsList;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          // appLog("app close");
          showExitDialog(context);
        }
      },
      child: Consumer(builder: (context, ref, child) {
        final selectIndex = ref.watch(bottomIndexProvider);
        return Scaffold(
          backgroundColor: context.colors.primaryContainer,
          bottomNavigationBar: CustomBottomAppBarWidget(
            bottomItems: tabs,
            selectIndex: selectIndex,
          ),
          body: selectIndex != 2
              ? tabs[selectIndex].widget
              : Stack(
                  children: [
                    tabs[1].widget,
                    Positioned.fill(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                            sigmaX: 22.5, sigmaY: 22.5), // Blur effect
                        child: Container(
                          color: Colors
                              .transparent, // Make the background transparent
                        ),
                      ),
                    ),
                    Positioned(
                        top: 50.0,
                        child: IconButton(
                            onPressed: () {
                              ref
                                  .read(bottomIndexProvider.notifier)
                                  .setIndex(0);
                            },
                            icon: Container(
                              width: 30.r,
                              height: 30.r,
                              decoration: const BoxDecoration(
                                  color: Colors.white, shape: BoxShape.circle),
                              child: Icon(
                                Icons.close,
                                size: 23.r,
                              ),
                            ))),
                    Positioned(
                        bottom: 50.0,
                        left: 0,
                        right: 0,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: AppStyles.screenHorizontalPadding),
                          child: Column(
                            children: [
                              PurchasingOptionButtonWidget(
                                icon: Assets.bagIcon,
                                title: "Sell Your Pre-owned Product",
                                onTap: () {
                                  AppRouter.push(const SellProductView());
                                },
                              ),
                              10.ph,
                              PurchasingOptionButtonWidget(
                                icon: Assets.dollarCircleIcon,
                                title: "Buy Your Desired Product",
                                onTap: () {
                                   AppRouter.push(const BuyProductView());
                                },
                              )
                            ],
                          ),
                        ))
                  ],
                ),
        );
      }),
    );
  }
}

class PurchasingOptionButtonWidget extends StatelessWidget {
  final String title;
  final String icon;
  final VoidCallback onTap;
  const PurchasingOptionButtonWidget(
      {super.key,
      required this.title,
      required this.icon,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: context.screenwidth,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 18.r),
        height: 48.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(500.r),
            border: Border.all(
                width: 1, color: const Color.fromRGBO(0, 0, 0, 0.10)),
            color: Colors.white),
        child: Row(
          children: [
            SvgPicture.asset(icon),
            10.pw,
            Expanded(
                child: Text(
              title,
              style: context.textStyle.displayMedium,
            )),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
              size: 17.r,
            )
          ],
        ),
      ),
    );
  }
}

class BottomItemDataModel {
  late final String label;
  late final String selectIcon;
  late final String icon;
  late final Widget widget;

  BottomItemDataModel(
      {required this.label,
      required this.icon,
      required this.selectIcon,
      required this.widget});

  static final List<BottomItemDataModel> bottomTabsList = [
    BottomItemDataModel(
        label: "Home",
        icon: Assets.homeIcon,
        selectIcon: Assets.homeSelectIcon,
        widget: const HomeView()),
    BottomItemDataModel(
        label: "Marketplace",
        icon: Assets.marketIcon,
        selectIcon: Assets.marketSelectIcon,
        widget: const MarketView()),
    BottomItemDataModel(
        label: "Buy/Sell",
        icon: Assets.handShakeIcon,
        selectIcon: Assets.handShakeIcon,
        widget: const Center(
          child: Text("Buy/Sell View"),
        )),
    BottomItemDataModel(
        label: "Vendor",
        icon: Assets.venderIcon,
        selectIcon: Assets.venderSelectIcon,
        widget: const VenderView()),
    BottomItemDataModel(
        label: "Community",
        icon: Assets.communityIcon,
        selectIcon: Assets.communitySelectIcon,
        widget: const CommunityView()),
  ];
}

Future<bool> showExitDialog(BuildContext context) async {
  return (await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: const Text("Are you sure you want to exit the app?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text(
                "Cancel",
                style: context.textStyle.titleMedium!
                    .copyWith(fontWeight: FontWeight.w500),
              ),
            ),
            TextButton(
              onPressed: () => SystemNavigator.pop(),
              child: Text("Exit",
                  style: context.textStyle.titleMedium!
                      .copyWith(fontWeight: FontWeight.w500)),
            ),
          ],
        ),
      )) ??
      false; // Return false if dialog is dismissed without an option
}
