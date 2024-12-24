import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tcm/config/app_colors.dart';
import 'package:tcm/utils/app_extensions.dart';

class AnimatedSearchText extends StatefulWidget {
  final List<String> texts;

  const AnimatedSearchText({
    super.key,
    required this.texts,
  });

  @override
  _AnimatedSearchTextState createState() => _AnimatedSearchTextState();
}

class _AnimatedSearchTextState extends State<AnimatedSearchText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  int _currentIndex = 0;
  bool _isPaused = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _animation = Tween<double>(begin: -1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _controller.addStatusListener((status) async {
      if (status == AnimationStatus.completed && !_isPaused) {
        // Pause when animation reaches the center
        setState(() {
          _isPaused = true;
        });

        // Wait for 1 second before changing the text
        await Future.delayed(const Duration(seconds: 1));

        // Move to the next text
        setState(() {
          _currentIndex = (_currentIndex + 1) % widget.texts.length;
        });

        // Reset and start the animation again for the next text
        _controller.reset();
        _controller.forward();

        // After the animation finishes, reset pause flag
        setState(() {
          _isPaused = false;
        });
      }
    });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(0.0, -50.h * _animation.value),
                child: Text(
                  widget.texts[_currentIndex],
                  style: context.textStyle.displayMedium!.copyWith(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
