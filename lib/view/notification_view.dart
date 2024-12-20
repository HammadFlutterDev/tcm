import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tcm/config/app_colors.dart';
import 'package:tcm/config/app_styles.dart';
import 'package:tcm/utils/app_extensions.dart';
import 'package:tcm/widgets/common_screen_template_widget.dart';
import 'package:tcm/widgets/custom_back_button_widget.dart';
import 'package:tcm/widgets/user_profile_widget.dart';

class NotificationView extends StatelessWidget {
  NotificationView({super.key});
  final List<NotificationDataModel> notifications = [
    NotificationDataModel(
        imageUrl:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBks98xcOTXXIYF3z87erbFfZ2RE4mWK5myQ&s",
        title: "Your Desired Product Carry bag is now available",
        time: "Just now",
        isNew: true),
    NotificationDataModel(
        imageUrl:
            "https://images.pexels.com/photos/457882/pexels-photo-457882.jpeg?cs=srgb&dl=pexels-asadphoto-457882.jpg&fm=jpg",
        title: "Alex David comment on your latest post in community",
        time: "30 min ago",
        isNew: true,
        isPostNotification: true,
        userImageUrl:
            "https://media.istockphoto.com/id/2073254261/photo/an-adult-man-is-using-his-smartphone.webp?a=1&b=1&s=612x612&w=0&k=20&c=Hj-JBhwzX2ur8YBqnjPHFnmMyj5Kvo2hm9ai0U7CfKU="),
  ];
  final List<NotificationDataModel> oldNotifications = [
    NotificationDataModel(
      imageUrl:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-QiFYTI_Gy8p3nXBQufhoK_bc0olbGMAyoQ&ss",
      title: "Your Desired Product Carry bag is now available",
      time: "1 days ago",
    ),
    NotificationDataModel(
      imageUrl:
          "https://media.istockphoto.com/id/1129655522/photo/colorful-soda-drinks-and-filled-ice-cubes-in-a-coolbox.jpg?s=612x612&w=0&k=20&c=xiKeoT7-9rpNCiZ6PcK68EGJbWnqPyQT1KoPdHVp3LA=",
      title: "Your Desired Product Carry bag is now available",
      time: "4 days ago",
    ),
    NotificationDataModel(
      imageUrl:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTLhyeCNLs5mMa_6LuMrXCcGAzoBQq_5Gwjg&s",
      title: "Your Desired Product Carry bag is now available",
      time: "5 days ago",
    ),
    NotificationDataModel(
        imageUrl:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSqSNQlanBZu3LhJfYI8bMJDuIzA6L3UNIcGw&s",
        title: "Alex David comment on your latest post in community",
        time: "4 min ago",
        isPostNotification: true,
        userImageUrl:
            "https://wac-cdn.atlassian.com/dam/jcr:ba03a215-2f45-40f5-8540-b2015223c918/Max-R_Headshot%20(1).jpg?cdnVersion=2472"),
  ];
  @override
  Widget build(BuildContext context) {
    return CommonScreenTemplateWidget(
      title: "Notifications",
      leadingWidget: const CustomBackButtonWidget(),
      child: ListView(
        padding:
            EdgeInsets.symmetric(horizontal: AppStyles.screenHorizontalPadding),
        children: [
          Row(
            children: [
              Text(
                "Today",
                style:
                    context.textStyle.displayMedium!.copyWith(fontSize: 16.sp),
              )
            ],
          ),
          20.ph,
          ...List.generate(
            notifications.length,
            (index) => NotificationTitleWidget(
              data: notifications[index],
            ),
          ),
          Row(
            children: [
              Text(
                "Old Notifications",
                style:
                    context.textStyle.displayMedium!.copyWith(fontSize: 16.sp),
              )
            ],
          ),
          20.ph,
          ...List.generate(
            oldNotifications.length,
            (index) => NotificationTitleWidget(
              data: oldNotifications[index],
            ),
          ),
        ],
      ),
    );
  }
}

class NotificationTitleWidget extends StatelessWidget {
  final NotificationDataModel data;
  const NotificationTitleWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 0.0,
      ),
      visualDensity: const VisualDensity(horizontal: -4.0),
      // minLeadingWidth: 200.w,
      // minTileHeight: 10.h,
      minVerticalPadding: 13.r,
      leading: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          UserProfileWidget(radius: 38.r, imageUrl: data.imageUrl),
          if (data.isNew!)
            Positioned(
                top: -7,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.r),
                  decoration: BoxDecoration(
                      color: context.colors.primary,
                      borderRadius: BorderRadius.circular(4.r)),
                  child: Text(
                    "New",
                    style: context.textStyle.bodySmall!
                        .copyWith(height: 1.1, color: Colors.white),
                  ),
                )),
          if (data.isPostNotification!)
            Positioned(
              bottom: -3,
              right: -5,
              child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 20.r,
                  child: UserProfileWidget(
                      radius: 15.r, imageUrl: data.userImageUrl!)),
            )
        ],
      ),
      title: Text(
        data.title,
        style: context.textStyle.bodyMedium!.copyWith(height: 1.1),
      ),
      subtitle: Text(
        data.time,
        style: context.textStyle.bodySmall!.copyWith(
            fontWeight: FontWeight.w500,
            color: data.isNew!
                ? AppColors.primaryColor
                : Colors.black.withValues(alpha: 0.7),
            wordSpacing: 1.4),
      ),
      trailing: IconButton(
        visualDensity: const VisualDensity(horizontal: -4.0),
        onPressed: () {},
        icon: const Icon(
          Icons.more_horiz,
          color: Colors.black,
        ),
        padding: EdgeInsets.zero,
      ),
    );
  }
}

class NotificationDataModel {
  late final bool? isNew;
  late final String imageUrl;
  late final bool? isPostNotification;
  late final String time;
  late final String? userImageUrl;
  late final String title;

  NotificationDataModel(
      {required this.imageUrl,
      required this.title,
      required this.time,
      this.isNew = false,
      this.isPostNotification = false,
      this.userImageUrl = ""});
}
