import 'package:depi_final_project/core/app_color/app_color.dart';
import 'package:flutter/material.dart';



enum CefrLevel { a1, a2, b1, b2 }

extension CefrLevelX on CefrLevel {
  String get label => name.toUpperCase();
}

class Scenario {
  const Scenario({
    required this.title,
    required this.city,
    required this.minutes,
    required this.level,
    required this.icon,
    required this.iconBg,
    required this.iconColor,
    this.progress,
    this.xp = 40,
    this.category = 'Food',
    this.mission = const [],
    this.keyPhrases = const [],
  });

  final String title;
  final String city;
  final int minutes;
  final CefrLevel level;
  final IconData icon;
  final Color iconBg;
  final Color iconColor;

  /// 0..1, null when not started.
  final double? progress;
  final int xp;
  final String category;
  final List<String> mission;
  final List<String> keyPhrases;

  String get subtitle => '$city · $minutes min';

  static const Color defaultBg = AppColor.primarySoft;
}
