import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tcm/config/app_styles.dart';
import 'package:tcm/models/product_data_model.dart';
import 'package:tcm/providers/product_provider.dart';
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
                      AppRouter.push(const CheckoutView());
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
                    address: widget.product.locationData.address,
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
            Consumer(builder: (context, ref, child) {
              return ProductDisplayWidget(
                items: ref.watch(productDataProvider).nearByProducts,
                showSeeAll: false,
                showAddCard: true,
                title: "Buy from Stores",
              );
            }),
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
