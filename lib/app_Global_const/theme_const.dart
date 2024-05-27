import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static theme() {
    return ThemeData(
        useMaterial3: true,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        textTheme: const TextTheme(titleLarge: TextStyle(color: Colors.white)),
        fontFamily: GoogleFonts.aboreto().fontFamily);
  }
}
