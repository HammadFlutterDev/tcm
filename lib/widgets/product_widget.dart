import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tcm/config/asset_path.dart';
import 'package:tcm/models/product_data_model.dart';
import 'package:tcm/utils/app_extensions.dart';
import 'package:tcm/utils/app_router.dart';
import 'package:tcm/view/product_detail_view.dart';
import 'package:tcm/view/vender_product_detail_view.dart';

import 'package:tcm/widgets/display_network_image.dart';

class ProductItemCard extends StatelessWidget {
  final ProductDataModel product;
  final bool? isAddToCard;

  const ProductItemCard(
      {super.key, required this.product, this.isAddToCard = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppRouter.push(product.isStoreProduct
            ? VenderProductDetailView(product: product)
            : ProductDetailView(
                product: product,
              ));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          isAddToCard!
              ? Stack(
                  clipBehavior: Clip.none,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.r),
                      child: DisplayNetworkImage(
                        imageUrl: product.productImage!,
                        height: 147.0,
                        width: double.infinity,
                      ),
                    ),
                    Positioned(
                        top: 10,
                        right: 7,
                        child: GestureDetector(
                          onTap: (){
                            
                          },
                          child: Container(
                            height: 30.r,
                            width: 30.r,
                            padding: EdgeInsets.all(5.r),
                            decoration: BoxDecoration(
                              color: Colors.white, // Background color (white)
                              borderRadius: BorderRadius.circular(
                                  4.r), // Border radius of 4px
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(
                                      alpha: 0.25), // Shadow color with opacity
                                  offset: const Offset(0,
                                      4), // Horizontal and vertical offsets (0px, 4px)
                                  blurRadius: 8.2, // Blur radius (8.2px)
                                  spreadRadius: 0, // No spread of the shadow
                                ),
                              ],
                            ),
                            child: SvgPicture.asset(Assets.addCartIcon),
                          ),
                        ))
                  ],
                )
              : ClipRRect(
                  borderRadius: BorderRadius.circular(10.r),
                  child: DisplayNetworkImage(
                    imageUrl: product.productImage!,
                    height: 147.0,
                    width: double.infinity,
                  ),
                ),
          5.ph,
          // Space between image and product name
          Row(
            children: [
              Expanded(
                  child: Text(
                product.productName!,
                style: context.textStyle.labelMedium,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              )),
            ],
          ),
          const Spacer(),
          Text(
            "\$${product.productPrice}",
            style: context.textStyle.displayMedium!.copyWith(fontSize: 18.sp),
          ),
        ],
      ),
    );
  }
}
