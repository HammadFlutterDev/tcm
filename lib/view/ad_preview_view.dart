import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tcm/config/app_colors.dart';
import 'package:tcm/config/app_styles.dart';
import 'package:tcm/config/asset_path.dart';
import 'package:tcm/utils/app_extensions.dart';
import 'package:tcm/view/ad_product_view.dart';

import 'package:tcm/widgets/common_screen_template_widget.dart';
import 'package:tcm/widgets/custom_back_button_widget.dart';
import 'package:tcm/widgets/custom_button_widget.dart';
import 'package:tcm/widgets/display_network_image.dart';

import 'package:tcm/widgets/scroll_behavior.dart';

import '../widgets/custom_see_more_text_widget.dart';

class AdPreviewView extends StatelessWidget {
  const AdPreviewView({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonScreenTemplateWidget(
        leadingWidget: const CustomBackButtonWidget(),
        title: "Your Ad",
        appBarHeight: 70.h,
        bottomWidget: Padding(
          padding: EdgeInsets.all(AppStyles.screenHorizontalPadding),
          child: CustomButtonWidget(
            onPressed: () {},
            title: "Delete",
            color: AppColors.deleteButtonColor,
          ),
        ),
        child: ScrollConfiguration(
          behavior: MyBehavior(),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const ProductMultipleImageDisplayWidget(
                  images: [
                    'https://1ststep.pk/cdn/shop/files/6_ad59d255-a4ec-4b7e-bde5-f3abab93952a_2048x.jpg?v=1704113247',
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRU3Bpf3m2w-2uETB2xWO2sl_ptGHBmGk-KmzIL7H0mygftrhf_7d7Ad0sAvUE5IdEZh-I&usqp=CAU',
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQLyXVeJrvWpaA_WsYE1HO99ILjEDH4abbaj18U8YSBoXcKH4S3ODd0En5NU-q4Cl1Xw4I&usqp=CAU',
                    'https://static-01.daraz.pk/p/9721529763177d470be998d05d5e656f.jpg',
                    'https://m.media-amazon.com/images/I/71A3Npdd81L._AC_SY395_.jpg',
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppStyles.screenHorizontalPadding),
                  child: const Column(
                    // spacing: 10.h,
                    children: [
                      ProductTitleWidget(),
                      AdDetailWidget(),
                      ProductDetailWidget(),
                      LocationDetailWidget(),
                    ],
                  ),
                ),
                150.ph
              ],
            ),
          ),
        ));
  }
}

class ProductDetailWidget extends StatelessWidget {
  final String? description;
  final List<String>? features;

  const ProductDetailWidget({super.key, this.description, this.features});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      // spacing: 12.h,
      children: [
        const TitleHeadingWidget(title: "Product Detail"),
        Row(
          children: [
            Expanded(
                child: Text(
              description ??
                  "Red Bull Energy Drink is a premium energy beverage designed to give you wings whenever you need them. Whether you're tackling a busy day, pursuing sports, or studying late at night, Red Bull provides a quick and effective energy boost.",
              style: context.textStyle.bodyMedium,
            )),
          ],
        ),
        Text(
          "Key Features",
          style: context.textStyle.bodyMedium,
        ),
        Padding(
            padding: EdgeInsets.only(left: 10.r),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "•",
                  style: context.textStyle.bodyMedium!,
                ),
                10.pw,
                Expanded(
                    child: Text(
                  features?[0] ?? "This is Best" * 10,
                  style: context.textStyle.bodyMedium,
                )),
              ],
            )),
        Padding(
          padding: EdgeInsets.only(left: 10.r),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "•",
                style: context.textStyle.bodyMedium!,
              ),
              10.pw,
              Expanded(
                child: TextWithSeeMore(
                  maxLength: 20,
                  text: features?[0] ?? "Convenient Packaging" * 10,
                ),
              ),
            ],
          ),
        )
        // Row(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     Text(
        //       " •",
        //       style: context.textStyle.bodyMedium!
        //           .copyWith(color: const Color(0xff727272)),
        //     ),
        //     10.pw,
        //     Expanded(
        //       child: Text(
        //         "sfdghasfdgasfdgh" * 1,
        //         style: context.textStyle.bodyMedium!,
        //         // overflow: TextOverflow.ellipsis, // Add ellipsis if text overflows
        //       ),
        //     ),
        //   ],
        // )
      ],
    );
  }
}

class LocationDetailWidget extends StatelessWidget {
  const LocationDetailWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      // spacing: 12.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleHeadingWidget(title: "Location"),
        AddressDisplayTextWidget(address: "Rainbow Resort, San Luis Obispo"),
        LocationWidget()
      ],
    );
  }
}

class AdDetailWidget extends StatelessWidget {
  final bool? showRecipt;
  final VoidCallback? onTap;

  const AdDetailWidget({super.key, this.showRecipt = false, this.onTap});

  @override
  Widget build(BuildContext context) {
    List<ProductDetailTitleDataModel> list = [];
    if (showRecipt!) {
      list = List.from(ProductDetailTitleDataModel.detailList);
      list.insertAll(2, [
        ProductDetailTitleDataModel(
            title: "Buying receipt", description: "View Receipt")
      ]);
    } else {
      list = List.from(ProductDetailTitleDataModel.detailList);
    }
    return Column(
      // spacing: 10.h,
      children: [
        const Row(
          children: [TitleHeadingWidget(title: "Details")],
        ),
        ...List.generate(
          list.length,
          (index) => ProductDetailTitleWidget(
            title: list[index].title,
            description: list[index].description,
            showOutline: index != list.length - 1,
            onTap: onTap,
          ),
        )
      ],
    );
  }
}

class ProductDetailTitleWidget extends StatelessWidget {
  final String title;
  final String description;
  final bool showOutline;
  final VoidCallback? onTap;

  const ProductDetailTitleWidget(
      {super.key,
      required this.title,
      required this.description,
      this.onTap,
      this.showOutline = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 3.r),
      padding: EdgeInsets.symmetric(vertical: 5.r),
      decoration: BoxDecoration(
          border: showOutline
              ? Border(bottom: BorderSide(color: AppColors.borderColor))
              : null),
      child: Row(
        children: [
          Text(
            title,
            style: context.textStyle.bodyMedium!.copyWith(fontSize: 16.sp),
          ),
          Expanded(
              child: description != "View Receipt"
                  ? Text(
                      description,
                      textAlign: TextAlign.right,
                      style: context.textStyle.displayMedium!
                          .copyWith(fontSize: 16.sp),
                    )
                  : GestureDetector(
                      onTap: onTap,
                      child: Text(
                        description,
                        textAlign: TextAlign.right,
                        style: context.textStyle.displayMedium!.copyWith(
                          decoration: TextDecoration.underline,
                          fontSize: 16.sp,
                          color: AppColors.primaryColor,
                        ),
                      )))
        ],
      ),
    );
  }
}

class ProductTitleWidget extends StatelessWidget {
  final String? title;
  final String? address;
  final String? price;

  const ProductTitleWidget({super.key, this.title, this.address, this.price});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                title ??
                    "Best Travel neck pillow available two sets in good price",
                style:
                    context.textStyle.displayLarge!.copyWith(fontSize: 20.sp),
              ),
            )
          ],
        ),
        10.ph,
        Row(
          children: [
            Text(
              "\$${price ?? 12.00}",
              style: context.textStyle.headlineLarge,
            ),
          ],
        ),
        AddressDisplayTextWidget(
            address: address ?? "Rainbow Resort, San Luis Obispo")
      ],
    );
  }
}

class AddressDisplayTextWidget extends StatelessWidget {
  final String address;

  const AddressDisplayTextWidget({super.key, required this.address});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(Assets.locationIcon,
            colorFilter: ColorFilter.mode(
              context.colors.primary,
              BlendMode.srcIn,
            )),
        5.pw,
        Expanded(
            child: Text(
          address,
          style: context.textStyle.bodyMedium!
              .copyWith(color: context.colors.primary),
        ))
      ],
    );
  }
}

class ProductMultipleImageDisplayWidget extends StatefulWidget {
  final List<String> images;

  final double? height;

  const ProductMultipleImageDisplayWidget(
      {super.key, this.height, required this.images});

  @override
  State<ProductMultipleImageDisplayWidget> createState() =>
      _ProductMultipleImageDisplayWidgetState();
}

class _ProductMultipleImageDisplayWidgetState
    extends State<ProductMultipleImageDisplayWidget> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 397.h,
      width: double.infinity,
      child: Column(
        children: [
          Expanded(
              child: DisplayNetworkImage(
            imageUrl: widget.images[index],
            width: double.infinity,
          )),
          5.ph,
          SizedBox(
            height: 70.h,
            width: double.infinity,
            child: ListView.separated(
                padding: EdgeInsets.symmetric(
                    horizontal: AppStyles.screenHorizontalPadding,
                    vertical: 5.r),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, i) => GestureDetector(
                      onTap: () {
                        index = i;
                        setState(() {});
                      },
                      child: Container(
                        height: 62.r,
                        width: 65.r,
                        padding: index == i ? EdgeInsets.all(1.4.r) : null,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            gradient: AppColors.primaryGradinet),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.r - 1.4.r),
                            child: DisplayNetworkImage(
                                imageUrl: widget.images[i])),
                      ),
                    ),
                separatorBuilder: (context, index) => 7.pw,
                itemCount: widget.images.length),
          )
        ],
      ),
    );
  }
}

class ProductDetailTitleDataModel {
  late final String title;
  late final String description;

  ProductDetailTitleDataModel({required this.title, required this.description});

  static final List<ProductDetailTitleDataModel> detailList = [
    ProductDetailTitleDataModel(title: "Brand", description: "Unknown"),
    ProductDetailTitleDataModel(title: "Condition", description: "New"),
    ProductDetailTitleDataModel(
        title: "Check In", description: "20 may 2024,3:20pm"),
    ProductDetailTitleDataModel(
        title: "Check Out", description: "26 may 2024,3:20pm"),
    ProductDetailTitleDataModel(title: "Set", description: "2"),
  ];
}
