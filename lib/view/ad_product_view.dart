import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:tcm/config/app_colors.dart';
import 'package:tcm/config/app_styles.dart';
import 'package:tcm/config/asset_path.dart';
import 'package:tcm/models/category_data_model.dart';
import 'package:tcm/providers/bottom_index_provider.dart';
import 'package:tcm/utils/app_extensions.dart';
import 'package:tcm/utils/app_router.dart';
import 'package:tcm/view/product_ad_live_now_view.dart';

import 'package:tcm/widgets/buy_sell_screen_template_widget.dart';
import 'package:tcm/widgets/common_screen_template_widget.dart';
import 'package:tcm/widgets/custom_back_button_widget.dart';
import 'package:tcm/widgets/custom_button_widget.dart';
import '../widgets/display_network_image.dart';

class AdProductView extends StatefulWidget {
  final CategoryDataModel category;
  final String subCategoryTitle;
  const AdProductView(
      {super.key, required this.category, required this.subCategoryTitle});

  @override
  State<AdProductView> createState() => _AdProductViewState();
}

class _AdProductViewState extends State<AdProductView> {
  int quantity = 0;
  bool isNew = false;
  bool isUsed = false;
  DateTime checkInDate = DateTime.now();
  DateTime checkOutDate = DateTime.now();
  TimeOfDay checkInTime = TimeOfDay.now();
  TimeOfDay checkOutTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return CommonScreenTemplateWidget(
      title: "Ad Detail",
      leadingWidget: const CustomBackButtonWidget(),
      child: BuySellScreenTemplateWidget(title: "Category", childrens: [
        CategoryTitleWidget(widget: widget),
        10.ph,
        UploadProductImagesWidget(
          onTap: () {},
        ),
        20.ph,
        const TitleHeadingWidget(
          title: "Condition",
        ),
        12.ph,
        Row(
          children: [
            SelectChip(
              isCheck: isNew,
              title: "New",
              onTap: () {
                isNew = true;
                isUsed = false;
                setState(() {});
              },
            ),
            5.pw,
            SelectChip(
              isCheck: isUsed,
              title: "Used",
              onTap: () {
                isNew = false;
                isUsed = true;
                setState(() {});
              },
            ),
          ],
        ),
        20.ph,
        const TitleHeadingWidget(
          title: "Unit",
        ),
        12.ph,
        Row(
          children: [
            Container(
              height: 30.h,
              padding: EdgeInsets.all(1.r),
              decoration: BoxDecoration(
                  color: const Color(0xffEFEDEC),
                  borderRadius: BorderRadius.circular(421.r)),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      if (quantity > 0) {
                        quantity--;
                        setState(() {});
                      }
                    },
                    child: Container(
                      height: 30.r,
                      width: 30.r,
                      padding: EdgeInsets.all(3.r),
                      decoration: const BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: SvgPicture.asset(
                        Assets.minusIcon,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18.r),
                    child: Text("$quantity"),
                  ),
                  GestureDetector(
                    onTap: () {
                      quantity++;
                      setState(() {});
                    },
                    child: Container(
                      height: 30.r,
                      width: 30.r,
                      padding: EdgeInsets.all(3.r),
                      decoration: const BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: SvgPicture.asset(
                        Assets.plusIcon,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        20.ph,
        Row(
          children: [
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TitleHeadingWidget(
                  title: "Check-In",
                ),
                12.ph,
                CheckInOutDateTimeWidget(
                  date: setDateText(checkInDate),
                  time: setTimeText(checkInDate, checkInTime),
                  selectDate: () {
                    showDatePicker(
                      context: context,
                      initialDate: checkInDate,
                      firstDate: DateTime(2000),
                      lastDate: DateTime.now(),
                      builder: (BuildContext context, Widget? child) {
                        return Theme(
                          data: AppStyles.datePickerTheme,
                          child: child ?? Container(),
                        );
                      },
                    ).then((date) {
                      if (date != null) {
                        checkInDate = date;
                        setState(() {});
                      }
                    });
                  },
                  selectTime: () {
                    showTimePicker(
                      context: context,
                      initialTime: checkInTime,
                      builder: (context, child) =>
                          Theme(data: AppStyles.datePickerTheme, child: child!),
                    ).then((time) {
                      if (time != null) {
                        checkInTime = time;
                        setState(() {});
                      }
                    });
                  },
                ),
              ],
            )),
            19.pw,
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TitleHeadingWidget(
                  title: "Check-Out",
                ),
                12.ph,
                CheckInOutDateTimeWidget(
                  date: setDateText(checkOutDate),
                  time: setTimeText(checkOutDate, checkOutTime),
                  selectDate: () {
                    showDatePicker(
                      context: context,
                      initialDate: checkInDate, // Start with today's date
                      firstDate: DateTime.now(), // Prevent selecting past dates
                      lastDate: DateTime(2101),
                      builder: (BuildContext context, Widget? child) {
                        return Theme(
                          data: AppStyles.datePickerTheme,
                          child: child ?? Container(),
                        );
                      },
                    ).then((date) {
                      if (date != null) {
                        checkOutDate = date;
                        setState(() {});
                      }
                    });
                  },
                  selectTime: () {
                    showTimePicker(
                      context: context,
                      initialTime: checkOutTime,
                      builder: (context, child) =>
                          Theme(data: AppStyles.datePickerTheme, child: child!),
                    ).then((time) {
                      if (time != null) {
                        checkOutTime = time;
                        setState(() {});
                      }
                    });
                  },
                ),
              ],
            )),
          ],
        ),
        20.ph,
        const TitleHeadingWidget(
          title: "Buying Recipt",
        ),
        12.ph,
        GestureDetector(
          child: Container(
            height: 50.h,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 14.r),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(
                  color: AppColors.borderColor,
                )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Upload Purchasing Receipt",
                  style: context.textStyle.bodyMedium!
                      .copyWith(color: Colors.black.withOpacity(0.5)),
                ),
                SvgPicture.asset(
                  Assets.addDocumentIcon,
                  width: 20.r,
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.5), BlendMode.srcIn),
                )
              ],
            ),
          ),
        ),
        20.ph,
        const Divider(),
        20.ph,
        const TitleHeadingWidget(
          title: "Ad Title",
        ),
        12.ph,
        const CustomTextFieldWidget(
          hintText: "Enter title",
        ),
        20.ph,
        const TitleHeadingWidget(
          title: "Description",
        ),
        12.ph,
        const CustomTextFieldWidget(
          hintText: "Describe the item you are selling",
          maxline: 4,
        ),
        20.ph,
        const TitleHeadingWidget(
          title: "Select Location",
        ),
        12.ph,
        const LocationWidget(),
        20.ph,
        const Divider(),
        20.ph,
        const TitleHeadingWidget(
          title: "Price",
        ),
        12.ph,
        const CustomTextFieldWidget(
          hintText: "Enter Price",
        ),
        50.ph,
        Consumer(builder: (context, ref, child) {
          return CustomButtonWidget(
              title: "Next",
              onPressed: () {
                AppRouter.back();
                AppRouter.back();
                AppRouter.back();
                AppRouter.back();
                ref.read(bottomIndexProvider.notifier).setIndex(0);
                // AppRouter.push(const AdPreviewView());
                AppRouter.push(const ProductAdLiveNowView());
              });
        }),
        20.ph
      ]),
    );
  }
}

class CustomTextFieldWidget extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final int? maxline;
  const CustomTextFieldWidget(
      {super.key, this.hintText, this.controller, this.maxline});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxline,
      decoration: InputDecoration(
          // maintainHintHeight: true,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(color: AppColors.borderColor)),
          // isCollapsed: true,
          isDense: true,
          contentPadding:
              EdgeInsets.symmetric(vertical: 12.r, horizontal: 14.r),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(color: AppColors.borderColor)),
          hintText: hintText,
          hintStyle: context.inputTheme.hintStyle!
              .copyWith(color: Colors.black.withOpacity(0.5))),
    );
  }
}

class LocationWidget extends StatelessWidget {
  const LocationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 118.h,
          decoration: BoxDecoration(
              image: const DecorationImage(
                  image: NetworkImage(
                      "https://storage.googleapis.com/support-forums-api/attachment/thread-6243036-16169345230575017474.jpg"),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(10.r)),
        ),
        Container(
          height: 118.h,
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10.r)),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 32.h,
                width: 112.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(500.r)),
                child: Text(
                  "Location",
                  style: context.textStyle.displayMedium!.copyWith(
                      fontWeight: FontWeight.w500, color: Colors.white),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}

class CheckInOutDateTimeWidget extends StatelessWidget {
  final VoidCallback selectDate;
  final VoidCallback selectTime;
  final String date;
  final String time;

  const CheckInOutDateTimeWidget(
      {super.key,
      required this.date,
      required this.time,
      required this.selectDate,
      required this.selectTime});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.r, vertical: 8.r),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
            color: AppColors.borderColor,
          )),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Date:",
                style: context.textStyle.bodyMedium,
              ),
              GestureDetector(
                onTap: selectDate,
                child: Container(
                  height: 29.h,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 6.r),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(500.r),
                      color: const Color(0xffEAF8FF),
                      border: Border.all(
                        color: AppColors.borderColor,
                      )),
                  child: Text(
                    date,
                    style: context.textStyle.displayMedium,
                  ),
                ),
              )
            ],
          ),
          4.ph,
          const Divider(),
          4.ph,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Time:",
                style: context.textStyle.bodyMedium,
              ),
              GestureDetector(
                onTap: selectTime,
                child: Container(
                  height: 29.h,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 6.r),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(500.r),
                      color: const Color(0xffEAF8FF),
                      border: Border.all(
                        color: AppColors.borderColor,
                      )),
                  child: Text(
                    time,
                    style: context.textStyle.displayMedium,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class SelectChip extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const SelectChip(
      {super.key,
      required this.isCheck,
      required this.title,
      required this.onTap});

  final bool isCheck;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 29.h,
        padding: EdgeInsets.only(left: 10.r, right: 10.r, top: 3.r),
        decoration: BoxDecoration(
            color: !isCheck ? AppColors.secondaryColor1 : null,
            gradient: isCheck ? AppColors.primaryGradinet : null,
            borderRadius: BorderRadius.circular(500.r),
            border: !isCheck ? Border.all(color: AppColors.borderColor) : null),
        child: Text(
          title,
          style: context.textStyle.bodySmall!
              .copyWith(color: isCheck ? Colors.white : null),
        ),
      ),
    );
  }
}

class TitleHeadingWidget extends StatelessWidget {
  final String title;
  const TitleHeadingWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: context.textStyle.displayMedium!.copyWith(fontSize: 18.sp),
    );
  }
}

class UploadProductImagesWidget extends StatelessWidget {
  final VoidCallback onTap;
  const UploadProductImagesWidget({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 169.h,
      padding: EdgeInsets.symmetric(vertical: 15.r),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: AppColors.borderColor)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(Assets.uploadGalleryImageIcon),
          Container(
            width: 125.w,
            height: 36.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(500.r),
                color: AppColors.secondaryColor1,
                border: Border.all(color: AppColors.borderColor)),
            child: Text(
              "Add Images",
              style: context.textStyle.bodySmall,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 90.r),
            child: Text(
              "5MB maximum file size accepted in the following formats .jpg .jpeg png .gif",
              textAlign: TextAlign.center,
              style: context.textStyle.bodySmall!.copyWith(
                color: Colors.black.withOpacity(0.8),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CategoryTitleWidget extends StatelessWidget {
  const CategoryTitleWidget({
    super.key,
    required this.widget,
  });

  final AdProductView widget;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      visualDensity: const VisualDensity(horizontal: -4.0),
      horizontalTitleGap: 15.r,
      leading: Container(
        height: 62.r,
        width: 62.r,
        decoration: BoxDecoration(
            color: context.colors.onInverseSurface,
            borderRadius: BorderRadius.circular(5000.r)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5000.r),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                left: -20,
                bottom: -1,
                child: ClipRRect(
                  clipBehavior: Clip.none,
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(500.r)),
                  child: DisplayNetworkImage(
                    imageUrl: widget.category.imageUrl,
                    width: 70.r,
                    height: 40.r,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      title: Text(
        widget.subCategoryTitle,
        style: context.textStyle.bodyMedium!
            .copyWith(fontSize: 16.sp, fontWeight: FontWeight.w500),
      ),
      subtitle: Text(
        widget.subCategoryTitle,
        style: context.textStyle.bodyMedium,
      ),
    );
  }
}

setDateText(DateTime date) {
  return DateFormat("d MMM yyyy").format(date).toLowerCase();
}

setTimeText(DateTime date, TimeOfDay time) {
  DateTime dateTime =
      DateTime(date.year, date.month, date.day, time.hour, time.minute);
  return DateFormat("h:mm a").format(dateTime);
}
