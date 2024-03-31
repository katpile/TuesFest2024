import 'package:dictionary_app/database/word_db.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseService {
  Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initialize();
    return _database!;
  }

  Future<String> get fullPath async {
    const name = 'word.db';
    final path = await getDatabasesPath();
    return join(path, name);
  }

  // Future<void> insertWord(Map<String, dynamic> wordMap) async {
  //   final database = await DatabaseService().database;
  //   await database.insert(
  //     'words', // tableName should be replaced with 'words'
  //     wordMap,
  //     conflictAlgorithm: ConflictAlgorithm.replace,
  //   );
  // }

  Future<Database> _initialize() async {
    final path = await fullPath;
    var database = await openDatabase(
      path,
      version: 1,
      onCreate: create,
      singleInstance: true,
    );
    return database;
  }

  Future<void> create(Database database, int version) async =>
      await WordDB().createTable(database);
}
