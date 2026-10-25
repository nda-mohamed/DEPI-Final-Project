enum MessageType { tutor, user, correction }

class ChatMessage {
  const ChatMessage({
    required this.type,
    required this.text,
    this.highlight,
  });

  final MessageType type;
  final String text;

  /// A word inside [text] to highlight (e.g. the key phrase).
  final String? highlight;
}

class WordDefinition {
  const WordDefinition({
    required this.word,
    required this.pronunciation,
    required this.translation,
    required this.partOfSpeech,
  });

  final String word;
  final String pronunciation;
  final String translation;
  final String partOfSpeech;
}
