import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tcm/config/app_styles.dart';
import 'package:tcm/config/asset_path.dart';
import 'package:tcm/models/product_data_model.dart';
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
  final List<ProductDataModel> allMarketProducts = [
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
      id: 3,
      productName: 'Neck Pillow',
      productImage: 'https://i.ibb.co/ssVbBkd/image4.png',
      productPrice: '19.99',
      isFavourite: true,
      productSampleImages: [
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQDZ3MLALqrveBjqVQaqW3OrUJVJboxr-lhAw&s',
        'https://media.istockphoto.com/id/538896642/photo/happy-young-man-sleeping-in-travel-bus[…]12&w=0&k=20&c=4kbnXQ0rhGGBsZugMwdS6VaQJ90wekeFReneXuRV8c0='
      ],
      productDescription:
          'The Neck Pillow is designed to provide maximum comfort during travel or relaxation at home. Its ergonomic shape supports the neck and head, reducing strain and fatigue during long journeys.',
      keyFeatures: [
        'Ergonomic Design: Contoured shape that fits snugly around the neck for optimal support. Memory Foam Material: Adapts to the shape of your neck, providing personalized comfort. Portable and Lightweight: Easy to carry, making it perfect for travel.'
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
  final List<ProductDataModel> discountPreOwnedGroceryProducts = [
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
      id: 2,
      productName: 'Nutella',
      productImage: 'https://i.ibb.co/hdh4zwF/image2.png',
      productPrice: '5.99',
      isFavourite: true,
      productSampleImages: [
        'https://www.flourconfections.com/images/thumbs/300_300/fullsizeoutput_7c34.webp',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRrx2hfl4J39fLOhRSHGvRq9RNZ5Mn47qzUPA&s'
      ],
      productDescription:
          'Nutella is a creamy hazelnut spread enriched with cocoa, perfect for spreading on toast, pancakes, or simply enjoying by the spoonful. Its rich flavor and smooth texture make it an indulgent treat for breakfast or dessert.',
      keyFeatures: [
        'Rich Hazelnut Flavor: Made from high-quality hazelnuts, offering a deliciously nutty taste. Versatile Use: Ideal for spreading on bread, mixing into desserts, or as an ingredient in baking. No Artificial Preservatives: Made with natural ingredients, ensuring a wholesome treat.'
      ],
      productOwner: ProductOwnerData(
        id: 2,
        username: 'SweetTreats',
        userImage:
            'https://upload.wikimedia.org/wikipedia/en/0/04/All-american-boy-song.jpg',
        userFeedback: 'A must-have for chocolate lovers!',
      ),
      locationData: LocationData(
        lat: 45.4215,
        long: -75.6972,
        address: '456 Sweet St, Ottawa',
      ),
    ),
  ];
  final List<ProductDataModel> preOwnedEntertainmentProducts = [
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
          "Experience powerful sound wherever you go with this portable Bluetooth speaker. Its compact design makes it easy to carry while delivering impressive audio quality for music lovers on the move.",
      keyFeatures: [
        "Wireless Connectivity: Easily connects to smartphones and tablets via Bluetooth. Long Battery Life: Enjoy hours of uninterrupted playtime on a single charge. Durable Design: Built to withstand outdoor conditions with water-resistant features."
      ],
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
          "This high-fidelity Bluetooth speaker offers superior sound quality with deep bass and crisp highs. Perfect for audiophiles who appreciate rich audio experiences at home or on the go.",
      keyFeatures: [
        "Superior Sound Quality: Engineered for clear audio reproduction across all frequencies. Extended Wireless Range: Connects seamlessly from a distance without interruptions.Sleek Aesthetic Design: Modern look that complements any decor."
      ],
      productOwner: ProductOwnerData(
        id: 9,
        username: "SoundMasters",
        userImage:
            "https://plus.unsplash.com/premium_photo-1677231559666-53bed9be43ba?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8Ym95c3xlbnwwfHwwfHx8MA%3D%3D",
        userFeedback: "Unmatched audio experience!",
      ),
      locationData: LocationData(
          lat: 40.7306, long: -73.9352, address: "444 Sound St, New York City"),
    )
  ];
  final List<ProductDataModel> preOwnedInfantProducts = [
    ProductDataModel(
      id: 10,
      productName: "Camping Tent",
      productImage: "https://i.ibb.co/0jP205s/small-tent.png",
      productPrice: "89 .99",
      isFavourite: false,
      productSampleImages: [
        "https://www.gearpatrol.com/wp-content/uploads/sites/2/2021/12/Tiny-Tent-Gear-Patrol-Lead-Full-jpg.webp",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNZc3_UXTZNeLLPtrApnbG6xVOBnSPPEfVf_qPfoWfCnoz5DtuUXU4CASFYcxB57T418A&usqp=CAU"
      ],
      productDescription:
          "Durable camping tent designed to withstand various weather conditions. This durable camping tent is designed to withstand various weather conditions while providing ample space for campers. Easy to set up and take down, it's perfect for outdoor adventures with family or friends.",
      keyFeatures: [
        "Weatherproof Construction: Made from high-quality materials that resist rain and wind. Easy Setup Mechanism: Quick assembly allows you to spend more time enjoying nature. Spacious Interior Design: Accommodates multiple occupants comfortably with room for gear."
      ],
      productOwner: ProductOwnerData(
        id: 10,
        username: "OutdoorAdventures",
        userImage:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQjZirTv3YUaHSe-VVIQzwXUHXxb8mnJ-krbg&s",
        userFeedback: "Ideal for camping trips!",
      ),
      locationData: LocationData(
        lat: 36.1699,
        long: -115.1398,
        address: "555 Adventure Rd , Las Vegas",
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
          "This stylish jacket combines fashion with functionality. Made from durable materials, it provides warmth without compromising on style—perfect for both casual outings and formal events.",
      keyFeatures: [
        "Water-Resistant Fabric: Protects against light rain and moisture. Multiple Pockets: Convenient storage options for essentials like keys and phones.Adjustable Fit: Features adjustable cuffs and waist for personalized comfort."
      ],
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
    )
  ];
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
                controller: TextEditingController(),
                hintText: "What are you looking for?"),
          ),
          CategoriesWidget(items: CategoryDataModel.categories),
          ProductDisplayWidget(
            title: "Marketplace All Prodcuts",
            items: allMarketProducts,
            onTap: () {
              AppRouter.push(const SearchProductView(
                title: "Marketplace All Prodcuts",
              ));
            },
          ),
          ProductDisplayWidget(
            title: "Discounted Pre-owned Beverages",
            items: products,
            onTap: () {
              AppRouter.push(const SearchProductView(
                title: "Discounted Pre-owned Beverages",
              ));
            },
          ),
          const OfferWidget(),
          ProductDisplayWidget(
            title: "Discounted Pre-owned Grocery",
            items: discountPreOwnedGroceryProducts,
            onTap: () {
              AppRouter.push(const SearchProductView(
                title: "Discounted Pre-owned Grocery",
              ));
            },
          ),
          ProductDisplayWidget(
            title: "Pre-owned Entertainment",
            items: preOwnedEntertainmentProducts,
            onTap: () {
              AppRouter.push(const SearchProductView(
                title: "Pre-owned Entertainment",
              ));
            },
          ),
          ProductDisplayWidget(
            title: "Pre-owned Infant",
            items: preOwnedInfantProducts,
            onTap: () {
              AppRouter.push(const SearchProductView(
                title: "Pre-owned Infant",
              ));
            },
          ),
          const BannerWidget()
        ]);
  }
}
