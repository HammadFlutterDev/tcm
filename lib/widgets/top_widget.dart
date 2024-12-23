import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tcm/utils/app_extensions.dart';
import 'package:tcm/utils/app_router.dart';
import 'package:tcm/view/chatting_list_view.dart';
import 'package:tcm/view/my_cart_view.dart';
import 'package:tcm/view/notification_view.dart';
import 'package:tcm/view/user_profile_view/setting_view.dart';
import 'package:tcm/widgets/custom_menu_icon_shape_widget.dart';

import '../config/app_colors.dart';
import '../config/app_styles.dart';
import '../config/asset_path.dart';

class TopWidget extends StatelessWidget {
  final int index;
  final String image;
  final double height;
  const TopWidget(
      {super.key,
      required this.index,
      required this.image,
      required this.height});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: height,
          decoration: BoxDecoration(
              image:
                  DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
        ),
        Container(
          height: height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0x00F9F9F9),
                Color(0xFFF9F9F9), // #F9F9F9 (solid white)
                // rgba(249, 249, 249, 0) (fully transparent white)
              ],
              stops: [0.0, 0.9], // Gradient stops for each color
            ),
          ),
        ),
        Container(
          height: height,
          padding: EdgeInsets.symmetric(
              horizontal: AppStyles.screenHorizontalPadding),
          child: Column(
            children: [
              50.ph,
              Row(
                children: [
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 5.r, vertical: 7.r),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6.r),
                                gradient: AppColors.primaryGradinet),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  Assets.locationIcon,
                                  width: 12.r,
                                  colorFilter: const ColorFilter.mode(
                                      Colors.white, BlendMode.srcIn),
                                ),
                                4.pw,
                                Text(
                                  "Location",
                                  style: context.textStyle.displaySmall!
                                      .copyWith(color: Colors.white),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      5.ph,
                      Text(
                        "Rainbow Resort, San Luis Obispo",
                        style: context.textStyle.displayMedium,
                      ),
                      Text(
                        "California",
                        style: context.textStyle.bodyMedium,
                      )
                    ],
                  )),
                  if (index == 0)
                    Row(
                      children: [
                        CustomBadgeWidget(
                          child: CustomMenuIconShape(
                              icon: Assets.notificationIcon,
                              onTap: () {
                                AppRouter.push(NotificationView());
                              }),
                        ),
                        6.pw,
                        CustomMenuIconShape(
                            icon: Assets.verticalMenuIcon,
                            onTap: () {
                              AppRouter.push(SettingView());
                            }),
                      ],
                    ),
                  if (index == 1)
                    CustomBadgeWidget(
                      child: CustomMenuIconShape(
                          icon: Assets.messageicon,
                          onTap: () {
                            AppRouter.push(ChattingListView());
                          }),
                    ),
                  if (index == 3)
                    CustomBadgeWidget(
                      showBadge: true,
                      count: 1,
                      child: CustomMenuIconShape(
                          icon: Assets.bagIcon, onTap: () {}),
                    )
                ],
              ),
              const Spacer(),
              if (index == 0) ...[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Text("Sunny",
                            style: context.textStyle.bodySmall!.copyWith(
                              height: 1,
                            )),
                        RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: [
                                // Temperature number with large font size
                                TextSpan(
                                  text: "25\u00B0",
                                  style: context.textStyle.displayLarge!
                                      .copyWith(fontSize: 50.sp),
                                ),

                                TextSpan(
                                  text: "C",
                                  style: context.textStyle.bodySmall!
                                      .copyWith(fontSize: 18.sp),
                                ),
                              ],
                            )),
                      ],
                    ),
                    14.pw,
                    SizedBox(
                      height: 68.h,
                      child: VerticalDivider(
                        width: 1,
                        thickness: 1,
                        color: Colors.black.withValues(alpha: 0.08),
                      ),
                    ),
                    14.pw,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        10.ph,
                        Text(
                          "Monday, 21 September",
                          style: context.textStyle.bodyMedium,
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(Assets.locationIcon),
                            5.pw,
                            Text(
                              "California",
                              style: context.textStyle.bodyMedium,
                            )
                          ],
                        )
                      ],
                    ),
                    const Spacer(),
                    Image.asset(
                      Assets.weatherIcon,
                      width: 77.r,
                      height: 77.r,
                    )
                  ],
                ),
              ],
              if (index == 0)
                Row(
                  children: [
                    Expanded(
                        child: Container(
                      height: 44.h,
                      padding: EdgeInsets.symmetric(horizontal: 16.r),
                      alignment: Alignment.center,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(500.r),
                        border: Border.all(
                            width: 1,
                            color: const Color.fromRGBO(0, 0, 0, 0.10)),
                        color: const Color(0xffF6F6F6),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Search any product",
                              style: context.textStyle.bodyMedium!.copyWith(
                                  color: Colors.black.withValues(alpha: 0.5)),
                            ),
                          ),
                          // Expanded(child: MultipleTissueRollText()),
                          Image.asset(
                            Assets.searchIconGif,
                            width: 35.r,
                          )
                        ],
                      ),
                    )),
                    8.pw,
                    Badge(
                        backgroundColor: AppColors.bagdeColor,
                        label: const Text("1"),
                        textStyle: context.textStyle.bodySmall!.copyWith(
                          height: 0.9,
                        ),
                        child: CustomMenuIconShape(
                            icon: Assets.bagIcon,
                            onTap: () {
                              AppRouter.push(MyCartView());
                            }))
                  ],
                )
            ],
          ),
        )
      ],
    );
  }
}

class CustomBadgeWidget extends StatelessWidget {
  final Widget child;
  final int? count;
  final bool? showBadge;
  const CustomBadgeWidget(
      {super.key, required this.child, this.count, this.showBadge = false});

  @override
  Widget build(BuildContext context) {
    return Badge(
        isLabelVisible: showBadge!,
        backgroundColor: AppColors.bagdeColor,
        label: Text("$count"),
        textStyle: context.textStyle.bodySmall!.copyWith(
          height: 0.9,
        ),
        child: child);
  }
}

class MultipleTissueRollText extends StatefulWidget {
  @override
  _MultipleTissueRollTextState createState() => _MultipleTissueRollTextState();
}

class _MultipleTissueRollTextState extends State<MultipleTissueRollText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late List<Animation<double>> _textAnimations;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2), // Speed of the scrolling
    );

    // We will create a set of animations for multiple texts
    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.linear),
    );

    // Repeat the animation infinitely
    _controller.repeat();

    _textAnimations = List.generate(2, (index) {
      // Create a separate animation for each text
      return Tween<double>(begin: -100.0 * (index + 1), end: 1.0).animate(
        CurvedAnimation(parent: _controller, curve: Curves.linear),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20, // Adjust the height of the widget
      width: double.infinity,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Stack(
            children: List.generate(_textAnimations.length, (index) {
              return Positioned(
                top: _textAnimations[index].value *
                    300, // Control the vertical position
                bottom: 10, // Horizontal padding for the text
                child: Text(
                  'Scrolling Text #${index + 1}',
                  style: context.textStyle.bodyMedium!
                      .copyWith(color: context.colors.primary),
                ),
              );
            }),
          );
        },
      ),
    );
  }
}
