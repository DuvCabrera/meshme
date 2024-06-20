import 'package:get/get.dart';
import 'package:teste_mesh/common/controller/auth_controller.dart';
import 'package:teste_mesh/data/repositories/event_repository.dart';
import 'package:teste_mesh/presentation/home/home_controler.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => HomeControler(
        auth: Get.find<AuthController>(),
        repository: Get.find<EventRepository>(),
      ),
    );
  }
}
