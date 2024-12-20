import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tcm/config/app_styles.dart';
import 'package:tcm/config/asset_path.dart';
import 'package:tcm/models/category_data_model.dart';
import 'package:tcm/models/product_data_model.dart';
import 'package:tcm/providers/product_provider.dart';
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
  @override
  Widget build(BuildContext context) {
    final products = ref.watch(productDataProvider).nearByProducts;
    final temp = List<ProductDataModel>.from([...products, ...products]);

    return TabScreenTemplate(
        tabIndex: 3,
        height: 162.h,
        topImage: Assets.venderTopViewImage,
        childrens: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppStyles.screenHorizontalPadding),
            child: CustomSearchBarWidget(
                controller: TextEditingController(), hintText: "What are you looking for?"),
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
          VerticalProjectsDisplayLayoutWidget(temp: temp),
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
                    4,
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
                          child: SvgPicture.asset(Assets.addCartIcon),
                        ),
                        3.ph,
                        Text(
                          "EvoCart",
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
          VerticalProjectsDisplayLayoutWidget(temp: temp),
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
          isAddToCard: true,
        );
      },
    );
  }
}
