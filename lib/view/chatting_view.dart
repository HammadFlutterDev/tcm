import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tcm/config/app_styles.dart';
import 'package:tcm/config/asset_path.dart';
import 'package:tcm/utils/app_extensions.dart';
import 'package:tcm/view/comment_view.dart';
import 'package:tcm/widgets/display_network_image.dart';
import 'package:tcm/widgets/user_profile_widget.dart';

import '../config/app_colors.dart';
import '../widgets/scroll_behavior.dart';

class ChattingView extends StatefulWidget {
  final bool isPaid;
  final String userName;
  final String userImage;
  final String? productImage;
  const ChattingView(
      {super.key,
      this.isPaid = false,
      this.productImage = "",
      required this.userName,
      required this.userImage});

  @override
  State<ChattingView> createState() => _ChattingViewState();
}

class _ChattingViewState extends State<ChattingView> {
  late final TextEditingController controller;

  List<ChattingMessagingDataModel> messages = [
    ChattingMessagingDataModel(
        message: "Is it still available?",
        time: "5:39 PM",
        userImageUrl: "",
        isSender: true),
    ChattingMessagingDataModel(
        message: "Yes available",
        time: "6:39 PM",
        userImageUrl: "",
        isSender: false),
    ChattingMessagingDataModel(
        message: "How much are you selling it for?",
        time: "5:39 PM",
        userImageUrl: "",
        isSender: true),
    ChattingMessagingDataModel(
        message: "I’m asking \$20 for it.",
        time: "6:39 PM",
        userImageUrl: "",
        isSender: false),
    ChattingMessagingDataModel(
        message: "That’s a good price. Can I pick it up today?",
        time: "5:39 PM",
        userImageUrl: "",
        isSender: true),
    ChattingMessagingDataModel(
        message: "Absolutely! I can arrange a meeting spot.",
        time: "6:39 PM",
        userImageUrl: "",
        isSender: false),
  ];
  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor1,
      bottomSheet: ChattingSendBoxWidget(
        textEditingController: controller,
        hintText: "Send a message...",
        onGallerySelect: () {},
        onSendTap: () {
          if (controller.text != "") {
            messages.add(ChattingMessagingDataModel(
                message: controller.text,
                time: DateTime.now().toTimeString(),
                userImageUrl: Assets.userImage,
                isSender: true));
            controller.clear();
            setState(() {});
          }
        },
      ),
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(AppBar().preferredSize.height + 40.h),
          child: ChatTopWidget(
            imageUrl: widget.userImage,
            name: widget.userName,
            onOptionTap: () {},
            onBackTap: null,
          )),
      body: ScrollConfiguration(
          behavior: MyBehavior(),
          child: ListView(
            padding: EdgeInsets.only(
                bottom: 100.r,
                left: AppStyles.screenHorizontalPadding,
                right: AppStyles.screenHorizontalPadding,
                top: AppStyles.screenHorizontalPadding),
            children: [
              BuyingProductTitleWidget(
                productImage: widget.productImage!,
                productPrice: "12.00",
                productTitle: "Best Travel neck pillow available two...",
                isButtonEnable: true,
                onTap: () {},
              ),
              20.ph,
              Center(
                child: Text(
                  "Nov 26, 2024",
                  style: context.textStyle.bodySmall!.copyWith(fontSize: 10.sp),
                ),
              ),
              20.ph,
              ...List.generate(
                  messages.length,
                  (index) => messages[index].isSender
                      ? SenderMessageWidget(
                          message: messages[index].message,
                          time: messages[index].time,
                        )
                      : ReceiverMessageWidget(
                          message: messages[index].message,
                          time: messages[index].time,
                          userImageUrl: widget.userImage))
            ],
          )),
    );
  }
}

class BuyingProductTitleWidget extends StatelessWidget {
  final String productImage;
  final String productTitle;
  final String productPrice;
  final bool? isButtonEnable;
  final VoidCallback? onTap;
  final bool? isPaid;
  const BuyingProductTitleWidget(
      {super.key,
      this.isButtonEnable = false,
      this.isPaid = false,
      required this.productImage,
      required this.productPrice,
      required this.productTitle,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10.r),
          child: DisplayNetworkImage(
            imageUrl: productImage,
            width: 83.r,
            height: 81.r,
          ),
        ),
        10.pw,
        Expanded(
            child: SizedBox(
          height: 81.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                productTitle,
                overflow: TextOverflow.ellipsis,
                maxLines: isButtonEnable! ? 1 : 2,
                style: context.textStyle.displayMedium,
              ),
              Text(
                "\$$productPrice",
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: context.textStyle.headlineMedium!.copyWith(
                    height: 0.9, fontWeight: FontWeight.w700, fontSize: 20.sp),
              ),
              if (isButtonEnable!) ...[
                3.ph,
                Row(
                  children: [
                    !isPaid!
                        ? GestureDetector(
                            onTap: onTap,
                            child: Container(
                              padding: EdgeInsets.all(1.r),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(500.r),
                                  gradient: AppColors.primaryGradinet),
                              child: Container(
                                padding: EdgeInsets.only(
                                    left: 10.r,
                                    right: 10.r,
                                    top: 10.r,
                                    bottom: 2.r),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(500.r),
                                ),
                                child: Text(
                                  "Payment Paid",
                                  textAlign: TextAlign.center,
                                  style: context.textStyle.displaySmall!
                                      .copyWith(
                                          height: 0.3,
                                          foreground: AppColors.gradientPaint),
                                ),
                              ),
                            ),
                          )
                        : GestureDetector(
                            onTap: onTap,
                            child: Container(
                              padding: EdgeInsets.only(
                                  left: 10.r,
                                  right: 10.r,
                                  top: 10.r,
                                  bottom: 2.r),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(500.r),
                                  border: Border.fromBorderSide(BorderSide(
                                      color: context.colors.surface))),
                              child: Text(
                                "Buy Now",
                                textAlign: TextAlign.center,
                                style: context.textStyle.displaySmall!.copyWith(
                                  height: 0.3,
                                ),
                              ),
                            ),
                          ),
                  ],
                )
              ]
            ],
          ),
        )),
      ],
    );
  }
}

class SenderMessageWidget extends StatelessWidget {
  final String message;
  final String time;
  const SenderMessageWidget(
      {super.key, required this.message, required this.time});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.r, vertical: 5.r),
              constraints: BoxConstraints(
                  minWidth: 0.0, maxWidth: context.screenwidth * 0.8),
              decoration: BoxDecoration(
                  color: context.colors.primary,
                  borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(500.r),
                      right: Radius.circular(500.r))),
              child: Text(
                message,
                style:
                    context.textStyle.bodyMedium!.copyWith(color: Colors.white),
              ),
            ),
            Text(
              time,
              style: context.textStyle.bodyMedium!.copyWith(fontSize: 10.sp),
            ),
            10.ph
          ],
        )
      ],
    );
  }
}

class ReceiverMessageWidget extends StatelessWidget {
  final String message;
  final String time;
  final String userImageUrl;
  const ReceiverMessageWidget(
      {super.key,
      required this.message,
      required this.time,
      required this.userImageUrl});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UserProfileWidget(radius: 20.r, imageUrl: userImageUrl),
        5.pw,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.r, vertical: 5.r),
              constraints: BoxConstraints(
                  minWidth: 0.0, maxWidth: context.screenwidth * 0.8),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(500.r),
                      right: Radius.circular(500.r))),
              child: Text(
                message,
                style: context.textStyle.bodyMedium!,
              ),
            ),
            Text(
              time,
              style: context.textStyle.bodyMedium!.copyWith(fontSize: 10.sp),
            ),
            10.ph
          ],
        )
      ],
    );
  }
}

class ChattingMessagingDataModel {
  late final String message;
  late final String time;
  late final String userImageUrl;
  late final bool isSender;

  ChattingMessagingDataModel(
      {required this.message,
      required this.time,
      required this.userImageUrl,
      required this.isSender});
}
