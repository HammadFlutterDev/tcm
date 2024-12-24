import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tcm/config/app_colors.dart';
import 'package:tcm/config/app_styles.dart';
import 'package:tcm/config/asset_path.dart';
import 'package:tcm/providers/product_provider.dart';
import 'package:tcm/utils/app_extensions.dart';
import 'package:tcm/utils/app_router.dart';
import 'package:tcm/view/ad_preview_view.dart';
import 'package:tcm/view/ad_product_view.dart';
import 'package:tcm/view/checkout_view.dart';
import 'package:tcm/view/my_cart_view.dart';
import 'package:tcm/view/vender_view.dart';
import 'package:tcm/widgets/custom_back_button_widget.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:tcm/widgets/custom_button_widget.dart';
import 'package:tcm/widgets/display_network_image.dart';
import 'package:tcm/widgets/scroll_behavior.dart';

import '../models/product_data_model.dart';

class VenderProductDetailView extends StatelessWidget {
  final ProductDataModel product;
  const VenderProductDetailView({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(AppStyles.screenHorizontalPadding),
        child: Row(
          children: [
            Expanded(
                child: CustomButtonWidget(
              title: "Ad to Cart",
              onPressed: () {
                AppRouter.push(const MyCartView());
              },
              border: Border.all(color: AppColors.borderColor),
              textColor: Colors.black,
              color: const Color(0xffEFEDEC),
            )),
            9.pw,
            Expanded(
                child: CustomButtonWidget(
                    title: "Buy Now",
                    onPressed: () {
                      AppRouter.push(CheckoutView(
                        product: product,
                      ));
                    }))
          ],
        ),
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(size: 100.r),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const CustomBackButtonWidget(),
      ),
      body: ScrollConfiguration(
          behavior: MyBehavior(),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ProductMultipleImageDisplayWidget(
                  images: product.productSampleImages ?? [],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppStyles.screenHorizontalPadding),
                  child: Column(
                    spacing: 10.h,
                    children: [
                      15.ph,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 27.h,
                            padding: EdgeInsets.symmetric(horizontal: 16.r),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: AppColors.secondaryColor1,
                                borderRadius: BorderRadius.circular(4.r)),
                            child: Text(
                              "Beverages",
                              style: context.textStyle.displayMedium!.copyWith(
                                  foreground: AppColors.gradientPaint),
                            ),
                          ),
                          Container(
                            height: 20.h,
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(left: 12.6.r, right: 12.6),
                            decoration: BoxDecoration(
                                color: const Color(0xffFFFF00),
                                borderRadius: BorderRadius.horizontal(
                                    left: Radius.circular(700.r),
                                    right: Radius.circular(700.r))),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Fast Dilvery',
                                  style: context.textStyle.bodyMedium,
                                ),
                                3.pw,
                                SvgPicture.asset(
                                  Assets.deliveryVanIcon,
                                  width: 17.r,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              product.productName!,
                              style: context.textStyle.displayLarge!
                                  .copyWith(fontSize: 20.sp),
                            ),
                          )
                        ],
                      ),
                      10.ph,
                      Row(
                        children: [
                          Text(
                            "\$${product.productPrice}",
                            style: context.textStyle.displayMedium!.copyWith(
                                fontWeight: FontWeight.w700, fontSize: 30.sp),
                          ),
                          5.pw,
                          Padding(
                            padding: EdgeInsets.only(bottom: 10.r),
                            child: Text(
                              "\$12.00",
                              style: context.textStyle.bodyMedium!.copyWith(
                                decoration: TextDecoration.lineThrough,
                                color: Colors.red,
                              ),
                            ),
                          ),

                          // TextSpan(
                          //     text: '2',
                          //     style: TextStyle(
                          //         color: Colors.black,
                          //         fontSize: 30,
                          //         fontFeatures: [
                          //           FontFeature.superscripts()
                          //         ])),
                          // TextSpan(
                          //     text: 'O',
                          //     style: TextStyle(
                          //         color: Colors.black, fontSize: 30)),

                          const Spacer(),
                          Container(
                            height: 27.h,
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                              horizontal: 10.r,
                            ),
                            decoration: BoxDecoration(
                              color: Colors
                                  .white, // background color (equivalent to background: #FFF)
                              borderRadius: BorderRadius.horizontal(
                                  left: Radius.circular(500.r),
                                  right: Radius.circular(
                                      500.r)), // border-radius: 500px
                              border: Border.all(
                                color: AppColors
                                    .borderColor, // border: 1px solid rgba(0, 0, 0, 0.10)
                                width: 2,
                              ),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0,
                                      0.10), // box-shadow: 0px 1px 16px 0px rgba(0, 0, 0, 0.10)
                                  blurRadius: 16,
                                  offset: Offset(0,
                                      1), // This corresponds to the 0px horizontal and 1px vertical offset
                                ),
                              ],
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "5",
                                  style: context.textStyle.displayMedium!
                                      .copyWith(
                                          height: 1.3,
                                          fontSize: 16.sp,
                                          foreground: AppColors.gradientPaint),
                                ),
                                3.pw,
                                SvgPicture.asset(
                                  Assets.ratingStarIcon,
                                  width: 12.r,
                                ),
                                3.pw,
                                Text(
                                  "(22)",
                                  style: context.textStyle.bodyMedium!.copyWith(
                                      height: 1.3,
                                      foreground: AppColors.gradientPaint),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      Container(
                        height: 102.h,
                        width: context.screenwidth,
                        padding: EdgeInsets.symmetric(
                            vertical: 12.r, horizontal: 9.r),
                        decoration: BoxDecoration(
                            color: AppColors.secondaryColor1,
                            borderRadius: BorderRadius.circular(10.r)),
                        child: ListView.separated(
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            physics: const NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => ConstrainedBox(
                                  constraints: BoxConstraints(
                                      minWidth:
                                          (context.screenwidth / 4) * 0.78,
                                      maxWidth:
                                          (context.screenwidth / 4) * 0.78),
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 49.r,
                                        height: 46.r,
                                        padding: EdgeInsets.all(10.r),
                                        decoration: BoxDecoration(
                                          // Background with linear gradient (from #F5F6F9 to #FFF)
                                          gradient: const LinearGradient(
                                            begin: Alignment
                                                .topCenter, // Linear gradient direction (0deg)
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              Colors.white,
                                              Color(0xFFF5F6F9),
                                            ], // #F5F6F9 to #FFF
                                          ),
                                          // Border radius of 4px
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        child: SvgPicture.asset(
                                          ProductFeatureDataModel
                                              .feature[index].icon,
                                        ),
                                      ),
                                      10.ph,
                                      Expanded(
                                        child: Text(
                                          ProductFeatureDataModel
                                              .feature[index].title,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.center,
                                          style: context.textStyle.displaySmall!
                                              .copyWith(
                                                  height: 0.8,
                                                  color: Colors.black
                                                      .withValues(alpha: 0.7)),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                            separatorBuilder: (context, index) =>
                                const VerticalDivider(),
                            itemCount: ProductFeatureDataModel.feature.length),
                        // child: Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: List.generate(
                        //       4,
                        //       (index) => Container(
                        //             // margin: index != 3
                        //             //     ? EdgeInsets.only(left: 15.r)
                        //             //     : null,
                        //             // padding: index != 3
                        //             //     ? EdgeInsets.only(right: 15.r)
                        //             //     : null,
                        //             decoration: BoxDecoration(
                        //                 border: index != 3
                        //                     ? Border(
                        //                         right: BorderSide(
                        //                         color: AppColors.borderColor,
                        //                       ))
                        //                     : null),
                        //             child: Column(
                        //               children: [
                        //                 Container(
                        //                   width: 49.r,
                        //                   height: 46.r,
                        //                   decoration: BoxDecoration(
                        //                     // Background with linear gradient (from #F5F6F9 to #FFF)
                        //                     gradient: const LinearGradient(
                        //                       begin: Alignment
                        //                           .topCenter, // Linear gradient direction (0deg)
                        //                       end: Alignment.bottomCenter,
                        //                       colors: [
                        //                         Colors.white,
                        //                         Color(0xFFF5F6F9),
                        //                       ], // #F5F6F9 to #FFF
                        //                     ),
                        //                     // Border radius of 4px
                        //                     borderRadius:
                        //                         BorderRadius.circular(4),
                        //                   ),
                        //                 ),
                        //                 Row(
                        //                   children: [
                        //                     Text(
                        //                       "High Rated",
                        //                       style: context
                        //                           .textStyle.displaySmall!
                        //                           .copyWith(
                        //                               color: Colors.black
                        //                                   .withValues(
                        //                                       alpha: 0.7)),
                        //                     ),
                        //                   ],
                        //                 )
                        //               ],
                        //             ),
                        //           )),
                        // ),
                      ),
                      ProductDetailWidget(
                        description: product.productDescription,
                        features: product.keyFeatures,
                      ),
                      const UserRatingWidget(),
                      const AboutSellerWidget(),
                      const Row(
                        children: [
                          Expanded(
                              child: TitleHeadingWidget(
                                  title: "More Product Similar To This"))
                        ],
                      ),
                      10.ph,
                    ],
                  ),
                ),
                Consumer(builder: (context, ref, child) {
                  final product = ref.watch(productDataProvider).nearByProducts;
                  return VerticalProjectsDisplayLayoutWidget(temp: product);
                }),
              ],
            ),
          )),
    );
  }
}

class AboutSellerWidget extends StatelessWidget {
  const AboutSellerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitleHeadingWidget(title: "About Seller"),
        15.ph,
        Container(
          padding: EdgeInsets.symmetric(vertical: 8.r, horizontal: 10.r),
          decoration: BoxDecoration(
              color: AppColors.secondaryColor1,
              borderRadius: BorderRadius.circular(10.r)),
          child: Column(
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4.r),
                    child: DisplayNetworkImage(
                      imageUrl: "",
                      width: 37.r,
                      height: 32.r,
                    ),
                  ),
                  10.pw,
                  Text(
                    "BTX Traders",
                    style: context.textStyle.displaySmall!
                        .copyWith(fontWeight: FontWeight.w700),
                  )
                ],
              ),
              10.ph,
              Container(
                // height: 45.h,
                // constraints: BoxConstraints(maxHeight: 45.h, minHeight: 45.h),
                padding: EdgeInsets.symmetric(vertical: 4.r),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.r),
                    color: const Color(0xffE8F0FF)),
                child: Row(
                  children: List.generate(
                    3,
                    (index) => Expanded(
                        child: Container(
                      padding: EdgeInsets.only(left: 20.r),
                      decoration: BoxDecoration(
                          border: index == 1
                              ? Border(
                                  left:
                                      BorderSide(color: AppColors.borderColor),
                                  right:
                                      BorderSide(color: AppColors.borderColor))
                              : null),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                index == 0 ? "84%" : "100%",
                                style: context.textStyle.displayMedium,
                              ),
                              3.pw,
                              index == 0
                                  ? Text(
                                      "Medium",
                                      style: context.textStyle.bodySmall!
                                          .copyWith(fontSize: 10.sp),
                                    )
                                  : Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 5.r,
                                        // vertical: 2.r
                                      ),
                                      decoration: BoxDecoration(
                                          color: const Color(0xff4CAF50),
                                          borderRadius:
                                              BorderRadius.circular(2.r)),
                                      child: Text(
                                        "High",
                                        style: context.textStyle.bodySmall!
                                            .copyWith(
                                                fontSize: 10.sp,
                                                color: Colors.white),
                                      ),
                                    )
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  index == 0
                                      ? "Positive Seller..."
                                      : index == 1
                                          ? "Ship on Time"
                                          : "Return Guaranteed",
                                  style: context.textStyle.bodySmall!,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

class UserRatingWidget extends StatelessWidget {
  const UserRatingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const TitleHeadingWidget(title: "Ratings & Reviews"),
            const Spacer(),
            Text(
              "5.0",
              style: context.textStyle.displayMedium!.copyWith(
                  // height: 1.3,
                  fontSize: 18.sp,
                  foreground: AppColors.gradientPaint),
            ),
            const CustomRatingIndicator(
              rating: 5.0,
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 12.r,
              color: Colors.black,
            ),

            // RatingBar(
            //   initialRating: 3,
            //   direction: Axis.horizontal,
            //   allowHalfRating: true,
            //   itemCount: 5,
            //   ratingWidget: RatingWidget(
            //     full: SvgPicture.asset(Assets.ratingStarIcon),
            //     half: SvgPicture.asset(Assets.ratingStarIcon),
            //     empty: SvgPicture.asset(Assets.ratingStarIcon),
            //   ),
            //   itemSize: 16.r,
            //   itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
            //   onRatingUpdate: (rating) {
            //     print(rating);
            //   },
            // )
          ],
        ),
        20.ph,
        ListView.separated(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => Container(
                  padding: EdgeInsets.all(12.r),
                  // height: 91.h,
                  decoration: BoxDecoration(
                      color: AppColors.secondaryColor1,
                      borderRadius: BorderRadius.circular(10.r)),
                  child: Row(
                    children: [
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "John D.",
                            style: context.textStyle.displaySmall!.copyWith(
                                color: Colors.black.withValues(alpha: 0.7),
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "I've been a Red Bull drinker for years, and it never fails to give me the need",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: context.textStyle.bodySmall,
                          ),
                          const CustomRatingIndicator(rating: 5.0)
                        ],
                      )),
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(6.r),
                            child: DisplayNetworkImage(
                              imageUrl: "",
                              width: 52.r,
                              height: 68.r,
                            ),
                          ),
                          10.pw,
                          ClipRRect(
                            borderRadius: BorderRadius.circular(6.r),
                            child: DisplayNetworkImage(
                              imageUrl: "",
                              width: 52.r,
                              height: 68.r,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
            separatorBuilder: (context, index) => 10.ph,
            itemCount: 3)
      ],
    );
  }
}

class CustomRatingIndicator extends StatelessWidget {
  final double rating;
  const CustomRatingIndicator({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      rating: rating,
      itemBuilder: (context, index) => SvgPicture.asset(Assets.ratingStarIcon),
      itemCount: 5,
      itemSize: 16.r,
      direction: Axis.horizontal,
    );
  }
}

class ProductFeatureDataModel {
  late final String title;
  late final String icon;

  ProductFeatureDataModel({required this.title, required this.icon});

  static List<ProductFeatureDataModel> feature = [
    ProductFeatureDataModel(
        title: "Delivery on time", icon: Assets.deliveryTruckIcon),
    ProductFeatureDataModel(
        title: "High Rated Seller", icon: Assets.ratingStarIcons),
    ProductFeatureDataModel(
        title: "Cash on Delivery", icon: Assets.cashNoteIcons),
    ProductFeatureDataModel(
        title: "Secure Transaction", icon: Assets.securityIcons),
  ];
}
