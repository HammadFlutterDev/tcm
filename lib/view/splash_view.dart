import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:tcm/utils/app_router.dart';
import 'package:tcm/view/onboarding_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 4), () {
      AppRouter.pushReplacement(const OnboardingView());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Lottie.asset("assets/lottie/splash_lottie_json.json",);
  }
}
