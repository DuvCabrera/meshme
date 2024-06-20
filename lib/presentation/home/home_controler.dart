import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import 'package:teste_mesh/common/controller/auth_controller.dart';
import 'package:teste_mesh/data/models/event_model.dart';
import 'package:teste_mesh/data/repositories/event_repository.dart';

class HomeControler extends GetxController {
  HomeControler({
    required repository,
    required auth,
  })  : _auth = auth,
        _repository = repository;

  final EventRepository _repository;
  final AuthController _auth;

  final _eventList = <Event>[].obs;
  List<Event> get eventList => _eventList.toList();

  final _isLoading = true.obs;
  bool get isLoading => _isLoading.value;

  final _hasError = false.obs;
  bool get hasError => _hasError.value;

  late User _user;

  @override
  void onInit() {
    _user = _auth.user.value!;
    _fetchEvents();
    super.onInit();
  }

  Future _fetchEvents() async {
    try {
      _isLoading.value = true;
      var result = await _repository.getEvents(_user.email!);
      _eventList.value = result;
      _isLoading.value = false;
    } catch (e) {
      _eventList.value = [];
    }
  }

  Future removeEvent(int id) async {
    try {
      await _repository.removeEvent(id);
      _eventList.value = eventList.where((e) => e.id != id).toList();
    } catch (e) {
      _hasError.value = true;
    }
  }
}
