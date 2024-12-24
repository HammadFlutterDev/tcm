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
import 'package:tcm/view/buy_product_view.dart';
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
  final List<ProductDataModel> nearByItems = [
    ProductDataModel(
      id: 4,
      productName: 'Bold, vibrant 100% cotton beach towels.',
      productImage: 'https://i.ibb.co/2WLKNNS/image3.png',
      productPrice: '15.99',
      isFavourite: false,
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
      id: 3,
      productName: 'Best travel neck pillow available two sets',
      productImage: 'https://i.ibb.co/ssVbBkd/image4.png',
      productPrice: '19.99',
      isFavourite: true,
      productSampleImages: [
        'https://i.ibb.co/ssVbBkd/image4.png',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQDZ3MLALqrveBjqVQaqW3OrUJVJboxr-lhAw&s',
        'https://m.media-amazon.com/images/I/81g3pyGvYkL._AC_SL1500_.jpg'
      ],
      productDescription:
          'The Neck Pillow is designed to provide maximum comfort during travel or relaxation at home. Its ergonomic shape supports the neck and head, reducing strain and fatigue during long journeys.',
      keyFeatures: [
        'Ergonomic Design: Contoured shape that fits snugly around the neck for optimal support. Memory Foam Material: Adapts to the shape of your neck, providing personalized comfort.Portable and Lightweight: Easy to carry, making it perfect for travel.'
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
      id: 4,
      productName: 'Diamond Resort International Bag Canvas',
      productImage: 'https://i.ibb.co/KNvJ8P6/bag.png',
      productPrice: '15.99',
      isFavourite: false,
      productSampleImages: [
        'https://i.ebayimg.com/images/g/8VMAAOSwWaxghfq0/s-l400.jpg',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQPGhh-Dmh9S9KS5Bq9QDMWlCAOJSmYCE4MiA&s'
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
  ];

  final List<ProductDataModel> discountPreOwnedProducts = [
    ProductDataModel(
      id: 1,
      productName: 'Pepsi S’mores collection 3 can',
      productImage: 'https://i.ibb.co/Rhm9Txj/image.png',
      productPrice: '1.50',
      isFavourite: false,
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
      id: 5,
      productName: 'Red Bull Energy Drink 3 can',
      productImage: 'https://i.ibb.co/kSK3Jbw/1.png',
      productPrice: '2.99',
      isFavourite: true,
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
    ProductDataModel(
      id: 3,
      productName: 'Schweppes American Ginger Ale',
      productImage:
          'https://i.ibb.co/bRhnFfG/Schweppes-American-Ginger-Ale.png',
      productPrice: '19.99',
      isFavourite: true,
      productSampleImages: [
        'https://www.schweppesus.com/images/catalog/products/schweppes-ginger-ale.png',
        'https://m.media-amazon.com/images/I/91QAjCtG+fL._AC_UF1000,1000_QL80_.jpg'
      ],
      productDescription:
          "Schweppes American Ginger Ale is a carbonated drink that balances sweetness and ginger spice. It's made with high-quality ingredients and is a specialty of the Schweppes brand, which has been making premium carbonated beverages for over 200 years",
      keyFeatures: [
        'Hydration: Because ginger alleviates nausea and cramps, ginger ale is often used to rehydrate a person recovering from the loss of body fluids due to sweating, vomiting, fever, and diarrhea. Hangover: For obvious reasons, ginger ale can help a person recover from a night of too much partying and booze.'
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
  ];
  final List<ProductDataModel> buyfromStore = [
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
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTixcIc2zO9QaP-l3fdk8zAYJClqJM0KdvO8g&s'
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
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    Future.delayed(Duration.zero, () {
      ref.read(productDataProvider.notifier).clearCheckOutList();
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // final products = ref.watch(productDataProvider).nearByProducts;

    return TabScreenTemplate(
      height: 288.h,
      tabIndex: 0,
      topImage: Assets.beachViewImage,
      childrens: [
        20.ph,
        const AdSliderWidget(
          images: [
            // Add your image URLs here
            "https://i.ibb.co/1Xpw8j7/Frame-1030.png",
            "https://i.ibb.co/1Xpw8j7/Frame-1030.png",
            "https://i.ibb.co/1Xpw8j7/Frame-1030.png",
          ],
        ),
        10.ph,
        CategoriesWidget(
          items: CategoryDataModel.categories,
          isShowTitle: true,
        ),
        ProductDisplayWidget(
          items: nearByItems,
          title: "Pre-owned Items Nearby",
          onTap: () {
            AppRouter.push(SearchProductView(
              title: "Pre-owned Items Nearby",
              products: nearByItems,
            ));
          },
        ),
        const BannerWidget(),
        ProductDisplayWidget(
          items: discountPreOwnedProducts,
          title: "Discounted Pre-owned Beverages",
          onTap: () {
            AppRouter.push(SearchProductView(
              title: "Discounted Pre-owned Beverages",
              products: discountPreOwnedProducts,
            ));
          },
        ),
        const OfferWidget(),
        ProductDisplayWidget(
          items: buyfromStore,
          showAddCard: true,
          title: "Buy from Stores",
          onTap: () {
            AppRouter.push(SearchProductView(
              title: "Buy from Stores",
              products: buyfromStore,
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
      padding: EdgeInsets.symmetric(
          horizontal: AppStyles.screenHorizontalPadding, vertical: 15.r),
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
              itemCount: VacationDealProductModel.products.length,
              shrinkWrap: true,
              padding: EdgeInsets.only(
                top: 30.r,
              ),
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
                                  VacationDealProductModel
                                      .products[index].dayRemaining!,
                                  style: context.textStyle.bodySmall!.copyWith(
                                      color: Colors.white, fontSize: 10.sp),
                                ),
                              ),
                            ],
                          ),
                          3.ph,
                          Text(
                            VacationDealProductModel
                                .products[index].productTitle!,
                            style: context.textStyle.labelMedium,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            "\$${VacationDealProductModel.products[index].productPrice}",
                            style: context.textStyle.displayMedium!
                                .copyWith(fontSize: 18.sp),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      )),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.r),
                        child: DisplayNetworkImage(
                          height: context.screenheight,
                          imageUrl: VacationDealProductModel
                              .products[index].productImage!,
                          width: 84.r,
                        ),
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
    return GestureDetector(
      onTap: () {
        AppRouter.push(const BuyProductView());
      },
      child: Container(
        height: 200.h,
        margin: EdgeInsets.only(bottom: 10.r),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  Assets.bannerImage,
                ),
                fit: BoxFit.cover)),
      ),
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
        crossAxisAlignment: CrossAxisAlignment.start,
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
                  isAddToCard: items[index].isStoreProduct,
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

class VacationDealProductModel {
  late final String? productTitle;
  late final String? productPrice;
  late final String? dayRemaining;
  late final String? productImage;

  VacationDealProductModel(
      {required this.productTitle,
      required this.productImage,
      required this.productPrice,
      required this.dayRemaining});

  static final List<VacationDealProductModel> products = [
    VacationDealProductModel(
        productTitle: "Feelflows twin fish keel",
        productImage: "https://i.ibb.co/tBGMvH3/image1.png",
        productPrice: "320.00",
        dayRemaining: "1 Day Left"),
    VacationDealProductModel(
        productTitle: "3-Pack Sloppy Chef Towels",
        productImage: "https://i.ibb.co/F4JZGN2/vacation.png",
        productPrice: "20.00",
        dayRemaining: "2 Days Left"),
  ];
}
