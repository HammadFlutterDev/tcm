import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tcm/config/app_colors.dart';
import 'package:tcm/config/app_styles.dart';
import 'package:tcm/config/asset_path.dart';
import 'package:tcm/models/category_data_model.dart';
import 'package:tcm/models/product_data_model.dart';

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
      productName: 'Beach Towels',
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
        'Quick Drying Fabric: Dries rapidly after use, keeping you comfortable and dry. Large Size: Generously sized to provide ample coverage while lounging.Colorful Designs: Available in various bright colors and patterns to suit your style.'
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
      id: 5,
      productName: 'Red Bull Energy Drink',
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
        'Energy Boosting Formula: Contains caffeine and taurine to enhance alertness and performance. Convenient Packaging: Available in easy-to-carry cans for on-the-go consumption.Variety of Flavors: Offered in multiple flavors to cater to different taste preferences'
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
      id: 6,
      productName: "Vegetable Oil",
      productImage: "https://i.ibb.co/x7g9tr5/image4.png",
      productPrice: "3.49",
      isFavourite: false,
      productSampleImages: [
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQbYicFK41GQBzjJTPu4BusvC0qhcfnYeI8ew&s",
        "https://upload.wikimedia.org/wikipedia/commons/thumb/4/49/Olive_oil_from_Oneglia.jpg/640px-Olive_oil_from_Oneglia.jpg"
      ],
      productDescription:
          "Versatile cooking oil suitable for frying, baking, and salad dressings.",
      keyFeatures: [
        "High Smoke Point",
        "Neutral Flavor",
        "Rich in Unsaturated Fats"
      ],
      productOwner: ProductOwnerData(
        id: 6,
        username: "HealthyCooking",
        userImage:
            "https://plus.unsplash.com/premium_photo-1677231559666-53bed9be43ba?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8Ym95c3xlbnwwfHwwfHx8MA%3D%3D",
        userFeedback: "A kitchen essential!",
      ),
      locationData: LocationData(
        lat: 39.7392,
        long: -104.9903,
        address: "111 Healthy Way, Denver",
      ),
    ),
    ProductDataModel(
      id: 7,
      productName: "Stylish Jacket",
      productImage: "https://i.ibb.co/R7JZVZL/jacket.png",
      productPrice: "49.99",
      isFavourite: true,
      productSampleImages: [
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSrUFkJi3YyWHzOQVX1gSR80PTUegJmxk9inw&s",
        "https://i.pinimg.com/736x/35/d4/4c/35d44c8100a8cdf841aee112099c9d87.jpg"
      ],
      productDescription:
          "Trendy jacket made from high-quality materials, perfect for all seasons.",
      keyFeatures: ["Water-Resistant", "Multiple Pockets", "Comfort Fit"],
      productOwner: ProductOwnerData(
        id: 7,
        username: "FashionHub",
        userImage:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQjZirTv3YUaHSe-VVIQzwXUHXxb8mnJ-krbg&s",
        userFeedback: "Stay warm and stylish!",
      ),
      locationData: LocationData(
        lat: 34.0522,
        long: -118.2437,
        address: "222 Fashion Ave, Los Angeles",
      ),
    ),
    ProductDataModel(
      id: 8,
      productName: "Portable Bluetooth Speaker",
      productImage: "https://i.ibb.co/0Q3fVxn/speakers.png",
      productPrice: "29.99",
      isFavourite: true,
      productSampleImages: [
        "https://images-cdn.ubuy.co.in/661a1ab34c4721068f07ef51-audioengine-a2-wireless-bluetooth-pc.jpg",
        "https://jblstore.com.ph/cdn/shop/files/dui_600x.jpg?v=1734396984"
      ],
      productDescription:
          "Compact Bluetooth speaker with powerful sound and long battery life.",
      keyFeatures: ["Wireless Connectivity", "Water-Resistant", "Lightweight"],
      productOwner: ProductOwnerData(
        id: 8,
        username: "AudioExperts",
        userImage:
            "https://pics.craiyon.com/2023-11-26/oMNPpACzTtO5OVERUZwh3Q.webp",
        userFeedback: "Perfect for outdoor adventures!",
      ),
      locationData: LocationData(
        lat: 37.7749,
        long: -122.4194,
        address: "333 Audio Lane, San Francisco",
      ),
    ),
    ProductDataModel(
      id: 9,
      productName: "High-Fidelity Bluetooth Speaker",
      productImage: "https://i.ibb.co/JkDqPDH/bluetooth-speaker.png",
      productPrice: "59.99",
      isFavourite: false,
      productSampleImages: [
        "https://i.pcmag.com/imagery/reviews/03V8y6C5wPv1ZV44gbJFZtQ-8.fit_lim.size_919x518.v1698156812.jpg",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSh9ZnfRsp62jVGOPtjN3Dokxsos0EpEn4LWw&s"
      ],
      productDescription:
          "Experience superior sound quality with this high-fidelity Bluetooth speaker.",
      keyFeatures: ["Deep Bass", "Long Range", "Sleek Design"],
      productOwner: ProductOwnerData(
        id: 9,
        username: "SoundMasters",
        userImage:
            "https://plus.unsplash.com/premium_photo-1677231559666-53bed9be43ba?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8Ym95c3xlbnwwfHwwfHx8MA%3D%3D",
        userFeedback: "Unmatched audio experience!",
      ),
      locationData: LocationData(
          lat: 40.7306, long: -73.9352, address: "444 Sound St, New York City"),
    ),
  ];

  final List<ProductDataModel> discountPreOwnedProducts = [
    ProductDataModel(
      id: 1,
      productName: 'Pepsi',
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
        "Bold Flavor: A distinct taste that sets it apart from other soft drinks, making it a favorite among cola enthusiasts.Carbonated Refreshment: The perfect level of carbonation to provide a fizzy sensation with every sip.Versatile Pairing: Pairs well with a wide variety of foods, enhancing the overall dining experience."
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
      productName: 'Red Bull Energy Drink',
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
        'Energy Boosting Formula: Contains caffeine and taurine to enhance alertness and performance.Convenient Packaging: Available in easy-to-carry cans for on-the-go consumption. Variety of Flavors: Offered in multiple flavors to cater to different taste preferences'
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
  final List<ProductDataModel> buyfromStore = [
    ProductDataModel(
      id: 1,
      productName: 'Pepsi',
      productImage: 'https://i.ibb.co/Rhm9Txj/image.png',
      productPrice: '1.50',
      isFavourite: false,
      productSampleImages: [
        'https://www.pepsico.com/images/default-source/products-brands/pepsi_12oz.png?sfvrsn=46c9ae09_3',
        'https://i.pinimg.com/736x/6e/9d/3c/6e9d3c47c2b4d396abb5209140125c2c.jpg'
      ],
      productDescription:
          'Refreshing cola beverage with a bold taste and a hint of citrus.',
      keyFeatures: [
        "Bold Flavor: A distinct taste that sets it apart from other soft drinks."
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
      isStoreProduct: true, // This product is marked as a store product
    ),
    ProductDataModel(
      id: 2,
      productName: 'Red Bull Energy Drink',
      productImage: 'https://i.ibb.co/kSK3Jbw/1.png',
      productPrice: '2.99',
      isFavourite: true,
      productSampleImages: [
        'https://images.latestdeals.co.uk/post-large/p-5fc777ca37018f7c8d391942-2.jpg',
        'https://www.shutterstock.com/image-photo/kyiv-ukraine-july-04-2018red-260nw-1126889948.jpg'
      ],
      productDescription:
          'Red Bull is an energy drink formulated to boost your energy levels.',
      keyFeatures: [
        'Energy Boosting Formula: Contains caffeine and taurine.',
      ],
      productOwner: ProductOwnerData(
        id: 2,
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
      isStoreProduct: true, // This product is marked as a store product
    ),
    ProductDataModel(
      id: 3,
      productName: 'Mountain Dew',
      productImage: 'https://i.ibb.co/Y2kGVs3/image.png',
      productPrice: '1.75',
      isFavourite: false,
      productSampleImages: [
        'https://www.mountaindew.com/sites/default/files/images/md-welcome-page.jpg',
      ],
      productDescription: 'A citrus-flavored soda for your adventurous spirit.',
      keyFeatures: [
        "Citrus Flavor: A refreshing burst of citrus flavor in every sip."
      ],
      productOwner: ProductOwnerData(
        id: 3,
        username: 'SodaKing',
        userImage:
            'https://upload.wikimedia.org/wikipedia/commons/e/e6/Placeholder_profile.svg',
        userFeedback: 'Always refreshing!',
      ),
      locationData: LocationData(
        lat: 40.7128,
        long: -74.0060,
        address: '123 Mountain Dew St, New York City',
      ),
      isStoreProduct: true, // This product is marked as a store product
    ),
    ProductDataModel(
      id: 4,
      productName: 'Sprite',
      productImage: 'https://i.ibb.co/sK6wHK0/image.png',
      productPrice: '1.25',
      isFavourite: true,
      productSampleImages: [
        'https://www.spritesoda.com/img/hero_sprite.jpg',
      ],
      productDescription:
          'A lemon-lime flavored soda that refreshes like no other.',
      keyFeatures: ["Crisp and Refreshing: A clean lemon-lime taste."],
      productOwner: ProductOwnerData(
        id: 4,
        username: 'LemonLimeCo',
        userImage:
            'https://upload.wikimedia.org/wikipedia/commons/e/e6/Placeholder_profile.svg',
        userFeedback: 'Loves it!',
      ),
      locationData: LocationData(
        lat: 34.0522,
        long: -118.2437,
        address: '456 Lemon Street, Los Angeles',
      ),
      isStoreProduct: true, // This product is marked as a store product
    ),
    // Additional products with isStoreProduct set to true
    ProductDataModel(
      id: 5,
      productName: 'Coca-Cola',
      productImage: 'https://i.ibb.co/2jYswh8/coca-cola.png',
      productPrice: '1.60',
      isFavourite: false,
      productSampleImages: [
        'https://upload.wikimedia.org/wikipedia/commons/a/a2/Original_Coca-Cola_logo.png',
      ],
      productDescription: 'A refreshing soft drink with a distinct taste.',
      keyFeatures: ["Sweet and refreshing taste.", "Perfect for meals."],
      productOwner: ProductOwnerData(
        id: 5,
        username: 'CocaColaInc',
        userImage:
            'https://upload.wikimedia.org/wikipedia/commons/a/a2/Original_Coca-Cola_logo.png',
        userFeedback: 'A classic drink!',
      ),
      locationData: LocationData(
        lat: 41.8781,
        long: -87.6298,
        address: '789 Coke Blvd, Chicago',
      ),
      isStoreProduct: true, // This product is marked as a store product
    ),
  ];
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
          items: nearByItems,
          title: "Pre-owned Items Nearby",
          onTap: () {
            AppRouter.push(const SearchProductView(
              title: "Pre-owned Items Nearby",
            ));
          },
        ),
        const BannerWidget(),
        ProductDisplayWidget(
          items: discountPreOwnedProducts,
          title: "Discounted Pre-owned Beverages",
          onTap: () {
            AppRouter.push(const SearchProductView(
              title: "Discounted Pre-owned Beverages",
            ));
          },
        ),
        const OfferWidget(),
        ProductDisplayWidget(
          items: buyfromStore,
          showAddCard: true,
          title: "Buy from Stores",
          onTap: () {
            AppRouter.push(const SearchProductView(
              title: "Buy from Stores",
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
