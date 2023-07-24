import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFonts {
  AppFonts._();

  static TextStyle robotoBold(double fontSize, [Color color = Colors.black]) {
    return GoogleFonts.roboto(
      fontSize: fontSize,
      color: color,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle robotoMedium(double fontSize, [Color color = Colors.black]) {
    return GoogleFonts.roboto(
      fontSize: fontSize,
      color: color,
      fontWeight: FontWeight.w400,
    );
  }
}
