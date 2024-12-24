import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:tcm/config/app_styles.dart';
import 'package:tcm/config/asset_path.dart';
import 'package:tcm/models/category_data_model.dart';
import 'package:tcm/models/product_data_model.dart';
import 'package:tcm/utils/app_extensions.dart';
import 'package:tcm/widgets/category_widget.dart';

import '../widgets/custom_search_bar_widget.dart';
import '../widgets/product_widget.dart';
import '../widgets/tab_screen_template.dart';

class VenderView extends ConsumerStatefulWidget {
  const VenderView({super.key});

  @override
  ConsumerState<VenderView> createState() => _VenderViewConsumerState();
}

class _VenderViewConsumerState extends ConsumerState<VenderView> {
  final List<ProductDataModel> mostSellProducts = [
    ProductDataModel(
      id: 1,
      productName: 'Pepsi S’mores collection 3 can pack',
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
      productName: 'Red Bull Energy Drink 3 can pack',
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
  final List<ProductDataModel> newTcmProducts = [
    ProductDataModel(
      id: 3,
      productName: 'Bundle & Save for your bundle of joy',
      productImage:
          'https://i.ibb.co/jkhsm31/Bundle-Save-for-your-bundle-of-joy.png',
      productPrice: '19.99',
      isFavourite: true,
      isStoreProduct: true,
      productSampleImages: [
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0FzJiQXSNCeSDZ7mPLDtTCrO81_BN3j5q7Q&s',
        'https://khasmart.pk/wp-content/uploads/2024/02/pampers-5-j.webp'
      ],
      productDescription:
          'Spend \$80 to enjoy a \$20 Amazon credit. Pampers Baby Wipes. Swaddlers. Pure Protection. Cruisers 360. Baby Dry. Training Pants. Disposable',
      keyFeatures: [
        'Pampers provides numerous benefits, from restoring skin pH to preventing leakage. Our diapers are designed to protect against four of the main causes of diaper rash (overhydration, poop left on the skin, increased pH, and friction)'
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
      productName: 'Speedo Jr. Vanguisher Optical',
      productImage: 'https://i.ibb.co/mXx62LH/image-25.png',
      productPrice: '19.99',
      isFavourite: true,
      isStoreProduct: true,
      productSampleImages: [
        'https://thelifeguardstore.com/media/catalog/product/cache/ba5b2db9d6b264edc7ea625b1a071d72/c/l/clear_2.jpg',
        'https://cdn.shoplightspeed.com/shops/663555/files/57104362/1652x1652x2/speedo-jr-vanquisher-20-mirrored.jpg'
      ],
      productDescription:
          "Jr. Vanquisher 2.0 Optical. America's #1 racing goggle. Stay focused on the miles ahead with this low-profile accessory, featuring wide panoramic lenses for ",
      keyFeatures: [
        'G.O. FIT System: Get a precision fit with the sleek, low profile inner eye fit Gasket rests snugly and securely in the eye socket Panoramic corrective, anti-fog lens with UV protection Cushioned silicone seals 4 nosepiece options PVC and Latex Free 100% Soft silicone gaskets'
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
      productName: 'Hatch Rest Baby Sound Machine, Night Light',
      productImage:
          'https://i.ibb.co/TLt4GPK/Hatch-Rest-Baby-Sound-Machine-Night-Light.png',
      productPrice: '19.99',
      isFavourite: true,
      isStoreProduct: true,
      productSampleImages: [
        'https://m.media-amazon.com/images/I/51jCJlRhdeL._SL1080_.jpg',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRlwYNS_Kw5czrvMtNZAdhAzhlgaF2uANcmng&s'
      ],
      productDescription:
          'Hatch Rest 2nd gen is a baby sound machine, night light, and time-to-rise sleep trainer. Controlled with your phone, this white noise maker helps everyone ',
      keyFeatures: [
        'Tap the touch ring to cycle through preset light and sound favorites created to help aid sleep—yellow to red hues are recommended by sleep doctors to promote more restful sleep. Use the Rest app to choose your preferred color and brightness. Try a dim yellow light to check on your child without disturbing sleep.'
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
      productName: 'Black Mountain Products Memory Neck Pillow ',
      productImage:
          'https://i.ibb.co/B4Z8193/Black-Mountain-Products-Memory-Neck-Pillow.png',
      productPrice: '19.99',
      isFavourite: true,
      isStoreProduct: true,
      productSampleImages: [
        'https://i.ibb.co/B4Z8193/Black-Mountain-Products-Memory-Neck-Pillow.png',
        'https://m.media-amazon.com/images/I/81S+Z8DaW6L.jpg',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTd6uz12WQ5tJVlxX6q_wizmPxUMGmF_rpVyQ&s'
      ],
      productDescription:
          'Black mountain products travel neck pillow is made of high density memory foam for superior comfort and durability. each neck pillow has a plush surface ',
      keyFeatures: [
        'Black Mountain Products travel neck pillow is made of high density memory foam for superior comfort and durability. Each neck pillow has a plush surface material that is machine washable. Attached is a Velcro strap to keep pillow on neck or to hang on luggage while traveling.'
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
  @override
  Widget build(BuildContext context) {
    // final products = ref.watch(productDataProvider).nearByProducts;
    // final temp = List<ProductDataModel>.from([...products, ...products]);

    return TabScreenTemplate(
        tabIndex: 3,
        height: 162.h,
        topImage: Assets.venderTopViewImage,
        childrens: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppStyles.screenHorizontalPadding),
            child: CustomSearchBarWidget(
                controller: TextEditingController(),
                hintText: "What are you looking for?"),
          ),
          CategoriesWidget(items: CategoryDataModel.categories),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppStyles.screenHorizontalPadding),
            child: Row(
              children: [
                Expanded(
                    child: Text(
                  "Most Sell Products",
                  style: context.textStyle.displayMedium!
                      .copyWith(fontSize: 18.sp),
                )),
              ],
            ),
          ),
          20.ph,
          VerticalProjectsDisplayLayoutWidget(temp: mostSellProducts),
          20.ph,
          Container(
            height: 196.h,
            padding: EdgeInsets.symmetric(
                horizontal: AppStyles.screenHorizontalPadding, vertical: 18.r),
            width: double.infinity,
            decoration: const BoxDecoration(color: Color(0xff0675D5)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Top Big Vendor Store",
                    style: context.textStyle.displayMedium!
                        .copyWith(color: Colors.white, fontSize: 18.sp)),
                10.ph,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    TopVenderDataModel.topVenders.length,
                    (index) => Column(
                      children: [
                        // Container(
                        //   width: 74.r,
                        //   height: 74.r,
                        //   decoration: const BoxDecoration(
                        //       shape: BoxShape.circle, color: Colors.white),
                        //   child: ,
                        // ),
                        CircleAvatar(
                          maxRadius: 40.r,
                          backgroundColor: Colors.white,
                          child: Image.network(
                            TopVenderDataModel.topVenders[index].image,
                            width: 70.r,
                          ),
                        ),
                        3.ph,
                        Text(
                          TopVenderDataModel.topVenders[index].title,
                          style: context.textStyle.labelMedium!
                              .copyWith(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          20.ph,
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppStyles.screenHorizontalPadding),
            child: Row(
              children: [
                Expanded(
                    child: Text(
                  "New Porduct on TCM",
                  style: context.textStyle.displayMedium!
                      .copyWith(fontSize: 18.sp),
                )),
              ],
            ),
          ),
          20.ph,
          VerticalProjectsDisplayLayoutWidget(temp: newTcmProducts),
        ]);
  }
}

class VerticalProjectsDisplayLayoutWidget extends StatelessWidget {
  const VerticalProjectsDisplayLayoutWidget({
    super.key,
    required this.temp,
  });

  final List<ProductDataModel> temp;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      scrollDirection: Axis.vertical,
      itemCount: temp.length,
      shrinkWrap: true,
      padding:
          EdgeInsets.symmetric(horizontal: AppStyles.screenHorizontalPadding),
      physics:
          const NeverScrollableScrollPhysics(), // Disable scrolling if it's vertical
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Single column horizontally, 2 columns vertically
        mainAxisSpacing: 12.r,
        crossAxisSpacing: 16.r,
        childAspectRatio: 0.83.r, // Adjust aspect ratio based on layout
      ),
      itemBuilder: (context, index) {
        return ProductItemCard(
          product: temp[index],
          isAddToCard: temp[index].isStoreProduct,
        );
      },
    );
  }
}

class TopVenderDataModel {
  late final String title;
  late final String image;

  TopVenderDataModel({required this.title, required this.image});

  static List<TopVenderDataModel> topVenders = [
    TopVenderDataModel(
        title: "EvoCart", image: "https://i.ibb.co/XDXWqJp/image-28.png"),
    TopVenderDataModel(
        title: "VividVault",
        image: "https://i.ibb.co/5hKDrYH/image29.png"
            "https://i.ibb.co/7CTPG0T/image-31.png"),
    TopVenderDataModel(
        title: "PurelyPrime",
        image: "https://i.ibb.co/y4L4scJ/purely-Prime.png"),
    TopVenderDataModel(
        title: "NestCart", image: "https://i.ibb.co/7CTPG0T/image-31.png"),
  ];
}
