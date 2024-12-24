import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tcm/config/app_colors.dart';
import 'package:tcm/config/app_styles.dart';
import 'package:tcm/config/asset_path.dart';
import 'package:tcm/models/post_data_model.dart';
import 'package:tcm/utils/app_extensions.dart';
import 'package:tcm/utils/app_router.dart';
import 'package:tcm/widgets/custom_menu_icon_shape_widget.dart';
import 'package:tcm/widgets/display_network_image.dart';
import 'package:tcm/widgets/scroll_behavior.dart';
import 'package:tcm/widgets/top_widget.dart';
import 'package:tcm/widgets/user_profile_widget.dart';
import '../widgets/custom_see_more_text_widget.dart';
import 'chatting_list_view.dart';
import 'comment_view.dart';

class CommunityView extends StatefulWidget {
  const CommunityView({super.key});

  @override
  State<CommunityView> createState() => _CommunityViewState();
}

class _CommunityViewState extends State<CommunityView> {
  final TextEditingController postTextEditController = TextEditingController();
  @override
  void initState() {
    // postTextEditController = TextEditingController();
    super.initState();
  }

  List<PostDataModel> posts = [
    PostDataModel(
        user: UserModel(
            name: "Liam Sebastian",
            image: "https://i.ibb.co/M5PXvLP/e.png",
            status: "Just now"),
        postText:
            "The Wave Slayer 3000 isn’t just a surfboard—it’s a wave-taming beast crafted by a mysterious shaper who spent years perfecting it in a hidden beach cave.",
        attachmentLink: "www.tcm/surfshreddeals.com/wave-slayer-3000",
        comments: [
          UserComments(
              content:
                  "Caught my first perfect barrel with this beast. The legend of the hidden cave shaper is real!",
              user: UserModel(
                image: "https://i.ibb.co/ChBLNsD/Ellipse-29.png",
                name: "BarrelHunter23",
              )),
          UserComments(
              content:
                  "I didn’t believe the hype until I tried it. Smooth rides, insane control, and effortless speed. 10/10!",
              user: UserModel(
                image: "https://i.ibb.co/1qMKhLz/Ellipse.png",
                name: "SaltySiren",
              )),
          UserComments(
              content:
                  "The Wave Slayer 3000 changed my surfing game forever. It's like the board reads the waves for you—pure magic!",
              user: UserModel(
                image: "https://i.ibb.co/M5PXvLP/e.png",
                name: "SandyTides87",
              ))
        ],
        postImages: [
          'https://i.ibb.co/fQKcktD/4.png',
          'https://i.ibb.co/R7P2bgK/image.png',
          'https://i.ibb.co/HK3Y8Jx/5.png'
        ],
        reactionCount: 520),
    PostDataModel(
        user: UserModel(
            name: "John Wick",
            image: "https://i.ibb.co/1qMKhLz/Ellipse.png",
            status: "3 Days ago"),
        postText:
            "Lay's Mystery Crunch—chips so delicious, even we’re not sure what flavor they are! With every bite, you’ll embark on a flavor adventure",
        attachmentLink: "www.tcm/surfshreddeals.com/wave-slayer-3000",
        comments: [
          UserComments(
              content:
                  "Caught my first perfect barrel with this beast. The legend of the hidden cave shaper is real!",
              user: UserModel(
                image: "https://i.ibb.co/ChBLNsD/Ellipse-29.png",
                name: "BarrelHunter23",
              )),
          UserComments(
              content:
                  "I didn’t believe the hype until I tried it. Smooth rides, insane control, and effortless speed. 10/10!",
              user: UserModel(
                image: "https://i.ibb.co/1qMKhLz/Ellipse.png",
                name: "SaltySiren",
              )),
          UserComments(
              content:
                  "The Wave Slayer 3000 changed my surfing game forever. It's like the board reads the waves for you—pure magic!",
              user: UserModel(
                image: "https://i.ibb.co/M5PXvLP/e.png",
                name: "SandyTides87",
              ))
        ],
        postImages: ['https://i.ibb.co/DkMyjBG/3.png'],
        reactionCount: 520),
    PostDataModel(
        user: UserModel(
            name: "Bravo Doe",
            image: "https://i.ibb.co/ChBLNsD/Ellipse-29.png",
            status: "Just now"),
        postText:
            "Experience sound like never before with the BoomBlitz 9000, the ultimate party starter and travel buddy! Engineered with cutting-edge SonicBoomX™ ",
        attachmentLink: "www.tcm/surfshreddeals.com/wave-slayer-3000",
        comments:[
          UserComments(
              content:
                  "Caught my first perfect barrel with this beast. The legend of the hidden cave shaper is real!",
              user: UserModel(
                image: "https://i.ibb.co/ChBLNsD/Ellipse-29.png",
                name: "BarrelHunter23",
              )),
          UserComments(
              content:
                  "I didn’t believe the hype until I tried it. Smooth rides, insane control, and effortless speed. 10/10!",
              user: UserModel(
                image: "https://i.ibb.co/1qMKhLz/Ellipse.png",
                name: "SaltySiren",
              )),
          UserComments(
              content:
                  "The Wave Slayer 3000 changed my surfing game forever. It's like the board reads the waves for you—pure magic!",
              user: UserModel(
                image: "https://i.ibb.co/M5PXvLP/e.png",
                name: "SandyTides87",
              ))
        ],
        postImages: [
          'https://i.ibb.co/b7YjzWK/2.png',
          'https://i.ibb.co/5FSwVCT/1.png',
          'https://i.ibb.co/Pmq5Gsy/8.png'
        ],
        reactionCount: 520)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor1,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height +
            40.h), // Set your desired height here
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: AppStyles.screenHorizontalPadding,
          ),
          decoration: AppStyles.appBarStyle,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  Expanded(
                      child: Text(
                    "Community",
                    style: context.textStyle.displayMedium!
                        .copyWith(fontSize: 18.sp),
                  )),
                  CustomBadgeWidget(
                      showBadge: true,
                      count: 1,
                      child: CustomMenuIconShape(
                          icon: Assets.messageicon,
                          onTap: () {
                            AppRouter.push(ChattingListView());
                          }))
                ],
              ),
              10.ph,
            ],
          ),
        ),
      ),
      body: ScrollConfiguration(
          behavior: MyBehavior(),
          child: ListView(
            children: [
              Container(
                height: 55.h,
                margin: EdgeInsets.only(
                    left: AppStyles.screenHorizontalPadding,
                    right: AppStyles.screenHorizontalPadding,
                    top: AppStyles.screenHorizontalPadding,
                    bottom: AppStyles.screenHorizontalPadding + 10),
                padding: EdgeInsets.symmetric(horizontal: 15.r),
                decoration: BoxDecoration(
                    color: const Color(0xffF6F6F6),
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(
                      color: const Color.fromRGBO(0, 0, 0, 0.05),
                      width: 1,
                    )),
                child: Row(
                  children: [
                    UserProfileWidget(radius: 18.r, imageUrl: Assets.userImage),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 10.r),
                            hintText: "What’s on your mind?",
                            hintStyle: context.textStyle.bodyMedium!.copyWith(
                                color: context.colors.onSurface
                                    .withOpacity( 0.7))),
                        controller: postTextEditController,
                      ),
                    ),
                    GestureDetector(
                      child: SvgPicture.asset(
                        Assets.chatGalleryIcon,
                        width: 20.r,
                        height: 20.r,
                      ),
                    )
                  ],
                ),
              ),
              ...List.generate(
                posts.length,
                (index) => PostWidget(
                  isUserShow: true,
                  data: posts[index],
                ),
              )
            ],
          )),
    );
  }
}

// ignore: must_be_immutable
class PostWidget extends StatelessWidget {
  final bool? isUserShow;
  final PostDataModel data;
  PostWidget({super.key, this.isUserShow = false, required this.data});
  List<String> emojis = [
    Assets.heartEmoji,
    Assets.sadEmoji,
    Assets.smileEmoji,
    Assets.pointingFingerEmoji
  ];
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppRouter.push(CommentView(data: data));
      },
      child: Container(
        // height: 281.h,
        padding: EdgeInsets.symmetric(
            horizontal: AppStyles.screenHorizontalPadding, vertical: 17.r),
        margin: EdgeInsets.only(bottom: 10.r),
        color: AppColors.scaffoldColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (isUserShow!)
              Row(
                children: [
                  UserProfileWidget(radius: 25.r, imageUrl: data.user!.image!),
                  10.pw,
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.user!.name!,
                        style: context.textStyle.labelMedium!
                            .copyWith(height: 0.9),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            data.user!.status!,
                            style: context.textStyle.bodySmall!
                                .copyWith(color: AppColors.primaryColor),
                          ),
                          Text(
                            " • ",
                            style: context.textStyle.bodyMedium!
                                .copyWith(fontSize: 16.sp),
                          ),
                          SvgPicture.asset(
                            Assets.worldIcon,
                            width: 12.r,
                          )
                        ],
                      )
                    ],
                  )),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.more_horiz_outlined),
                    padding: EdgeInsets.zero,
                    visualDensity: const VisualDensity(horizontal: -4.0),
                  )
                ],
              ),
            TextWithSeeMore(
              maxLength: 200,
              text: data.postText!,
            ),
            Row(
              children: [
                Transform.rotate(
                    angle: -10.2,
                    child: Icon(
                      Icons.link,
                      size: 15.r,
                      color: AppColors.primaryColor,
                    )),
                Expanded(
                    child: Text(
                  data.attachmentLink!,
                  style: context.textStyle.displayMedium!.copyWith(
                      color: AppColors.primaryColor,
                      decoration: TextDecoration.underline),
                ))
              ],
            ),
            Wrap(
              direction: Axis.horizontal,
              alignment: WrapAlignment.spaceBetween,
              runSpacing: 8.r,
              spacing: 8.r,
              children: List.generate(
                data.postImages!.length,
                (index) => ClipRRect(
                  borderRadius: BorderRadius.circular(6.r),
                  child: DisplayNetworkImage(
                    imageUrl: data.postImages![index],
                    height: 62.r,
                    width: 73.r,
                  ),
                ),
              ),
            ),
            5.ph,
            const Divider(),
            Row(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    ReactionIconWidget(
                      emoji: emojis[0],
                    ),
                    Positioned(
                      right: -13,
                      child: ReactionIconWidget(
                        emoji: emojis[2],
                      ),
                    ),
                    Positioned(
                      right: -28,
                      child: ReactionIconWidget(
                        emoji: emojis[1],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    35.pw,
                    Text(
                      data.reactionCount.toString(),
                      style: context.textStyle.labelSmall!
                          .copyWith(letterSpacing: 0.3),
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      Assets.likeIcon,
                      width: 20.r,
                      // height: 18.r,
                    ),
                    5.pw,
                    Text(
                      'Like',
                      style: context.textStyle.labelSmall!
                          .copyWith(letterSpacing: 0.3),
                    )
                  ],
                ),
                10.pw,
                GestureDetector(
                  onTap: () {
                    AppRouter.push(CommentView(
                      data: data,
                    ));
                  },
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        Assets.commentIcon,
                        width: 20.r,
                        // height: 18.r,
                      ),
                      5.pw,
                      Text(data.comments!.length.toString(),
                          style: context.textStyle.labelSmall!
                              .copyWith(letterSpacing: 0.3))
                    ],
                  ),
                ),
                IconButton(
                    visualDensity:
                        const VisualDensity(horizontal: -4.0, vertical: -4.0),
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      Assets.uploadIcon,
                      width: 20.r,
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ReactionIconWidget extends StatelessWidget {
  final String emoji;
  final double? radius;
  const ReactionIconWidget({super.key, required this.emoji, this.radius});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius ?? 22.r,
      height: radius ?? 22.r,
      padding: EdgeInsets.all(2.r),
      decoration: const BoxDecoration(
          color: AppColors.reactionIconColor, shape: BoxShape.circle),
      child: emoji != "" ? SvgPicture.asset(emoji) : null,
    );
  }
}
