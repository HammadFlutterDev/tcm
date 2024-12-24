import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tcm/config/app_colors.dart';
import 'package:tcm/config/app_styles.dart';
import 'package:tcm/config/asset_path.dart';
import 'package:tcm/models/post_data_model.dart';
import 'package:tcm/utils/app_extensions.dart';
import 'package:tcm/view/community_view.dart';
import 'package:tcm/widgets/custom_menu_icon_shape_widget.dart';
import 'package:tcm/widgets/scroll_behavior.dart';
import 'package:tcm/widgets/user_profile_widget.dart';

import '../widgets/custom_back_button_widget.dart';

class CommentView extends StatefulWidget {
  final PostDataModel data;
  const CommentView({super.key, required this.data});

  @override
  State<CommentView> createState() => _CommentViewState();
}

class _CommentViewState extends State<CommentView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor1,
      bottomSheet: ChattingSendBoxWidget(
        hintText: "Add comment",
        onGallerySelect: () {},
        onSendTap: () {},
      ),
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(128.h),
          child: ChatTopWidget(
            imageUrl: widget.data.user!.image!,
            name: widget.data.user!.name!,
            onOptionTap: () {},
            onBackTap: null,
          )),
      body: ScrollConfiguration(
          behavior: MyBehavior(),
          child: ListView(
            padding: EdgeInsets.only(bottom: 100.r),
            children: [
              PostWidget(
                data: widget.data,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppStyles.screenHorizontalPadding,
                    vertical: AppStyles.screenHorizontalPadding - 10),
                child: Row(
                  children: [
                    Expanded(
                        child: Text(
                      "All Comment",
                      style: context.textStyle.labelMedium!
                          .copyWith(fontSize: 16.sp),
                    ))
                  ],
                ),
              ),
              ...List.generate(
                widget.data.comments!.length,
                (index) => Padding(
                  padding: EdgeInsets.only(
                      left: AppStyles.screenHorizontalPadding,
                      right: AppStyles.screenHorizontalPadding,
                      bottom: 20.r),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UserProfileWidget(
                          radius: 20.r,
                          imageUrl: widget.data.comments![index].user!.image!),
                      10.pw,
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(10.r),
                          constraints: BoxConstraints(
                              maxHeight: double.infinity, minHeight: 71.h),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.r),
                              color: Colors.white,
                              border: Border.all(
                                  color: const Color.fromRGBO(0, 0, 0, 0.10))),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    widget.data.comments![index].user!.name!,
                                    style: context.textStyle.labelSmall!
                                        .copyWith(letterSpacing: 0.4),
                                  )
                                ],
                              ),
                              Text(
                                widget.data.comments![index].content,
                                style: context.textStyle.bodyMedium,
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}

class ChatTopWidget extends StatelessWidget {
  final VoidCallback? onBackTap;
  final VoidCallback onOptionTap;
  final String name;
  final String imageUrl;
  const ChatTopWidget(
      {super.key,
      this.onBackTap,
      required this.imageUrl,
      required this.name,
      required this.onOptionTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.only(
          left: AppStyles.screenHorizontalPadding - 5,
          right: AppStyles.screenHorizontalPadding - 5,
          // top: 40.r,
          bottom: AppStyles.screenHorizontalPadding),
      decoration: AppStyles.appBarStyle,
      child: Row(
        children: [
          CustomBackButtonWidget(
            onTap: onBackTap,
          ),
          15.pw,
          UserProfileWidget(radius: 30.r, imageUrl: imageUrl),
          6.pw,
          Expanded(
              child: Text(
            name,
            style: context.textStyle.labelMedium!.copyWith(fontSize: 16.sp),
          )),
          IconButton(
              padding: EdgeInsets.zero,
              visualDensity: const VisualDensity(horizontal: -4.0),
              onPressed: onOptionTap,
              icon: Icon(
                Icons.more_horiz_outlined,
                size: 21.r,
              )),
        ],
      ),
    );
  }
}

class ChattingSendBoxWidget extends StatelessWidget {
  final VoidCallback onGallerySelect;
  final VoidCallback onSendTap;
  final String hintText;
  final TextEditingController? textEditingController;

  const ChattingSendBoxWidget(
      {super.key,
      required this.onGallerySelect,
      this.textEditingController,
      required this.onSendTap,
      required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 93.h,
      padding:
          EdgeInsets.symmetric(horizontal: AppStyles.screenHorizontalPadding),
      decoration: const BoxDecoration(
          color: Color(0xffF8F8F8),
          border: Border(
              top: BorderSide(width: 1, color: Color.fromRGBO(0, 0, 0, 0.10)))),
      // color: Colors.red,
      // width: double.infinity,
      child: Row(
        children: [
          IconButton(
              visualDensity: const VisualDensity(horizontal: -4.0),
              padding: EdgeInsets.zero,
              onPressed: onGallerySelect,
              icon: SvgPicture.asset(Assets.chatGalleryIcon)),
          8.pw,
          Expanded(
            child: SizedBox(
              height: 36.h,
              child: TextField(
                controller: textEditingController,
                decoration: InputDecoration(
                    hintText: hintText,
                    hintStyle: context.inputTheme.hintStyle,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 0.0, horizontal: 15.r),
                    enabledBorder: context.inputTheme.border,
                    focusedBorder: context.inputTheme.border,
                    border: context.inputTheme.border),
              ),
            ),
          ),
          10.pw,
          CustomMenuIconShape(
            width: 38.r,
            height: 38.r,
            icon: Assets.sendIcon,
            onTap: onSendTap,
            padding: 5.r,
          ),
        ],
      ),
    );
  }
}
