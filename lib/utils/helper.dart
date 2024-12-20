import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:skeletonizer/skeletonizer.dart';

// import '../config/app_colors.dart';

class Helper {
  
  // static String customDateFormatter(DateTime? date, BuildContext context) {
  //   return  DateFormat('dd MMM yyyy', context.locale.languageCode).format(date ?? DateTime.now());
  // }

  // static showMessage(String? text){
  //   if(text != null && text != ""){

  //   Fluttertoast.showToast(
  //       msg: text,
  //       toastLength: Toast.LENGTH_SHORT,
  //       gravity: ToastGravity.BOTTOM,
  //       timeInSecForIosWeb: 1,
  //       backgroundColor: AppColors.primaryColor,
  //       textColor: Colors.white,
  //       fontSize: 16.0
  //   );
  //   }
  // }
  static showDisplayImage(double height, Widget? child){
     Skeleton.ignore(
      // baseColor: Colors.grey, highlightColor: Colors.blueGrey, 
     child: Container(
      height: height,
     ));
  }  
  static List errorHandler(String val) {
    List<String> results = [];
    List<String> resultConcator = [];
    String output;

    val.toString().substring(0, 2);
    results.add(val.toString().substring(0, 3));

    Map<String, dynamic> errors =
        json.decode(val.toString().substring(3, val.toString().length))['data'];

    if (errors.values.length > 1) {
      for (var value in errors['errors'].values) {
        resultConcator.add(value[0]);
      }
      resultConcator.join();

      output = resultConcator.join('\n');

      results.add(output);
    } else {
      results.add(errors['error']);
    }

    return results;
  }

  static List genericErrorHandler(String val) {
    if (val.contains("TimeoutException")) {
      return [408, "Request Timeout"];
    }
    List<String> results = [];

    results.add(val.toString().substring(0, 3));
    if (results[0] == "500") {
      results.add("Something went wrong. Please try again later.");
      return results;
    }
    Map<String, dynamic> errors =
        json.decode(val.toString().substring(3, val.toString().length));
    if (errors.containsKey('data')) {
      if (errors['data'].containsKey('error')) {
        results.add(errors['data']['error']);
      }
      if (errors['data'].containsKey('message')) {
        results.add(errors['data']['message']);
      }
    } else {
      if (errors.containsKey('error')) {
        results.add(errors['error']);
      }
      if (errors.containsKey('message')) {
        results.add(errors['message']);
      }
    }

    return results;
  }
}
