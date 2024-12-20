import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tcm/utils/app_extensions.dart';


class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final int? maxLines;
  final Widget? suffixIcon;
  final bool? readOnly;
  final String? Function(String?)? validator;
  final double? borderRadius;
  final EdgeInsetsGeometry? contentPadding;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  const CustomTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      this.validator,
      this.maxLines,
      this.suffixIcon,
      this.borderRadius,
      this.contentPadding,
      this.keyboardType,
      this.inputFormatters,
      this.readOnly});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: context.colors.primaryContainer,
          borderRadius: BorderRadius.circular(borderRadius ?? 8.r),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(
                  0, 0, 0, 0.20), // rgba(0, 0, 0, 0.20) equivalent
              offset: Offset(0, 0), // 0px horizontal and vertical offset
              blurRadius: 2, // 2px blur radius
              spreadRadius: 0, // 0px spread radius
            ),
          ]),
      child: TextFormField(
        controller: controller,
        maxLines: maxLines ?? 1,
        cursorColor: context.colors.secondary,
        style: context.textStyle.bodyMedium!.copyWith(fontSize: 16.sp),
        validator: validator,
        readOnly: readOnly ?? false,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
            contentPadding: contentPadding ??
                EdgeInsets.symmetric(vertical: 16.r, horizontal: 10.r),
            hintText: hintText,
            focusedBorder: context.inputTheme.focusedBorder,
            enabledBorder: context.inputTheme.enabledBorder,
            border: context.inputTheme.border,
            suffixIcon: suffixIcon),
      ),
    );
  }
}
