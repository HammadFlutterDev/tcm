import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';


import '../config/asset_path.dart';
import '../providers/theme_provider.dart';

class AppLogoWidget extends ConsumerWidget {
  final double? height;
  final double? width;
  const AppLogoWidget({super.key, this.height, this.width});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isDark = ref.watch(themeProvider).brightness == Brightness.dark;
    return SvgPicture.asset(
                 isDark ? Assets.appLogoDark : Assets.appLogo,
                  height: height,
                  width: width,
                );
  }
}