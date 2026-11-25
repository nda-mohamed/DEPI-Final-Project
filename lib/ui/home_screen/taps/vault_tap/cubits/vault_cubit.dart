import 'package:depi_final_project/data/saved_words.dart';
import 'package:depi_final_project/ui/home_screen/taps/vault_tap/cubits/vault_state.dart';
import 'package:depi_final_project/ui/home_screen/taps/vault_tap/data/word_progress.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tts/flutter_tts.dart';

class VaultCubit extends Cubit<VaultState> {
  final FlutterTts _tts = FlutterTts();

  VaultCubit()
      : super(VaultState(
          words: SavedWords.words.value,
          progress: ProgressStore.progress.value,
        )) {
    SavedWords.words.addListener(_onChanged);
    ProgressStore.progress.addListener(_onChanged);
    ProgressStore.load();
  }

  void _onChanged() {
    emit(state.copyWith(
      words: SavedWords.words.value,
      progress: ProgressStore.progress.value,
    ));
  }

  void changeFilter(VaultFilter filiter) =>
      emit(state.copyWith(filiter: filiter));

  Future<void> speak(String word) async {
    await _tts.setLanguage('es-ES');
    await _tts.speak(word);
  }

  @override
  Future<void> close() {
    SavedWords.words.removeListener(_onChanged);
    ProgressStore.progress.removeListener(_onChanged);
    _tts.stop();
    return super.close();
  }
}