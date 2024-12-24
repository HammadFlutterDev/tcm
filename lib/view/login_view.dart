import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tcm/config/app_styles.dart';
import 'package:tcm/config/asset_path.dart';
import 'package:tcm/utils/app_extensions.dart';
import 'package:tcm/utils/app_router.dart';
import 'package:tcm/widgets/custom_social_button_widget.dart';

import '../widgets/onboarding_animation_widget.dart';
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
          clipBehavior: Clip.none,
          children: [
            SizedBox(
              height: context.screenheight *0.6,
              width: double.infinity,
              child: const RowAnimation(),
            ),
            Container(
              height: context.screenheight,
              width: context.screenwidth,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  end:
                      Alignment.topCenter, // Equivalent to 0deg (top to bottom)
                  begin: Alignment.bottomCenter,
                  colors: [
                    // Fully opaque white

                    Colors.white,
                    Colors.white
                        .withOpacity( 0.0), // Fully transparent white
                  ],
                  stops: [
                    0.4787.h,
                    1.0
                  ], // Position the gradient stop to match 66.48%
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
                      color: Colors.black.withOpacity( 0.5),
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
                      color: Colors.black.withOpacity( 0.5),
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
