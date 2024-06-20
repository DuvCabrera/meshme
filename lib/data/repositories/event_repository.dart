import 'package:teste_mesh/data/models/event_model.dart';
import 'package:teste_mesh/data/services/cache_service.dart';

class EventRepository {
  final CacheService cache;

  EventRepository({required this.cache});

  Future saveEvent(Event event) async {
    try {
      await cache.saveEvent(event.toMap());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future removeEvent(int id) async {
    try {
      await cache.removeEvent(id);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<Event>> getEvents(String userEmail) async {
    try {
      var result = await cache.getEvents(userEmail);
      return result.map((e) => Event.fromMap(e)).toList();
    } catch (e) {
      return <Event>[];
    }
  }

  Future<Event?> getSingleEvent(int id) async {
    try {
      var result = await cache.getSingleEvent(id);
      return Event.fromMap(result);
    } catch (e) {
      return null;
    }
  }

  Future updateEvent(Event event) async {
    try {
      await cache.updateEvent(event.id!, event.toMap());
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
