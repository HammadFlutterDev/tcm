import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tcm/config/asset_path.dart';
import 'scroll_behavior.dart';
import 'top_widget.dart';

class TabScreenTemplate extends StatelessWidget {
  final double height;
  final String topImage;
  final int tabIndex;
  final List<Widget> childrens;

  const TabScreenTemplate(
      {super.key,
      required this.tabIndex,
      required this.height,
      required this.topImage,
      required this.childrens});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Assets.homeBackgroundImage),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: ScrollConfiguration(
          behavior: MyBehavior(),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(bottom: 30.r),
              child: Column(
                children: [
                  TopWidget(
                    image: topImage,
                    index: tabIndex,
                    height: height,
                  ),
                  ...childrens
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
