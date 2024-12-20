import 'package:flutter/material.dart';
import 'package:tcm/utils/app_extensions.dart';


class CustomLoadingWidget extends StatelessWidget {
  const CustomLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
   
    return Center(
      child: CircularProgressIndicator.adaptive(
        valueColor: AlwaysStoppedAnimation(context.colors.primary),
      ),
    );
  }
}