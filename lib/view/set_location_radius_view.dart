import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tcm/config/app_colors.dart';
import 'package:tcm/config/app_styles.dart';
import 'package:tcm/config/asset_path.dart';
import 'package:tcm/utils/app_extensions.dart';
import 'package:tcm/utils/app_router.dart';
import 'package:tcm/view/set_notification_view.dart';
import 'package:tcm/widgets/common_screen_template_widget.dart';
import 'package:tcm/widgets/custom_back_button_widget.dart';
import 'package:tcm/widgets/custom_button_widget.dart';
import 'package:tcm/widgets/custom_search_bar_widget.dart';

class SetLocationRadiusView extends StatefulWidget {
  const SetLocationRadiusView({super.key});

  @override
  State<SetLocationRadiusView> createState() => _SetLocationRadiusViewState();
}

class _SetLocationRadiusViewState extends State<SetLocationRadiusView> {
  double _sliderValue = 0.5;
  @override
  Widget build(BuildContext context) {
    return CommonScreenTemplateWidget(
      title: "Set Location Redius",
      leadingWidget: const CustomBackButtonWidget(),
      appBarHeight: 150.h,
      bottomAppbarWidget: PreferredSize(
          preferredSize: Size.fromHeight(200.h),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppStyles.screenHorizontalPadding,
                vertical: AppStyles.screenHorizontalPadding),
            child: CustomSearchBarWidget(
                controller: TextEditingController(),
                hintText: "Search Product"),
          )),
      child: Column(
        children: [
          Expanded(
              child: Stack(
            children: [
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(Assets.map), fit: BoxFit.cover)),
              ),
              Container(
                width: double.infinity,
                decoration:
                    BoxDecoration(color: Colors.black.withValues(alpha: 0.4)),
              ),
            ],
          )),
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: AppStyles.screenHorizontalPadding,
                vertical: AppStyles.screenHorizontalPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                        child: Text(
                      "Set a radius to get alerts for this product",
                      style: context.textStyle.bodyMedium!
                          .copyWith(fontSize: 16.sp),
                    ))
                  ],
                ),
                10.ph,
                Text(
                  "${_sliderValue.toStringAsFixed(0)}KM",
                  style: context.textStyle.displayMedium!
                      .copyWith(fontSize: 18.sp),
                ),
                Slider(
                  activeColor: context.colors.primary,
                  padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10.r),
                  max: 100,
                  min: 0,
                  thumbColor: Colors.white,
                  inactiveColor: AppColors.borderColor,
                  value: _sliderValue,
                  onChanged: (value) {
                    _sliderValue = value;
                    setState(() {});
                  },
                ),
                10.ph,
                CustomButtonWidget(
                    title: "Set Radius",
                    onPressed: () {
                      showFullScreenModal(context);
                    })
              ],
            ),
          )
        ],
      ),
    );
  }
}

class DashedSliderPainter extends CustomPainter {
  final Color activeColor;
  final Color inactiveColor;
  final double activeTrackEnd; // Track end point controlled by the slider value

  DashedSliderPainter({
    required this.activeColor,
    required this.inactiveColor,
    required this.activeTrackEnd,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    // Draw the inactive track (grey color)
    paint.color = inactiveColor;
    canvas.drawLine(
        Offset(0, size.height / 2), Offset(size.width, size.height / 2), paint);

    // Draw the dashed active track (blue color)
    paint.color = activeColor;
    paint.strokeCap = StrokeCap.round;

    double dashWidth = 10;
    double dashSpace = 5;
    double distance = 0;

    // Calculate the position of the dashed line based on the slider's value
    double activeTrackEndPosition =
        size.width * activeTrackEnd; // Position of the thumb

    while (distance < activeTrackEndPosition) {
      canvas.drawLine(
        Offset(distance, size.height / 2),
        Offset(distance + dashWidth, size.height / 2),
        paint,
      );
      distance += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true; // Repaint whenever the slider value changes
  }
}

class CircleClipPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    // Draw the background (full blue container)
    canvas.drawRect(Offset.zero & size, paint);

    // Transparent circle in the center
    paint.color = Colors.transparent; // Make the circle transparent
    double radius = size.width / 4; // Circle radius
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), radius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
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
                child: Scaffold(
                  backgroundColor: Colors.transparent,
                  appBar: PreferredSize(
                      preferredSize: Size.fromHeight(
                          AppBar().preferredSize.height + 200.h),
                      child: AppBar(
                        elevation: 0.0,
                        toolbarHeight: 100,
                        centerTitle: true,
                        title: Text(
                          "Ready for Notifications",
                          style: context.textStyle.displayMedium!
                              .copyWith(fontSize: 18.sp),
                        ),
                        backgroundColor: Colors.transparent,
                        leading: const CustomBackButtonWidget(),
                        iconTheme: IconThemeData(size: 100.w),
                      )),
                ),
              ),
            ),
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset(
                  Assets.mobileMockUpImage,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: context.screenwidth,
                height: 300.h,
                padding: EdgeInsets.all(25.r),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.elliptical(200, 50),
                      topRight: Radius.elliptical(200, 50)),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Text(
                      "Turn on notifications",
                      style: context.textStyle.displayMedium!
                          .copyWith(fontSize: 18.sp),
                    ),
                    10.ph,
                    Expanded(
                      child: Text(
                        "Tap that button to turn on alerts and be the first to know when your desired product is back in stock. Your next favorite find is just a click away!",
                        textAlign: TextAlign.center,
                        style: context.textStyle.bodyMedium!.copyWith(
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                    CustomButtonWidget(
                        title: 'Turn on Notifications',
                        onPressed: () {
                          AppRouter.push(SetNotificationView());
                        })
                  ],
                ),
              ),
            )
          ])
        ],
      );
    },
  );
}

// Custom Clipper to clip a chord of a circle
class ChordClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    // Define the center of the circle
    double centerX = size.width / 2;
    double centerY = size.height;

    // Draw the arc as a full circle path, with the chord cutting through
    path.moveTo(0, centerY); // Start at the left point of the chord
    path.lineTo(size.width, centerY); // Go to the right point of the chord

    path.lineTo(
        centerX + 500, centerY); // Draw a line from the bottom to the top
    path.close(); // Close the path to make the shape complete

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false; // No need to reclip
  }
}
