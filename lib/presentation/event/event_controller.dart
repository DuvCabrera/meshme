import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:teste_mesh/common/controller/auth_controller.dart';
import 'package:teste_mesh/data/models/event_model.dart';
import 'package:teste_mesh/data/repositories/event_repository.dart';

class EventController extends GetxController {
  EventController({
    required AuthController auth,
    required EventRepository repository,
  })  : _auth = auth,
        _repository = repository;

  final AuthController _auth;
  final EventRepository _repository;

  final _title = ''.obs;
  String get title => _title.value;

  final _category = ''.obs;
  String get category => _category.value;

  final Rx<Event?> _eventFromHome = Rx<Event?>(null);

  final _isEventValid = false.obs;
  bool get isEventValid => _isEventValid.value;

  late User _user;

  @override
  void onInit() {
    _user = _auth.user.value!;
    ever(_eventFromHome, _setTitleNCategory);
    interval(_title, _titleCheck, time: const Duration(microseconds: 800));
    interval(_category, _categoryCheck,
        time: const Duration(microseconds: 800));

    super.onInit();
  }

  void sendEvent() async {
    try {
      if (_eventFromHome.value != null) {
        await _updateEvent();
      } else {
        await _saveEvent();
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future _updateEvent() async {
    await _repository.updateEvent(
      Event(_eventFromHome.value!.id,
          userEmail: _eventFromHome.value!.userEmail,
          title: _title.value,
          category: _category.value),
    );
  }

  Future _saveEvent() async {
    await _repository.saveEvent(
      Event(null,
          userEmail: _user.email!,
          title: _title.value,
          category: _category.value),
    );
  }

  void setEventFromHome(Event event) {
    _eventFromHome.value = event;
  }

  void _setTitleNCategory(Event? event) {
    _category.value = event!.category;
    _title.value = event.title;
  }

  void setTitle(String title) {
    _title.value = title;
  }

  void setCategory(String category) {
    _category.value = category;
  }

  void _titleCheck(String title) =>
      _isEventValid.value = (title.isEmpty || category.isEmpty) ? false : true;

  void _categoryCheck(String category) =>
      _isEventValid.value = (category.isEmpty || title.isEmpty) ? false : true;
}
