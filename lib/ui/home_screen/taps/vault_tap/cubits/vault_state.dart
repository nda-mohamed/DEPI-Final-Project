import 'package:depi_final_project/data/models/chat_message.dart';
import 'package:depi_final_project/ui/home_screen/taps/vault_tap/data/word_progress.dart';
import 'package:equatable/equatable.dart';

enum VaultFilter { all, learning, mastered }

extension WordX on WordDefinition {
  bool get hasTranslation =>
      translation.trim().isNotEmpty && translation != 'No translation yet';
}

class VaultState extends Equatable {
  final List<WordDefinition> words;
  final Map<String, WordProgress> progress;
  final VaultFilter filiter;

  const VaultState({
    this.words = const [],
    this.progress = const {},
    this.filiter = VaultFilter.all,
  });

  WordProgress progressOf(WordDefinition w) =>
      progress[w.word.toLowerCase()] ?? WordProgress.fresh();

  int get total => words.length;

  int get mastered => words.where((w) => progressOf(w).isMastered).length;

  /// Words to review now: due today and have a real translation.
  List<WordDefinition> get dueWords => words
      .where((w) => w.hasTranslation && progressOf(w).isDueToday)
      .toList();

  int get due => dueWords.length;

  List<WordDefinition> get visible => switch (filiter) {
        VaultFilter.all => words,
        VaultFilter.learning =>
          words.where((w) => !progressOf(w).isMastered).toList(),
        VaultFilter.mastered =>
          words.where((w) => progressOf(w).isMastered).toList(),
      };

  VaultState copyWith({
    List<WordDefinition>? words,
    Map<String, WordProgress>? progress,
    VaultFilter? filiter,
  }) =>
      VaultState(
        words: words ?? this.words,
        progress: progress ?? this.progress,
        filiter: filiter ?? this.filiter,
      );

  @override
  List<Object?> get props => [words, progress, filiter];
}