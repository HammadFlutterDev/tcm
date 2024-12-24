import 'package:flutter/material.dart';
import 'package:tcm/config/app_colors.dart';
import 'package:tcm/utils/app_extensions.dart';

class TextWithSeeMore extends StatefulWidget {
  final String text;
  final int maxLength;

  const TextWithSeeMore(
      {super.key, required this.text, required this.maxLength});

  @override
  _TextWithSeeMoreState createState() => _TextWithSeeMoreState();
}

class _TextWithSeeMoreState extends State<TextWithSeeMore> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    String displayText = widget.text;
    String? buttonText;

    // If the text is longer than the max length and not expanded, truncate it
    if (displayText.length > widget.maxLength && !_isExpanded) {
      displayText = '${displayText.substring(0, widget.maxLength)}...';
      buttonText = 'See more...';
    } else {
      buttonText = 'See less...';
    }

    return Wrap(
      children: [
        Text(
          displayText,
          style: context.textStyle.bodyMedium,
        ),
        // if (buttonText != null)
        GestureDetector(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded; // Toggle the expanded state
            });
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              buttonText,
              style: context.textStyle.displayMedium!
                  .copyWith(color: AppColors.primaryColor),
            ),
          ),
        ),
      ],
    );
  }
}
