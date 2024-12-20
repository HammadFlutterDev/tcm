import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tcm/config/app_styles.dart';
import 'package:tcm/utils/app_extensions.dart';
import 'package:tcm/widgets/display_network_image.dart';

import '../models/category_data_model.dart';

class CategoriesWidget extends StatelessWidget {
  final bool ?isShowTitle;
  final List<CategoryDataModel> items;
  const CategoriesWidget({super.key, required this.items, this.isShowTitle = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.symmetric(horizontal: AppStyles.screenHorizontalPadding),
      width: double.infinity,
      height: 100.h,
      child: isShowTitle!? Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: Text(
                "Categories",
                style:
                    context.textStyle.displayMedium!.copyWith(fontSize: 18.sp),
              ))
            ],
          ),
          Expanded(
            child: ListView.separated(
              itemCount: items.length,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => 4.pw,
              itemBuilder: (context, index) => Row(
                children: [
                  Container(
                    height: 41.h,
                    decoration: BoxDecoration(
                        color: context.colors.onInverseSurface,
                        borderRadius: BorderRadius.circular(5000.r)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5000.r),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Positioned(
                            left: -4,
                            bottom: -2,
                            child: ClipRRect(
                              clipBehavior: Clip.none,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(500.r)),
                              child: DisplayNetworkImage(
                                imageUrl: items[index].imageUrl,
                                width: 70.r,
                                height: 40.r,
                              ),
                            ),
                          ),
                          Row(
                            children: [65.pw, Text(items[index].title), 10.pw],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ) : ListView.separated(
              itemCount: items.length,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => 4.pw,
              itemBuilder: (context, index) => Row(
                children: [
                  Container(
                    height: 41.h,
                    decoration: BoxDecoration(
                        color: context.colors.onInverseSurface,
                        borderRadius: BorderRadius.circular(5000.r)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5000.r),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Positioned(
                            left: -4,
                            bottom: -2,
                            child: ClipRRect(
                              clipBehavior: Clip.none,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(500.r)),
                              child: DisplayNetworkImage(
                                imageUrl: items[index].imageUrl,
                                width: 70.r,
                                height: 40.r,
                              ),
                            ),
                          ),
                          Row(
                            children: [65.pw, Text(items[index].title), 10.pw],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
    ));
  }
}
