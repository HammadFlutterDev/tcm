import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tcm/utils/app_extensions.dart';

class CustomDropDown extends StatefulWidget {
  final List<String> items;
  final String label;
  final VoidCallback onTap;
  const CustomDropDown(
      {super.key,
      required this.items,
      required this.label,
      required this.onTap});

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        margin: EdgeInsets.only(right: 10.r),
        padding: EdgeInsets.symmetric(horizontal: 10.r, vertical: 8.r),
        decoration: BoxDecoration(
            color: context
                .colors.primaryContainer, // Background color of the container
            borderRadius:
                BorderRadius.circular(8.r), // Adjust border radius as needed
            boxShadow: [
              BoxShadow(
                color: Colors
                    .grey.shade300, // Adjust shadow color to suit your design
                offset: const Offset(0,
                    1), // Vertical offset to make the shadow look like a line
                blurRadius: 1.0, // Blur radius to soften the shadow
                spreadRadius:
                    0.3, // Spread radius to control the size of the shadow
              )
            ]),
        child: Row(
          children: [
            Text(
              widget.label,
              style: context.textStyle.bodyMedium,
            ),
            Icon(
              Icons.keyboard_arrow_down_sharp,
              size: 20.r,
            )
          ],
        ),
      ),
    );
  }
}

class DropDownDialog extends StatelessWidget {
  const DropDownDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0), // Rounded corners
      ),
      child: Container(
        height: 200.h, // Responsive height
        width: double.infinity,
        color: Colors.red, // Background color
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'This is a dropdown dialog',
              style:
                  context.textStyle.bodyMedium!.copyWith(color: Colors.white),
              textAlign: TextAlign.center,
            ),
            // Add more widgets as needed
          ],
        ),
      ),
    );
  }
}
