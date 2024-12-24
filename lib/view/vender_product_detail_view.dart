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
  VenderProductDetailView({super.key, required this.product});
  final List<ProductDataModel> mostSellProducts = [
    ProductDataModel(
      id: 1,
      productName: 'Pepsi S’mores collection 3 can',
      productImage: 'https://i.ibb.co/Rhm9Txj/image.png',
      productPrice: '1.50',
      isFavourite: false,
      isStoreProduct: true,
      productSampleImages: [
        'https://www.pepsico.com/images/default-source/products-brands/pepsi_12oz.png?sfvrsn=46c9ae09_3',
        'https://i.pinimg.com/736x/6e/9d/3c/6e9d3c47c2b4d396abb5209140125c2c.jpg'
      ],
      productDescription:
          'Refreshing cola beverage with a bold taste and a hint of citrus. Pepsi is a globally recognized carbonated soft drink that delivers a refreshing burst of flavor. With its unique blend of sweetness and citrus notes, Pepsi is perfect for quenching your thirst on a hot day or as a complement to your favorite meals. Enjoy it chilled for the best experience.',
      keyFeatures: [
        "Bold Flavor: A distinct taste that sets it apart from other soft drinks, making it a favorite among cola enthusiasts. Carbonated Refreshment: The perfect level of carbonation to provide a fizzy sensation with every sip. Versatile Pairing: Pairs well with a wide variety of foods, enhancing the overall dining experience."
      ],
      productOwner: ProductOwnerData(
        id: 1,
        username: 'BeverageWorld',
        userImage:
            'https://upload.wikimedia.org/wikipedia/en/0/04/All-american-boy-song.jpg',
        userFeedback: 'Perfect for any occasion!',
      ),
      locationData: LocationData(
        lat: 34.0522,
        long: -118.2437,
        address: '123 Beverage Ave, Los Angeles',
      ),
    ),
    ProductDataModel(
      id: 4,
      productName: 'Bold, vibrant 100% cotton beach towels.',
      productImage: 'https://i.ibb.co/2WLKNNS/image3.png',
      productPrice: '15.99',
      isFavourite: false,
      isStoreProduct: true,
      productSampleImages: [
        'https://d3izeps273dd1j.cloudfront.net/images/CFBT3060VCP.jpg',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSatlfSh6Jnxby8hsdL5z2M1HjnM0MoE6FWeQ&s'
      ],
      productDescription:
          'These vibrant beach towels are designed for comfort and style. Made from soft, absorbent fabric, they are perfect for drying off after a swim or lounging on the sand.',
      keyFeatures: [
        'Quick Drying Fabric: Dries rapidly after use, keeping you comfortable and dry. Large Size: Generously sized to provide ample coverage while lounging. Colorful Designs: Available in various bright colors and patterns to suit your style.'
      ],
      productOwner: ProductOwnerData(
        id: 4,
        username: 'BeachGearCo',
        userImage:
            'https://upload.wikimedia.org/wikipedia/en/0/04/All-american-boy-song.jpg',
        userFeedback: 'Essential for summer fun!',
      ),
      locationData: LocationData(
        lat: 25.7617,
        long: -80.1918,
        address: '321 Ocean Blvd, Miami',
      ),
    ),
    ProductDataModel(
      id: 11,
      productName: 'Holder Toothpaste Stand Bathroom ',
      productImage:
          'https://i.ibb.co/2nWcVzr/Holder-Toothpaste-Stand-Bathroom.png',
      productPrice: '19.99',
      isFavourite: true,
      isStoreProduct: true,
      productSampleImages: [
        'https://images-cdn.ubuy.co.id/638ae1adff848f5d8c595a62-ihave-toothbrush-holder-for-bathroom.jpg',
        'https://images-cdn.ubuy.co.i64c2111c48233b158c3db54c-ihave-toothbrush-holders-bathroomjpg'
      ],
      productDescription:
          '5 holes for toothbrushes, 2 holes for toothpastes, and 3 larger space for your rinse cups ; TOOTHBRUSH HOLDER · Made of Food-grade ABS Plastic, Eco-',
      keyFeatures: [
        'Rather than using makeshift solutions like plastic bags or foil, invest in a holder specifically designed for toothbrushes. These holders are equipped with air holes to promote drying, protecting the bristles from damage.'
      ],
      productOwner: ProductOwnerData(
        id: 3,
        username: 'TravelEssentials',
        userImage:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR6Qv5s5REahX2Vcj11jPnU1ibiEUfTc-VMAQ&s',
        userFeedback: 'Perfect for long journeys!',
      ),
      locationData: LocationData(
        lat: 51.5074,
        long: -0.1278,
        address: '789 Travel Rd, London',
      ),
    ),
    ProductDataModel(
      id: 3,
      productName: 'Master Roll Eco Friendly Luxury Bamboo Toilet ',
      productImage: 'https://i.ibb.co/4FjzjWt/image-19.png',
      productPrice: '19.99',
      isFavourite: true,
      isStoreProduct: true,
      productSampleImages: [
        'https://m.media-amazon.com/images/I/71S2QJ4x1lL._AC_UF894,1000_QL80_.jpg',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRnL_QcxDRWOSxY_A3hOJmqJOhJtWSDGpbhBg&s'
      ],
      productDescription:
          'Master Roll offers sustainable bamboo toilet paper that is eco friendly, biodegradable, Soft & plastic free. Join us in reducing deforestation & plastic',
      keyFeatures: [
        "Master Roll Premium Bamboo Toilet Paper is Soft, Strong, Absorbent & Plastic Free. Experience the ultimate luxury with Master Roll's 100% bamboo toilet paper. Designed for those who care about comfort and the planet, our toilet paper is soft, strong, absorbent and plastic free."
      ],
      productOwner: ProductOwnerData(
        id: 3,
        username: 'TravelEssentials',
        userImage:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR6Qv5s5REahX2Vcj11jPnU1ibiEUfTc-VMAQ&s',
        userFeedback: 'Perfect for long journeys!',
      ),
      locationData: LocationData(
        lat: 51.5074,
        long: -0.1278,
        address: '789 Travel Rd, London',
      ),
    ),
    ProductDataModel(
      id: 3,
      productName: 'Prime Hydration Drink Variety Pack ',
      productImage: 'https://i.ibb.co/rZk39RC/prime.png',
      productPrice: '19.99',
      isFavourite: true,
      isStoreProduct: true,
      productSampleImages: [
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQGMzVdKp4NR2pb1eh9QiErunSsECXOmA_sVA&s'
            'https://down-my.img.susercontent.com/file/my-11134207-7r98q-lqyfucs6gxdj8f'
      ],
      productDescription:
          'Hydration drink variety pack: 2 Cherry Freeze, 1 Strawberry Watermelon, 1 Lemonade, 1 UFC, 1 Ice Pop and 1 Mystery Flavora + 1ST LIMITED EDITION COIN',
      keyFeatures: [
        'Each drink includes 10% coconut water (from concentrate) and 834 mg of electrolytes to support deep hydration. Has 250mg of BCAAs to restore your essential amino acid levels and aid in muscle recovery. Antioxidants and B vitamins help prevent dehydration. Gluten-free with zero sugar added.'
      ],
      productOwner: ProductOwnerData(
        id: 3,
        username: 'TravelEssentials',
        userImage:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR6Qv5s5REahX2Vcj11jPnU1ibiEUfTc-VMAQ&s',
        userFeedback: 'Perfect for long journeys!',
      ),
      locationData: LocationData(
        lat: 51.5074,
        long: -0.1278,
        address: '789 Travel Rd, London',
      ),
    ),
    ProductDataModel(
      id: 5,
      productName: 'Red Bull Energy Drink 3 can',
      productImage: 'https://i.ibb.co/kSK3Jbw/1.png',
      productPrice: '2.99',
      isFavourite: true,
      isStoreProduct: true,
      productSampleImages: [
        'https://images.latestdeals.co.uk/post-large/p-5fc777ca37018f7c8d391942-2.jpg',
        'https://www.shutterstock.com/image-photo/kyiv-ukraine-july-04-2018red-260nw-1126889948.jpg'
      ],
      productDescription:
          'Red Bull is an energy drink formulated to boost your energy levels and enhance mental focus. With its unique blend of caffeine, taurine, and B-vitamins, Red Bull provides an invigorating lift whenever you need it.',
      keyFeatures: [
        'Energy Boosting Formula: Contains caffeine and taurine to enhance alertness and performance. Convenient Packaging: Available in easy-to-carry cans for on-the-go consumption. Variety of Flavors: Offered in multiple flavors to cater to different taste preferences'
      ],
      productOwner: ProductOwnerData(
        id: 5,
        username: 'EnergyBoostersInc',
        userImage:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQjZirTv3YUaHSe-VVIQzwXUHXxb8mnJ-krbg&s',
        userFeedback: 'Perfect for a quick pick-me-up!',
      ),
      locationData: LocationData(
        lat: 40.7128,
        long: -74.0060,
        address: '654 Energy St, New York City',
      ),
    ),
  ];

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
      // appBar: AppBar(
      //   iconTheme: IconThemeData(size: 100.r),
      //   automaticallyImplyLeading: false,
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   leading: const CustomBackButtonWidget(),
      // ),
      body: ScrollConfiguration(
          behavior: MyBehavior(),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    ProductMultipleImageDisplayWidget(
                      images: product.productSampleImages ?? [],
                    ),
                    const Positioned(
                        top: 30, left: 20, child: CustomBackButtonWidget())
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppStyles.screenHorizontalPadding),
                  child: Column(
                    // spacing: 10.h,
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
                            height: 30.h,
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
                                  'Fast Delivery',
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
                                                      .withOpacity( 0.7)),
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
                VerticalProjectsDisplayLayoutWidget(temp: mostSellProducts),
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
                      imageUrl: "https://i.ibb.co/QdBFy6Z/btx.png",
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
                            UserReviewDataModel.reviews[index].username,
                            style: context.textStyle.displaySmall!.copyWith(
                                color: Colors.black.withOpacity( 0.7),
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                           UserReviewDataModel.reviews[index].content,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: context.textStyle.bodySmall,
                          ),
                         CustomRatingIndicator(rating: UserReviewDataModel.reviews[index].rating)
                        ],
                      )),
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(6.r),
                            child: DisplayNetworkImage(
                              imageUrl: UserReviewDataModel.reviews[index].images[0],
                              width: 52.r,
                              height: 68.r,
                            ),
                          ),
                          10.pw,
                          ClipRRect(
                            borderRadius: BorderRadius.circular(6.r),
                            child: DisplayNetworkImage(
                              imageUrl: UserReviewDataModel.reviews[index].images[0],
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
            itemCount: UserReviewDataModel.reviews.length)
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

class UserReviewDataModel {
  late final String username;
  late final String content;
  late final double rating;
  late final List<String> images;

  UserReviewDataModel(
      {required this.username,
      required this.images,
      required this.content,
      required this.rating});

  static List<UserReviewDataModel> reviews = [
    UserReviewDataModel(
        username: "John D.",
        images: [
          'https://i.redd.it/m2xp6d1ur3g91.jpg',
          'https://i.redd.it/fz0nz3pikvf41.jpg'
        ],
        content:
            "I've been a Red Bull drinker for years, and it never fails to give me the need.....",
        rating: 5.0),
    UserReviewDataModel(
        username: "Samantha R.",
        images: [
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBQBoGbqxFShzs_xCnKfiYVpi-8gcAKVOo6w&s',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRx0fxiCritsq37WVktkCOIwJLXk8nDExX1DZkSDctmAd3YxncjdbIQJLUOVlqEgjpUG9E&usqp=CAU'
        ],
        content:
            "I've been a Red Bull drinker for years, and it never fails to give me the need.....",
        rating: 5.0),
     UserReviewDataModel(
        username: "Kelly T.",
        images: [
          'https://i.redd.it/m2xp6d1ur3g91.jpg',
          'https://i.redd.it/fz0nz3pikvf41.jpg'
        ],
        content:
            "I've been a Red Bull drinker for years, and it never fails to give me the need.....",
        rating: 5.0),
  ];
}
