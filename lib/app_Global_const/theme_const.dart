import 'package:flutter/material.dart';
import 'package:uni_player_2/app_Global_const/const.dart';

class AppTheme {
  static theme() {
    return ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: ConstColor.backgroundcolor,
        iconTheme: const IconThemeData(color: ConstColor.buttoncolor));
  }
}
