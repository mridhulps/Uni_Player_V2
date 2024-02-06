import 'package:flutter/material.dart';
import 'package:uni_player_2/app_Global_const/const.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static theme() {
    return ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: ConstColor.backgroundcolor,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        textTheme: const TextTheme(titleLarge: TextStyle(color: Colors.white)),
        fontFamily: GoogleFonts.roboto().fontFamily);
  }
}
