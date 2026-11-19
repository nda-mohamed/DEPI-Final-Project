

import 'package:equatable/equatable.dart';
import 'package:depi_final_project/data/models/chat_message.dart';

enum VaultFilter {all,learning,mastered}

class VaultState extends Equatable {

  final List<WordDefinition>words;
  final VaultFilter filiter;

  const VaultState ({this.words=const[], 
  this.filiter =VaultFilter.all});

    int get total => words.length;

  int get mastered=>0;
  int get due => total;

  List<WordDefinition> get visible =>switch (filiter){
    VaultFilter.all => words,
    VaultFilter.learning => words,
      VaultFilter.mastered => const[],
  };
   
   VaultState copyWith({List<WordDefinition>? words,VaultFilter?filiter})=>
   VaultState(words: words?? this.words,filiter:filiter?? this.filiter);

@override 
List<Object?> get props =>[words, filiter];
}
  

