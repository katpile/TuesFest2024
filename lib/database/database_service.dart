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
    checkDatabaseContent();
    return _database!;
  }

  Future<void> checkDatabaseContent() async {
    final Database db = await database;
    List<Map> result = await db.query('words');
    if (result.isEmpty) {
      print('Database is empty');
    } else {
      print('Database has data');
    }
  }

  Future<String> get fullPath async {
    const name = 'word.db';
    final path = await getDatabasesPath();
    return join(path, name);
  }

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
