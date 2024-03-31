class Word {
  final int id;
  final String word;
  final String type;
  final String definition;
  final String usageExample;
  final DateTime addedDate;

  Word({
    required this.id,
    required this.word,
    required this.type,
    required this.definition,
    required this.usageExample,
    required this.addedDate,
  });

  factory Word.fromSqfliteDatabase(Map<String, dynamic> map) => Word(
        id: map['id']?.toInt() ?? 0,
        word: map['word'] ?? '',
        type: map['type'] ?? '',
        definition: map['definition'] ?? '',
        usageExample: map['usage_example'] ?? '',
        addedDate:
            DateTime.fromMicrosecondsSinceEpoch(int.parse(map['added_date'])),
      );
}
