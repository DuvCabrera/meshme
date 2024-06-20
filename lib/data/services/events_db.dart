import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class EventsDb {
  EventsDb._();

  static final EventsDb instance = EventsDb._();

  static Database? _database;

  get database async {
    if (_database != null) return _database;
    return await _initDatabase();
  }

  _initDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'event.db'),
      version: 1,
      onCreate: _onCreate,
    );
  }

  _onCreate(Database db, int version) async {
    await db.execute(_event);
  }

  String get _event => '''
    CREATE TABLE event (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_email TEXT,
    title TEXT,
    category TEXT
    );
  ''';
}
