
import 'package:depi_final_project/data/models/chat_message.dart';
import 'package:equatable/equatable.dart';


////// Equatable is used to compare objects by their properties rather than by reference.
/// This is useful for state management in Flutter,
///  as it allows for efficient updates and
///  comparisons of state objects.
/// و عشان منعدش الرسمه ع الفاضى
class ReviewState extends Equatable {
  final List<WordDefinition> queue;
  final int index;
  final int correct;
  final bool isFlipped;

  ReviewState({
    
   required this.queue,
   this.index=0, 
   this.correct=0,
   this.isFlipped=false,});

   int get total => queue.length;
   bool get isFinished => index >= queue.length;
   WordDefinition get current => queue[index];
   double get accuracy => total == 0 ? 0 : correct / total;
//// بتعمل نسخة من الحالة الحالية مع إمكانية تعديل بعض القيم
   ReviewState copyWith({
    int ? index,
    int ? correct,
    bool ? isFlipped,
   }){

    return ReviewState(
      queue: queue,
      index: index ?? this.index,
      correct: correct ?? this.correct,
      isFlipped: isFlipped ?? this.isFlipped,
    );

   }

  @override

  List<Object?> get props => [queue, index,
   correct, isFlipped];
}