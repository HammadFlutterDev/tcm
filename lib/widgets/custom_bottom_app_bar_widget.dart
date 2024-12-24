import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:tcm/config/app_styles.dart';
import 'package:tcm/config/asset_path.dart';
import 'package:tcm/providers/bottom_index_provider.dart';
import 'package:tcm/utils/app_extensions.dart';

import '../config/app_colors.dart';
import '../view/navigation_view.dart';

class CustomBottomAppBarWidget extends ConsumerWidget {
  final List<BottomItemDataModel> bottomItems;
  final int selectIndex;
  const CustomBottomAppBarWidget(
      {super.key, required this.bottomItems, required this.selectIndex});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      alignment: Alignment.bottomCenter,
      clipBehavior: Clip.none,
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
              horizontal: AppStyles.screenHorizontalPadding, vertical: 10.r),
          height: 85.h,
          decoration: const BoxDecoration(
            // color: Color(0xFFF8F8F8),
            border: Border(
              top: BorderSide(
                color: Color(0x1A000000), // border color with 10% opacity
                width: 1.0, // border width
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              bottomItems.length,
              (index) => InkWell(
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    ref.read(bottomIndexProvider.notifier).setIndex(index);
                  },
                  child: index != 2
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                              index == selectIndex
                                  ? bottomItems[index].selectIcon
                                  : bottomItems[index].icon,
                              height: 26.r,
                              width: 26.r,
                              colorFilter: index != selectIndex
                                  ? ColorFilter.mode(
                                      context
                                          .bottomAppStyle.unselectedItemColor!,
                                      BlendMode.srcIn)
                                  : null,
                            ),
                            5.ph,
                            Text(
                              bottomItems[index].label,
                              style: index == selectIndex
                                  ? context.bottomAppStyle.selectedLabelStyle!
                                      .copyWith(
                                          foreground: AppColors.gradientPaint)
                                  : context.bottomAppStyle.unselectedLabelStyle,
                            )
                          ],
                        )
                      : Column(
                          children: [30.ph, 10.pw],
                        )),
            ),
          ),
        ),
        Positioned(
            bottom: 16,
            child: GestureDetector(
              onTap: () {
                ref.read(bottomIndexProvider.notifier).setIndex(2);
              },
              child: Column(
                children: [
                  // const RotatingCircle(),
                  Lottie.asset(Assets.handShakeLottie),
                  13.ph,
                  Text(
                    bottomItems[2].label,
                    style: context.bottomAppStyle.unselectedLabelStyle!
                        .copyWith(color: Colors.black),
                  )
                ],
              ),
            ))
      ],
    );
  }
}

// class RotatingCircle extends StatefulWidget {
//   const RotatingCircle({super.key});

//   @override
//   RotatingCircleState createState() => RotatingCircleState();
// }

// class RotatingCircleState extends State<RotatingCircle>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: const Duration(seconds: 3), // Duration of one full rotation
//       vsync: this,
//       // Makes the animation loop infinitely
//     )..repeat();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       alignment: Alignment.center,
//       children: [
//         AnimatedBuilder(
//           animation: _controller,
//           builder: (context, child) {
//             return Transform.rotate(
//               angle: _controller.value * 6.28, // 2 * pi for full rotation
//               child: Container(
//                 padding: const EdgeInsets.all(0.1),
//                 decoration: const BoxDecoration(
//                     shape: BoxShape.circle,
//                     gradient: AppColors.primaryGradinet),
//                 child: Container(
//                   width: 58.r,
//                   height: 58.r,
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     gradient: const LinearGradient(
//                       begin: Alignment.topCenter,
//                       end: Alignment.bottomCenter,
//                       colors: [
//                         AppColors.primaryColor,
//                         Colors.white
//                       ], // Half blue, half white
//                       stops: [
//                         0.5,
//                         0.5
//                       ], // Split the gradient into two equal halves
//                     ),
//                     border: Border.all(
//                       color: Colors.transparent,
//                       width: 2.0,
//                     ),
//                   ),
//                   child: Container(
//                     padding: EdgeInsets.all(10.r),
//                     decoration: const BoxDecoration(
//                         shape: BoxShape.circle,
//                         gradient: AppColors.primaryGradinet),
//                   ),
//                 ),
//               ),
//             );
//           },
//         ),
//         SvgPicture.asset(Assets.handShakeIcon)
//       ],
//     );
//   }
// }
