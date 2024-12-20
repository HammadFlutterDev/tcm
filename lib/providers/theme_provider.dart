
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';


import '../services/shared_preferences.dart';
import '../utils/app_theme.dart';



class ThemeNotifier extends StateNotifier<ThemeData> {
  ThemeNotifier() : super(SharedPreferenceManager.sharedInstance.isDarkTheme() ? AppTheme.darkTheme :  AppTheme.lightTheme); // Set default theme to darkTheme

  void toggleTheme() {
    state = state.brightness == Brightness.dark ? AppTheme.lightTheme : AppTheme.darkTheme;
  }
  // void themeSetLight() {
  //   state = lightTheme;
  // }
}

final themeProvider = StateNotifierProvider.autoDispose<ThemeNotifier, ThemeData>((ref) {
  return ThemeNotifier();
});


