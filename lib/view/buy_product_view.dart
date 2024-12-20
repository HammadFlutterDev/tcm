import 'package:flutter/material.dart';

import 'package:tcm/widgets/buy_sell_screen_template_widget.dart';
import 'package:tcm/widgets/common_screen_template_widget.dart';

class BuyProductView extends StatelessWidget {
  const BuyProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonScreenTemplateWidget(title: "Buy Your Desired Products", child: BuySellScreenTemplateWidget(title: "All Categories", childrens: []));
  }
}