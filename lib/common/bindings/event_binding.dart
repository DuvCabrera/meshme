import 'package:get/get.dart';
import 'package:teste_mesh/common/controller/auth_controller.dart';
import 'package:teste_mesh/data/repositories/event_repository.dart';
import 'package:teste_mesh/presentation/event/event_controller.dart';

class EventBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => EventController(
        auth: Get.find<AuthController>(),
        repository: Get.find<EventRepository>(),
      ),
    );
  }
}
