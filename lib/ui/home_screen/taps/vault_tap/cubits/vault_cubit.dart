


import 'package:depi_final_project/data/saved_words.dart';
import 'package:depi_final_project/ui/home_screen/taps/vault_tap/cubits/vault_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tts/flutter_tts.dart';

class VaultCubit extends Cubit<VaultState>{
  final FlutterTts _tts =FlutterTts();

  VaultCubit() : super(VaultState(words: SavedWords.words.value)){
    //// SAVE WORDS
   SavedWords.words.addListener(_onWordsChanged);
  }

  void _onWordsChanged(){
    emit(state.copyWith(words: SavedWords.words.value));
  }

  void changeFilter(VaultFilter filiter)=> emit(state.copyWith(filiter: filiter));

  Future<void>speak (String word)async{
    //// el language espany========
    await _tts.setLanguage('es-ES');
    
    await _tts.speak(word);
  }
///// 3shan mayhsalsh memory leak  , stop listener
  @override
  Future<void>close(){
  
    SavedWords.words.removeListener(_onWordsChanged);
    _tts.stop();
     return super.close();
  }
}