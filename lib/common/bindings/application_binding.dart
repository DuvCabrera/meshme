import 'package:get/get.dart';
import 'package:teste_mesh/common/controller/auth_controller.dart';
import 'package:teste_mesh/data/repositories/event_repository.dart';
import 'package:teste_mesh/data/services/cache_service.dart';

class ApplicationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CacheService());
    Get.put(EventRepository(cache: Get.find()));
    Get.put<AuthController>(AuthController());
  }
}
