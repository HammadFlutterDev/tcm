import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tcm/config/app_colors.dart';
import 'package:tcm/config/app_styles.dart';
import 'package:tcm/utils/app_extensions.dart';
import 'package:tcm/utils/app_router.dart';
import 'package:tcm/view/chatting_view.dart';
import 'package:tcm/widgets/common_screen_template_widget.dart';
import 'package:tcm/widgets/custom_back_button_widget.dart';
import 'package:tcm/widgets/display_network_image.dart';
import 'package:tcm/widgets/user_profile_widget.dart';

class ChattingListView extends StatelessWidget {
  ChattingListView({super.key});
  final List<ChatListDataModel> chattingList = [
    ChatListDataModel(
        username: "Cristiano David",
        userImage:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQyW1v_mM9vuI9Sd7amcifLxqjlFN7bXlvv3LLtPHuLm1khSZwqsovb7bbOWb-z5CRwqnU&usqp=CAU",
        productImage:
            "https://cdn.pixabay.com/photo/2021/02/18/09/26/coca-cola-6026672_640.jpg",
        lastmessagetext: "Absolutely! I can arrange..."),
    ChatListDataModel(
        username: "Cristiano David",
        userImage:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRY2ahJliB6cPF2rMalfHlFmJuM7Tjgs1iGHO0279xD6Wyg_fPPB9UCXd0J5oPlSXcncN8&usqp=CAU",
        productImage:
            "https://petapixel.com/assets/uploads/2017/03/product1.jpeg",
        lastmessagetext: "Absolutely! I can arrange..."),
    ChatListDataModel(
        username: "Cristiano David",
        userImage:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTCB6HqWvcVC3HlKduT7nP44d_RYuJOIFTwcA4LQQo0zA8GRbW_N9wEwaF1kBiMPoKcnN4&usqp=CAU",
        productImage:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8q6wZPYuvZhXPCbo42ZYPzc-N9s4eHmkQvw&s",
        lastmessagetext: "Absolutely! I can arrange..."),
  ];

  @override
  Widget build(BuildContext context) {
    return CommonScreenTemplateWidget(
      leadingWidget: const CustomBackButtonWidget(),
      title: "All Messages",
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Text(
                "Edit",
                style: context.textStyle.bodyMedium!.copyWith(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: chattingList.length,
              padding:
                  EdgeInsets.symmetric(horizontal: AppStyles.screenHorizontalPadding),
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) => SizedBox(
                height: 100.h,
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 0.0),
                  onTap: () {
                    AppRouter.push(ChattingView(
                      userName: chattingList[index].username,
                      userImage: chattingList[index].userImage,
                      productImage: chattingList[index].productImage,
                    ));
                  },
                  visualDensity: const VisualDensity(horizontal: -4.0),
                  horizontalTitleGap: 40.r,
                  leading: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5.r),
                        child: DisplayNetworkImage(
                          width: 74.r,
                          height: 69.r,
                          imageUrl: chattingList[index].productImage,
                        ),
                      ),
                      Positioned(
                        bottom: -15,
                        right: -15,
                        child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 26.r,
                            child: UserProfileWidget(
                                radius: 18.r,
                                imageUrl: chattingList[index].userImage)),
                      )
                    ],
                  ),
                  title: Text(
                    chattingList[index].username,
                    style: context.textStyle.labelMedium!.copyWith(fontSize: 16.sp),
                    maxLines: 1,
                  ),
                  subtitle: Text(
                    chattingList[index].lastmessagetext,
                    style: context.textStyle.bodyMedium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 15.r,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ChatListDataModel {
  late final String userImage;
  late final String productImage;
  late final String username;
  late final String lastmessagetext;

  ChatListDataModel(
      {required this.username,
      required this.userImage,
      required this.productImage,
      required this.lastmessagetext});
}
