import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tcm/config/app_styles.dart';
import 'package:tcm/models/product_data_model.dart';
import 'package:tcm/utils/app_extensions.dart';
import 'package:tcm/view/ad_preview_view.dart';
import 'package:tcm/view/ad_product_view.dart';
import 'package:tcm/view/chatting_view.dart';
import 'package:tcm/view/home_view.dart';
import 'package:tcm/widgets/custom_back_button_widget.dart';
import 'package:tcm/widgets/display_network_image.dart';
import 'package:tcm/widgets/user_profile_widget.dart';
import '../config/app_colors.dart';
import '../utils/app_router.dart';
import '../widgets/custom_button_widget.dart';
import 'checkout_view.dart';

class ProductDetailView extends StatefulWidget {
  final ProductDataModel product;
  const ProductDetailView({super.key, required this.product});

  @override
  State<ProductDetailView> createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {
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
        'https://media.istockphoto.com/id/538896642/photo/happy-young-man-sleeping-in-travel-bus[…]12&w=0&k=20&c=4kbnXQ0rhGGBsZugMwdS6VaQJ90wekeFReneXuRV8c0='
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      bottomSheet: Padding(
        padding: EdgeInsets.all(AppStyles.screenHorizontalPadding),
        child: Row(
          children: [
            Expanded(
                child: CustomButtonWidget(
              title: "Send Message",
              onPressed: () {
                AppRouter.push(ChattingView(
                  userName: widget.product.productOwner!.username!,
                  userImage: widget.product.productOwner!.userImage!,
                  productImage: widget.product.productImage!,
                ));
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
                        product: widget.product,
                      ));
                    }))
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                ProductMultipleImageDisplayWidget(
                  images: widget.product.productSampleImages ?? [],
                ),
                Positioned(
                  top: 30,
                  left: 20,
                  right: 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CustomBackButtonWidget(),
                      Container(
                        width: 31.r,
                        height: 31.r,
                        decoration: const BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                        child: Icon(
                          Icons.favorite_outline_rounded,
                          size: 23.r,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppStyles.screenHorizontalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductTitleWidget(
                    address: widget.product.locationData?.address,
                    title: widget.product.productName,
                    price: widget.product.productPrice,
                  ),
                  10.ph,
                  AdDetailWidget(
                    showRecipt: true,
                    onTap: () {
                      showFullScreenModal(context);
                    },
                  ),
                  const ProductDetailWidget(),
                  const LocationDetailWidget(),
                  20.ph,
                  const TitleHeadingWidget(title: "Listed by private user"),
                  ListTile(
                    minVerticalPadding: 0,
                    contentPadding: EdgeInsets.zero,
                    leading: UserProfileWidget(
                        radius: 30.r,
                        imageUrl: widget.product.productOwner!.userImage!),
                    title: Text(
                      widget.product.productOwner!.username!,
                      style: context.textStyle.displayMedium!
                          .copyWith(fontSize: 16.sp),
                    ),
                    subtitle: Text(
                      widget.product.productOwner!.userFeedback!,
                      style: context.textStyle.bodySmall,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black,
                      size: 13.r,
                    ),
                  ),
                  20.ph,
                ],
              ),
            ),
            ProductDisplayWidget(
              items: nearByItems,
              showSeeAll: false,
              showAddCard: true,
              title: "Similar Products",
            ),
            100.ph
          ],
        ),
      ),
    );
  }
}

void showFullScreenModal(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true, // Allows the modal to be full-screen
    backgroundColor: Colors.transparent, // Makes the background transparent
    builder: (BuildContext context) {
      return Stack(
        children: [
          Stack(alignment: Alignment.bottomCenter, children: [
            Positioned.fill(
              child: BackdropFilter(
                filter:
                    ImageFilter.blur(sigmaX: 21.5, sigmaY: 22.5), // Blur effect
                child: const Scaffold(
                  backgroundColor: Colors.transparent,
                ),
              ),
            ),
            Center(
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(23.r),
                  child: DisplayNetworkImage(
                    imageUrl:
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTclzxAFQq3EbPVy5XCbzn_oRvVNTH5kIbOaw&s",
                    height: 443.r,
                    width: 329.701.w,
                  )),
            ),
            Padding(
              padding: EdgeInsets.all(AppStyles.screenHorizontalPadding),
              child: CustomButtonWidget(
                  title: 'Done',
                  onPressed: () {
                    AppRouter.back();
                  }),
            )
          ])
        ],
      );
    },
  );
}
