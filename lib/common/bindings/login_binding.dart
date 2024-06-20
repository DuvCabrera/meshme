import 'package:get/get.dart';
import 'package:teste_mesh/common/email_validator.dart';
import 'package:teste_mesh/presentation/login/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EmailValidator());
    Get.lazyPut(() => LoginController(auth: Get.find(), validator: Get.find()));
  }
}
