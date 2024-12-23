import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tcm/config/app_styles.dart';
import 'package:tcm/config/asset_path.dart';
import 'package:tcm/utils/app_extensions.dart';
import 'package:tcm/utils/app_router.dart';
import 'package:tcm/view/checkout_view.dart';

import '../widgets/common_screen_template_widget.dart';
import '../widgets/custom_back_button_widget.dart';
import '../widgets/custom_list_widget.dart';
import 'user_profile_view/add_card_view.dart';

class CheckoutPaymentSelectionView extends StatefulWidget {
  const CheckoutPaymentSelectionView({super.key});

  @override
  State<CheckoutPaymentSelectionView> createState() =>
      _CheckoutPaymentSelectionViewState();
}

class _CheckoutPaymentSelectionViewState
    extends State<CheckoutPaymentSelectionView> {
  @override
  Widget build(BuildContext context) {
    return CommonScreenTemplateWidget(
        title: "Select Payment",
        leadingWidget: const CustomBackButtonWidget(),
        appBarHeight: 60.h,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppStyles.screenHorizontalPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomListWidget(
                iconPayment: Assets.visa,
                title: "Visa",
                onTap: () {
                  AppRouter.push(AddCardView(
                    onTap: () {
                      AppRouter.back();
                      AppRouter.pushReplacement(const CheckoutView(
                        isDeliveryOptionSet: true,
                        isLocationSet: true,
                        isPaymentMethodSet: true,
                      ));
                    },
                  ));
                },
              ),
              12.ph,
              CustomListWidget(
                iconPayment: Assets.masterCard,
                title: "Master card",
                onTap: () {
                  AppRouter.push(AddCardView(
                    onTap: () {
                      AppRouter.back();
                      AppRouter.pushReplacement(const CheckoutView(
                        isDeliveryOptionSet: true,
                        isLocationSet: true,
                        isPaymentMethodSet: true,
                      ));
                    },
                  ));
                },
              ),
              12.ph,
              CustomListWidget(
                iconPayment: Assets.paypal,
                title: "PayPal",
                onTap: () {
                  AppRouter.push(AddCardView(
                    onTap: () {
                      AppRouter.back();
                      AppRouter.pushReplacement(const CheckoutView(
                        isDeliveryOptionSet: true,
                        isLocationSet: true,
                        isPaymentMethodSet: true,
                      ));
                    },
                  ));
                },
              )
            ],
          ),
        ));
    
  }
}
