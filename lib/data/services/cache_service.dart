import 'package:sqflite/sqflite.dart';
import 'package:teste_mesh/data/services/events_db.dart';
import 'package:teste_mesh/data/services/utils/database_strings.dart';

class CacheService {
  late Database _db;

  Future saveEvent(Map<String, dynamic> data) async {
    try {
      _db = await EventsDb.instance.database;
      await _db.insert(DatabaseStrings.eventTable, data,
          conflictAlgorithm: ConflictAlgorithm.replace);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future removeEvent(int id) async {
    try {
      _db = await EventsDb.instance.database;
      await _db.database.delete(
        DatabaseStrings.eventTable,
        where: "id = ?",
        whereArgs: [id],
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<Map<String, dynamic>>> getEvents(String userEmail) async {
    try {
      _db = await EventsDb.instance.database;
      var result = await _db.query(
        DatabaseStrings.eventTable,
        where: "user_email = ?",
        whereArgs: [userEmail],
      );
      return result;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Map<String, dynamic>> getSingleEvent(int id) async {
    try {
      _db = await EventsDb.instance.database;
      var result = await _db.query(
        DatabaseStrings.eventTable,
        where: "id = ?",
        whereArgs: [id],
      );
      return result.first;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future updateEvent(int id, Map<String, dynamic> data) async {
    try {
      _db = await EventsDb.instance.database;
      await _db.update(
        DatabaseStrings.eventTable,
        data,
        where: "id = ?",
        whereArgs: [id],
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
