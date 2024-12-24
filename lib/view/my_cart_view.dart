import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tcm/config/app_colors.dart';
import 'package:tcm/config/app_styles.dart';
import 'package:tcm/config/asset_path.dart';
import 'package:tcm/providers/product_provider.dart';
import 'package:tcm/utils/app_extensions.dart';
import 'package:tcm/utils/app_router.dart';
import 'package:tcm/view/checkout_view.dart';
import 'package:tcm/widgets/common_screen_template_widget.dart';
import 'package:tcm/widgets/custom_back_button_widget.dart';
import 'package:tcm/widgets/custom_button_widget.dart';
import 'package:tcm/widgets/display_network_image.dart';

class MyCartView extends ConsumerStatefulWidget {
  const MyCartView({super.key});

  @override
  ConsumerState<MyCartView> createState() => _MyCartViewConsumerState();
}

class _MyCartViewConsumerState extends ConsumerState<MyCartView> {
  bool isCheck = false;
  bool cart1 = false;
  bool cart2 = false;
  List<bool> check = [];

  @override
  Widget build(BuildContext context) {
    final checkoutList = ref.watch(productDataProvider).checkOutList;
    if (check.isEmpty) {
      check = List.generate(
        checkoutList.length,
        (index) => false,
      );
    }
    return CommonScreenTemplateWidget(
        leadingWidget: const CustomBackButtonWidget(),
        bottomWidget: checkoutList.isNotEmpty
            ? Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppStyles.screenHorizontalPadding,
                    vertical: AppStyles.screenHorizontalPadding),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        isCheck = !isCheck;

                        check = List.generate(check.length, (index) => isCheck);

                        setState(() {});
                      },
                      child: Container(
                        width: 22.r,
                        height: 22.r,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient:
                                isCheck ? AppColors.primaryGradinet : null,
                            border: !isCheck
                                ? Border.all(color: Colors.black)
                                : null),
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 17.r,
                        ),
                      ),
                    ),
                    5.pw,
                    Text(
                      "All",
                      style: context.textStyle.bodyMedium,
                    ),
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Total:",
                          style: context.textStyle.displayMedium!
                              .copyWith(fontSize: 16.sp),
                        ),
                        Text(
                          "\$15.00",
                          style: context.textStyle.displayLarge!.copyWith(
                              fontWeight: FontWeight.w700, fontSize: 24.sp),
                        )
                      ],
                    ),
                    20.pw,
                    SizedBox(
                        width: 126.w,
                        child: CustomButtonWidget(
                            title: "Check Out (${checkoutList.length})",
                            onPressed: () {
                              AppRouter.push(CheckoutView(
                                product: checkoutList[0],
                              ));
                            }))
                  ],
                ),
              )
            : null,
        actionWidget: GestureDetector(
          onTap: () {
            if (isCheck) {
              ref.read(productDataProvider.notifier).clearCheckOutList();
            } else {
              ref
                  .read(productDataProvider.notifier)
                  .removeItem(check.indexOf(true));
            }
            setState(() {});
          },
          child: Container(
            width: 31.r,
            height: 31.r,
            padding: EdgeInsets.all(6.r),
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.white),
            child: SvgPicture.asset(
              Assets.deleteIcon,
            ),
          ),
        ),
        title: "My Cart",
        child: ListView.separated(
            itemBuilder: (context, index) => AddCartWidget(
                  title: checkoutList[index].productName!,
                  subtitle: "Redbull, Energy Drink, Weight 32gram",
                  price: checkoutList[index].productPrice!,
                  image: checkoutList[index].productImage!,
                  isSelect: check[index],
                  onTap: () {
                    check[index] = !check[index];
                    setState(() {});
                  },
                ),
            separatorBuilder: (context, index) => 10.ph,
            itemCount: checkoutList.length));
    // child: ListView(
    //   children: [
    // AddCartWidget(
    //   title: "Red bull Energy drink 24 can available",
    //   subtitle: "Redbull, Energy Drink, Weight 32gram",
    //   price: "12.00",
    //   image: "",
    //   isSelect: cart1,
    //   onTap: () {
    //     cart1 = !cart1;
    //     setState(() {});
    //   },
    // ),
    //     10.ph,
    //     AddCartWidget(
    //       title: "Red bull Energy drink 24 can available",
    //       subtitle: "Redbull, Energy Drink, Weight 32gram",
    //       price: "12.00",
    //       image: "",
    //       isSelect: cart2,
    //       onTap: () {
    //         cart2 = !cart2;
    //         setState(() {});
    //       },
    //     )
    //   ],
    // ));
  }
}

class AddCartWidget extends StatelessWidget {
  final String title;
  final String price;
  final String subtitle;
  final String image;
  final bool isSelect;
  final VoidCallback onTap;
  const AddCartWidget(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.image,
      required this.price,
      required this.isSelect,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(
          horizontal: AppStyles.screenHorizontalPadding, vertical: 20.r),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              20.ph,
              GestureDetector(
                onTap: onTap,
                child: Container(
                  width: 22.r,
                  height: 22.r,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: isSelect ? AppColors.primaryGradinet : null,
                      border:
                          !isSelect ? Border.all(color: Colors.black) : null),
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 17.r,
                  ),
                ),
              ),
            ],
          ),
          10.pw,
          Expanded(
              child: Column(
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    Assets.cartIcon,
                    width: 35.r,
                  ),
                  5.pw,
                  Text(
                    "PurelyPrime",
                    style: context.textStyle.displayMedium,
                  )
                ],
              ),
              10.ph,
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(9.r),
                    child: DisplayNetworkImage(
                      imageUrl: "",
                      width: 99.r,
                      height: 93.r,
                    ),
                  ),
                  10.pw,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: context.textStyle.displayMedium,
                        ),
                        // 10.ph,
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 5.r, vertical: 2),
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 67, 240, 246)
                                  .withValues(alpha: 0.10)),
                          child: Text(
                            subtitle,
                            style: context.textStyle.bodySmall!.copyWith(
                                color: Colors.black.withValues(alpha: 0.6)),
                          ),
                        ),
                        // 10.ph,
                        Text(
                          "\$$price",
                          style: context.textStyle.displayMedium!
                              .copyWith(fontSize: 18.sp),
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ))
        ],
      ),
    );
  }
}
