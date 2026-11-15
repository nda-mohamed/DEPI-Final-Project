import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import 'models/chat_message.dart';

/// Session-wide saved vocabulary shared by chat and the Vault tab.
abstract final class SavedWords {
  static final ValueNotifier<List<WordDefinition>> words =
      ValueNotifier<List<WordDefinition>>(<WordDefinition>[]);
  static const _storageKey = 'hablo.saved_words';

  static Future<void> load() async {
    final preferences = await SharedPreferences.getInstance();
    final stored = preferences.getString(_storageKey);
    if (stored == null) return;
    try {
      final decoded =
          (jsonDecode(stored) as List<dynamic>).cast<Map<String, dynamic>>();
      words.value = List.unmodifiable(decoded.map((item) => WordDefinition(
            word: item['word'] as String,
            pronunciation: item['pronunciation'] as String,
            translation: item['translation'] as String,
            partOfSpeech: item['partOfSpeech'] as String,
          )));
    } on FormatException {
      await preferences.remove(_storageKey);
    } on TypeError {
      await preferences.remove(_storageKey);
    }
  }

  static Future<void> _persist() async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString(
        _storageKey,
        jsonEncode(words.value
            .map((item) => {
                  'word': item.word,
                  'pronunciation': item.pronunciation,
                  'translation': item.translation,
                  'partOfSpeech': item.partOfSpeech,
                })
            .toList()));
  }

  static bool contains(String word) => words.value
      .any((saved) => saved.word.toLowerCase() == word.toLowerCase());

  static void save(WordDefinition definition) {
    if (contains(definition.word)) return;
    words.value = List.unmodifiable([...words.value, definition]);
    _persist();
  }

  static void remove(WordDefinition definition) {
    words.value = List.unmodifiable(words.value.where(
        (saved) => saved.word.toLowerCase() != definition.word.toLowerCase()));
    _persist();
  }
}
