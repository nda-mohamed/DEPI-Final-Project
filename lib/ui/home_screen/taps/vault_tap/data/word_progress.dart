import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum Rating { again, hard, easy }

class WordProgress {
  final int strength; // 0..5
  final int seen;
  final DateTime nextReview;

  const WordProgress({
    required this.strength,
    required this.seen,
    required this.nextReview,
  });

  /// New word: strength 0, due right away.
  factory WordProgress.fresh() =>
      WordProgress(strength: 0, seen: 0, nextReview: DateTime.now());

  // For testing: change days to minutes, then change them back.
  static const _hardDelay = Duration(days: 1);
  static const _easyDelay = Duration(days: 4);

  bool get isMastered => strength >= 5;

  bool get isDueToday {
    final now = DateTime.now();
    final endOfToday = DateTime(now.year, now.month, now.day + 1);
    return nextReview.isBefore(endOfToday);
  }

  String get nextReviewLabel {
    final now = DateTime.now();
    final today = DateTime.utc(now.year, now.month, now.day);
    final day =
        DateTime.utc(nextReview.year, nextReview.month, nextReview.day);
    final diff = day.difference(today).inDays;
    if (diff <= 0) return 'Today';
    if (diff == 1) return 'Tomorrow';
    return 'In $diff days';
  }

  WordProgress after(Rating rating) {
    final now = DateTime.now();
    return switch (rating) {
      Rating.again => WordProgress(
          strength: (strength - 1).clamp(0, 5),
          seen: seen + 1,
          nextReview: now.add(const Duration(minutes: 1)),
        ),
      Rating.hard => WordProgress(
          strength: strength,
          seen: seen + 1,
          nextReview: now.add(_hardDelay),
        ),
      Rating.easy => WordProgress(
          strength: (strength + 1).clamp(0, 5),
          seen: seen + 1,
          nextReview: now.add(_easyDelay),
        ),
    };
  }

  Map<String, dynamic> toJson() => {
        'strength': strength,
        'seen': seen,
        'nextReview': nextReview.toIso8601String(),
      };

  factory WordProgress.fromJson(Map<String, dynamic> json) => WordProgress(
        strength: json['strength'] as int,
        seen: json['seen'] as int,
        nextReview: DateTime.parse(json['nextReview'] as String),
      );
}

/// Saves progress per word (key = lowercase word).
abstract final class ProgressStore {
  static final ValueNotifier<Map<String, WordProgress>> progress =
      ValueNotifier<Map<String, WordProgress>>({});
  static const _key = 'vault.progress';
  static bool _loaded = false;

  static String _id(String word) => word.toLowerCase();

  static WordProgress of(String word) =>
      progress.value[_id(word)] ?? WordProgress.fresh();

  static Future<void> load() async {
    if (_loaded) return;
    _loaded = true;
    final prefs = await SharedPreferences.getInstance();
    final stored = prefs.getString(_key);
    if (stored == null) return;
    try {
      final map = jsonDecode(stored) as Map<String, dynamic>;
      progress.value = map.map((k, v) =>
          MapEntry(k, WordProgress.fromJson(v as Map<String, dynamic>)));
    } catch (_) {
      await prefs.remove(_key);
    }
  }

  static Future<void> _persist() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      _key,
      jsonEncode(progress.value.map((k, v) => MapEntry(k, v.toJson()))),
    );
  }

  static void rate(String word, Rating rating) {
    final updated = of(word).after(rating);
    progress.value = {...progress.value, _id(word): updated};
    _persist();
  }

  static void remove(String word) {
    progress.value = {...progress.value}..remove(_id(word));
    _persist();
  }
}