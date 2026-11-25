import 'package:depi_final_project/data/models/chat_message.dart';
import 'package:depi_final_project/ui/home_screen/taps/vault_tap/cubits/review_state.dart';
import 'package:depi_final_project/ui/home_screen/taps/vault_tap/data/word_progress.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReviewCubit extends Cubit<ReviewState> {
  ReviewCubit(List<WordDefinition> words)
      : super(ReviewState(queue: List.of(words)..shuffle()));

  void flip() => emit(state.copyWith(isFlipped: !state.isFlipped));

  void rate(Rating rating) {
    // save the progress of the current word
    ProgressStore.rate(state.current.word, rating);

    emit(state.copyWith(
      index: state.index + 1,
      isFlipped: false,
      correct: state.correct + (rating == Rating.again ? 0 : 1),
    ));
  }
}