import 'package:flutter/material.dart';

import 'package:tcm/utils/app_extensions.dart';

class ReadMoreWidget extends StatefulWidget {
  const ReadMoreWidget({super.key, required this.items});

  final List<String> items;

  @override
  State<ReadMoreWidget> createState() => _ReadMoreWidget();
}

class _ReadMoreWidget extends State<ReadMoreWidget> {
  late List<String> displayedItems;
  late bool showMore;

  @override
  void initState() {
    super.initState();
    // Initialize with the first two sentences
    displayedItems = widget.items.take(2).toList();
    showMore = widget.items.length > 2;
    // Check if more items are available
  }

  @override
  void didChangeDependencies() {
    toggleShowMore();
    super.didChangeDependencies();
  }

  void toggleShowMore() {
    setState(() {
      if (showMore) {
        displayedItems =
            widget.items.take(2).toList(); // Collapse to the first 2 items
      } else {
        displayedItems = widget.items; // Show all items
      }
      showMore = !showMore; // Toggle the showMore state
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...List.generate(
          displayedItems.length,
          (index) => Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "•",
                style: context.textStyle.bodyMedium!,
              ),
              10.pw,
              Expanded(
                child: Text(
                  displayedItems[index],
                  style: context.textStyle.bodyMedium!,
                  // overflow: TextOverflow.ellipsis, // Add ellipsis if text overflows
                ),
              ),
            ],
          ),
        ),
        if (!showMore && widget.items.length > 2) ...[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                " •",
                style: context.textStyle.bodyMedium!
                    .copyWith(color: const Color(0xff727272)),
              ),
              10.pw,
              Expanded(
                child: Text(
                  "${widget.items[2]}...", // Add ellipsis to indicate more content
                  style: context.textStyle.bodyMedium!
                      .copyWith(color: const Color(0xff727272)),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }
}
