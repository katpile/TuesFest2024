import 'package:sqflite/sqflite.dart';
import 'package:dictionary_app/database/database_service.dart';
import 'package:dictionary_app/model/word.dart';

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
        added_date TEXT,
      )
    ''');
  }

  Future<int> create({required String name}) async {
    final database = await DatabaseService().database;
    return await database.rawInsert(
      '''INSERT INTO $tableName (name,added_date) VALUES(?,?)''',
      [name, DateTime.now().millisecondsSinceEpoch],
    );
  }

  Future<List<Word>> fetchAll() async {
    final database = await DatabaseService().database;
    final words = await database
        .rawQuery('''SELECT * from $tableName ORDER BY COALESCE(created_at)''');
    return words.map((word) => Word.fromSqfliteDatabase(word)).toList();
  }

  Future<Word> fetchById(int id) async {
    final database = await DatabaseService().database;
    final word = await database
        .rawQuery('''SELECT * from $tableName WHERE id = ?''', [id]);
    return Word.fromSqfliteDatabase(word.first);
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
}
