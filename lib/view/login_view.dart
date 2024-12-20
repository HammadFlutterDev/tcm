import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tcm/config/app_styles.dart';
import 'package:tcm/config/asset_path.dart';
import 'package:tcm/utils/app_extensions.dart';
import 'package:tcm/utils/app_router.dart';
import 'package:tcm/widgets/custom_social_button_widget.dart';

import 'navigation_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.primaryContainer,
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: AppStyles.screenHorizontalPadding),
        child: Stack(
          // alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: 380,
              width: double.infinity,
              color: Colors.red,
            ),
            Container(
              height: context.screenwidth,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter, // Start from the top
                  end: Alignment.bottomCenter, // End at the bottom
                  colors: [
                    Colors.white.withValues(alpha: 0),
                    Colors.white.withValues(alpha: 1), // White at the top
                    // Transparent white at the bottom
                  ],
                  stops: const [
                    0.6648,
                    1.0
                  ], // Corresponds to 66.48% and 100% in CSS
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                410.ph,
                Center(
                    child: SvgPicture.asset(
                  Assets.appLogo,
                  width: 141.r,
                  height: 59.r,
                )),
                12.ph,
                Text(
                  "Travel Community Marketplace",
                  style: context.textStyle.displayMedium!
                      .copyWith(fontSize: 16.sp),
                ),
                32.ph,
                Row(
                  children: [
                    Expanded(
                        child: Divider(
                      thickness: 1,
                      color: Colors.black.withValues(alpha: 0.5),
                    )),
                    23.pw,
                    Text(
                      'Sign up and Log in with',
                      style: context.textStyle.bodyMedium,
                    ),
                    23.pw,
                    Expanded(
                        child: Divider(
                      thickness: 1,
                      color: Colors.black.withValues(alpha: 0.5),
                    )),
                  ],
                ),
                22.ph,
                if (Platform.isIOS) ...[
                  CustomSocialButtonWidget(
                      title: "Continue with Apple",
                      icon: Assets.appleIcon,
                      onTap: () {
                         AppRouter.push(const NavigationView());
                      }),
                  10.ph
                ],
                CustomSocialButtonWidget(
                    title: "Continue with Google",
                    icon: Assets.googleIcon,
                    onTap: () {
                      AppRouter.push(const NavigationView());
                    }),
                10.ph,
                CustomSocialButtonWidget(
                    title: "Continue with Facebook",
                    icon: Assets.facebookIcon,
                    onTap: () {
                       AppRouter.push(const NavigationView());
                    }),
                const Spacer(),
                RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        style: context.textStyle.bodyMedium!,
                        children: [
                          const TextSpan(
                              text:
                                  "By continuing, you agree to Travel Community Market place "),
                          TextSpan(
                              text: "Terms of Service",
                              style: context.textStyle.displayMedium),
                          const TextSpan(text: " and acknowledge you've read "),
                          TextSpan(
                              text: "our Privacy Policy. Notice at collection",
                              style: context.textStyle.displayMedium),
                        ])),
                20.ph
              ],
            )
          ],
        ),
      ),
    );
  }
}
