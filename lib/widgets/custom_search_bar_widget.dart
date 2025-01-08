import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tcm/utils/app_extensions.dart';

import '../config/app_colors.dart';
import '../config/asset_path.dart';

class CustomSearchBarWidget extends StatefulWidget {
  final TextEditingController? controller;
  final String hintText;
  final String? value;
  final VoidCallback? onTap;
  final void Function(PointerDownEvent)? onTapOutside;
  final void Function(String)? onChanged;
  const CustomSearchBarWidget(
      {super.key,
      this.controller,
      this.onChanged,
      this.value,
      this.onTap,
      this.onTapOutside,
      required this.hintText});

  @override
  State<CustomSearchBarWidget> createState() => _CustomSearchBarWidgetState();
}

class _CustomSearchBarWidgetState extends State<CustomSearchBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.h,
      // padding: EdgeInsets.symmetric(horizontal: 18.r),
      decoration: BoxDecoration(
          color: AppColors.secondaryColor1,
          border: Border.all(color: AppColors.borderColor),
          borderRadius: BorderRadius.horizontal(
              left: Radius.circular(500.r), right: Radius.circular(500.r))),
      child:
          // Row(
          //   children: [
          //     SvgPicture.asset(
          //       Assets.searchIcon,
          //       colorFilter: ColorFilter.mode(
          //           Colors.black.withValues(alpha: 0.6), BlendMode.srcIn),
          //     ),
          //     10.pw,
          //     Text(
          //      widget.value ?? widget.hintText,
          //       style: context.textStyle.titleMedium!
          //           .copyWith(color: widget.value == null ? Colors.black.withValues(alpha: 0.6): Colors.black),
          //     )
          //   ],
          // )
          SearchBar(
        onTapOutside: widget.onTapOutside ?? (e) {
          FocusScope.of(context).unfocus();
         
          
        },
        elevation: const WidgetStatePropertyAll(0.0),
        onTap: widget.onTap,
        hintText: widget.hintText,
        onChanged: widget.onChanged,
        controller: widget.controller,
        leading: SvgPicture.asset(
          Assets.searchIcon,
          colorFilter: ColorFilter.mode(
              Colors.black.withValues(alpha: 0.6), BlendMode.srcIn),
        ),
        padding: WidgetStatePropertyAll(
            EdgeInsets.only(left: 17.r, right: 17.r, bottom: 5.r, top: 5.r)),
        textStyle: WidgetStatePropertyAll(
            context.textStyle.titleMedium!.copyWith(color: Colors.black)),
        hintStyle: WidgetStatePropertyAll(context.textStyle.titleMedium!
            .copyWith(color: Colors.black.withValues(alpha: 0.6))),
        backgroundColor: const WidgetStatePropertyAll(Colors.transparent),
      ),
    );
  }
}
// (v) {
//             ref.read(productRepoProvider).getSearchProducts(v);
//             if (v != "") {
//               AppRouter.push(const MoreProductView(
//                 callFun: null,
//                 loadMoreFun: null,
//                 showSortOpt: false,
//                 showCategory: false,
//                 showAppBar: true,
//               ));
//             }
//           }
