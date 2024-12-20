import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tcm/utils/app_extensions.dart';


class CustomSearchBarWidget extends StatefulWidget {
  final TextEditingController controller;
  final void Function(String)? onChanged;
  const CustomSearchBarWidget(
      {super.key, required this.controller, this.onChanged});

  @override
  State<CustomSearchBarWidget> createState() => _CustomSearchBarWidgetState();
}

class _CustomSearchBarWidgetState extends State<CustomSearchBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.h,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8.r)),
      child: SearchBar(
        onTapOutside: (e) {
          FocusScope.of(context).unfocus();
        },
        elevation: const WidgetStatePropertyAll(0.0),
        hintText: 'Search anything...',
        onChanged: widget.onChanged,
        controller: widget.controller,
        leading: Icon(
          Icons.search,
          color: const Color(0xff8C8C8C),
          size: 28.r,
        ),
        padding: WidgetStatePropertyAll(
            EdgeInsets.only(left: 10.r, right: 10.r, bottom: 5.r, top: 4.r)),
        textStyle: WidgetStatePropertyAll(
            context.textStyle.titleMedium!.copyWith(color: Colors.black)),
        hintStyle: WidgetStatePropertyAll(context.textStyle.titleMedium!
            .copyWith(color: const Color(0xFF8C8C8C))),
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