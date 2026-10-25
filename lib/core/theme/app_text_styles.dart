import 'package:depi_final_project/core/app_color/app_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



abstract final class AppTextStyles {
  static TextStyle _base({
    required double size,
    FontWeight weight = FontWeight.w500,
    Color color = AppColor.textPrimary,
    double? height,
    double? letterSpacing,
  }) =>
      GoogleFonts.plusJakartaSans(
        fontSize: size,
        fontWeight: weight,
        color: color,
        height: height,
        letterSpacing: letterSpacing,
      );

  static TextStyle get display =>
      _base(size: 30, weight: FontWeight.w800, letterSpacing: -0.6);
  static TextStyle get h1 =>
      _base(size: 26, weight: FontWeight.w800, letterSpacing: -0.5);
  static TextStyle get h2 =>
      _base(size: 20, weight: FontWeight.w700, letterSpacing: -0.2);
  static TextStyle get title => _base(size: 16, weight: FontWeight.w700);
  static TextStyle get body => _base(size: 15, height: 1.4);
  static TextStyle get bodyMuted =>
      _base(size: 14, color: AppColor.textSecondary);
  static TextStyle get caption =>
      _base(size: 12.5, color: AppColor.textSecondary);
  static TextStyle get overline => _base(
        size: 12,
        weight: FontWeight.w700,
        color: AppColor.textSecondary,
        letterSpacing: 1.1,
      );
  static TextStyle get button => _base(
        size: 16,
        weight: FontWeight.w700,
        color: AppColor.textOnDark,
      );
  static TextStyle get label => _base(size: 12, weight: FontWeight.w700);
}
