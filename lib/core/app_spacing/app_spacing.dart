import 'package:flutter/material.dart';


abstract final class AppSpacing {
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 12;
  static const double lg = 16;
  static const double xl = 20;
  static const double xxl = 24;
  static const double xxxl = 32;

  static const EdgeInsets screenH = EdgeInsets.symmetric(horizontal: xl);
  static const EdgeInsets card = EdgeInsets.all(lg);
}

/// Corner radii.
abstract final class AppRadius {
  static const double sm = 10;
  static const double md = 16;
  static const double lg = 22;
  static const double xl = 28;
  static const double pill = 100;

  static BorderRadius get card => BorderRadius.circular(xl);
  static BorderRadius get button => BorderRadius.circular(pill);
  static BorderRadius get chip => BorderRadius.circular(pill);
}
