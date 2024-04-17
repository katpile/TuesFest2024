import 'package:sqflite/sqflite.dart';
import 'package:dictionary_app/database/database_service.dart';
import 'package:dictionary_app/model/word.dart';
import 'dart:math';

class WordDB {
  final tableName = 'words';

  Future<void> createTable(Database db) async {
    await db.execute('''
      CREATE TABLE words (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        word TEXT,
        type TEXT,
        definition TEXT,
        usage_example TEXT,
        added_date TEXT
      )
    ''');
  }

  Future<int> create(Word word) async {
    print("addind word to db");
    final database = await DatabaseService().database;
    return await database.rawInsert(
      '''INSERT INTO $tableName (word, type, definition, usage_example, added_date) VALUES(?, ?, ?, ?, ?)''',
      [
        word.word,
        word.type,
        word.definition,
        word.usageExample,
        word.addedDate.millisecondsSinceEpoch
      ],
    );
  }

  Future<List<Word>> fetchAll() async {
    final database = await DatabaseService().database;
    final words = await database
        .rawQuery('''SELECT * from $tableName ORDER BY COALESCE(created_at)''');
    return words.map((word) => Word.fromSqfliteDatabase(word)).toList();
  }

  Future<Word?> fetchById(int id) async {
    final database = await DatabaseService().database;
    List<Map<String, dynamic>> words = await database.rawQuery(
      'SELECT * FROM $tableName WHERE id = ?',
      [id],
    );

    if (words.isNotEmpty) {
      return Word.fromSqfliteDatabase(words.first);
    } else {
      return null; // Return null if no word with the specified ID is found
    }
  }

  Future<List<Word>> fetchAllByDate(DateTime currentDate) async {
    final database = await DatabaseService().database;
    final formattedDate = currentDate.toIso8601String().substring(0, 10);
    final words = await database.rawQuery(
      '''SELECT * FROM $tableName WHERE added_date = ?''',
      [formattedDate],
    );
    return words.map((word) => Word.fromSqfliteDatabase(word)).toList();
  }

  Future<Word?> fetchRandomWord() async {
    final database = await DatabaseService().database;
    Random random = Random();
    int randomId = random.nextInt(70) + 22;
    print(randomId);
    List<Map<String, dynamic>> words = await database
        .rawQuery('SELECT * FROM $tableName WHERE id = ?', [randomId]);

    List<Map<String, dynamic>> filteredWords =
        words.where((word) => word['id'] == randomId).toList();

    print("Fetched word data: $words");

    if (filteredWords.isNotEmpty) {
      return Word.fromSqfliteDatabase(filteredWords.first);
    } else {
      return null;
    }
  }

  Future<bool> doesWordExist(String word) async {
    final db = await DatabaseService().database;
    final results = await db.query(
      'words',
      where: 'word = ?',
      whereArgs: [word],
    );
    return results.isNotEmpty;
  }

  Future<void> clearTable(String tableName) async {
    print("clearing table");
    final db = await DatabaseService()
        .database; // Assuming WordDB provides a 'database' getter
    await db.delete(tableName);
  }
}
