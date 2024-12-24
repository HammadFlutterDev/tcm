import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../config/asset_path.dart';

class RowAnimation extends StatefulWidget {
  const RowAnimation({super.key});

  @override
  _RowAnimationState createState() => _RowAnimationState();
}

class _RowAnimationState extends State<RowAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 15),
    );
    _animation = Tween<double>(begin: 0.0, end: 1).animate(_controller);
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SizedBox.expand(
            child: Stack(
              children: [
                // First Column - Top to Bottom
                AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    return Positioned(
                      left: 0,
                      top: MediaQuery.of(context).size.height *
                          (_animation.value - 1),
                      child: const Column(
                        children: [
                          Tile(
                              color: Colors.red,
                              image: Assets.i1,
                              textColor: Colors.black),
                          Tile(
                              color: Colors.grey,
                              image: Assets.i2,
                              textColor: Colors.black),
                          Tile(
                              color: Colors.black,
                              image: Assets.i3,
                              textColor: Colors.black),
                          Tile(
                              color: Colors.yellow,
                              image: Assets.i4,
                              textColor: Colors.black),
                          Tile(
                              color: Colors.brown,
                              image: Assets.i5,
                              textColor: Colors.black),
                          Tile(
                              color: Colors.lightBlue,
                              image: Assets.i6,
                              textColor: Colors.black),
                          Tile(
                              color: Colors.blueGrey,
                              image: Assets.i7,
                              textColor: Colors.black),
                        ],
                      ),
                    );
                  },
                ),
                // Second Column - Bottom to Top
                AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    return Positioned(
                      right: 0,
                      top: MediaQuery.of(context).size.height *
                          (_animation.value - 1),
                      child: const Column(
                        children: [
                          Tile(
                              color: Colors.red,
                              image: Assets.i1,
                              textColor: Colors.black),
                          Tile(
                              color: Colors.grey,
                              image: Assets.i2,
                              textColor: Colors.black),
                          Tile(
                              color: Colors.black,
                              image: Assets.i3,
                              textColor: Colors.black),
                          Tile(
                              color: Colors.yellow,
                              image: Assets.i4,
                              textColor: Colors.black),
                          Tile(
                              color: Colors.brown,
                              image: Assets.i5,
                              textColor: Colors.black),
                          Tile(
                              color: Colors.lightBlue,
                              image: Assets.i6,
                              textColor: Colors.black),
                          Tile(
                              color: Colors.blueGrey,
                              image: Assets.i7,
                              textColor: Colors.black),
                        ],
                      ),
                    );
                  },
                ),
                // Third Column - Top to Bottom
                AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    return Positioned(
                      left: 0,
                      right: 0,
                      bottom: MediaQuery.of(context).size.height *
                          (_animation.value - 1),
                      child: const Column(
                        children: [
                          Tile(
                              color: Colors.red,
                              image: Assets.i1,
                              textColor: Colors.black),
                          Tile(
                              color: Colors.grey,
                              image: Assets.i2,
                              textColor: Colors.black),
                          Tile(
                              color: Colors.black,
                              image: Assets.i3,
                              textColor: Colors.black),
                          Tile(
                              color: Colors.yellow,
                              image: Assets.i4,
                              textColor: Colors.black),
                          Tile(
                              color: Colors.brown,
                              image: Assets.i5,
                              textColor: Colors.black),
                          Tile(
                              color: Colors.lightBlue,
                              image: Assets.i6,
                              textColor: Colors.black),
                          Tile(
                              color: Colors.blueGrey,
                              image: Assets.i7,
                              textColor: Colors.black),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Tile extends StatelessWidget {
  const Tile(
      {super.key,
      required this.color,
      required this.image,
      required this.textColor});
  final Color color;
  final String image;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 154.h,
        width: 120.w,
        padding: const EdgeInsets.symmetric(horizontal: 4),
        margin: EdgeInsets.only(bottom: 10.r),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            image: const DecorationImage(
                image: AssetImage(Assets.homeBackgroundImage),
                fit: BoxFit.cover)),
        child: Image.asset(image));
  }
}
