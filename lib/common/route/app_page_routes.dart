import 'package:get/get.dart';
import 'package:teste_mesh/common/bindings/event_binding.dart';
import 'package:teste_mesh/common/bindings/home_binding.dart';
import 'package:teste_mesh/common/bindings/login_binding.dart';
import 'package:teste_mesh/common/route/app_routes.dart';
import 'package:teste_mesh/presentation/event/event_page.dart';
import 'package:teste_mesh/presentation/home/home_page.dart';
import 'package:teste_mesh/presentation/login/login_page.dart';
import 'package:teste_mesh/presentation/login/splash_screen/splash_screen.dart';

class Pages {
  static final routes = [
    GetPage(
      name: AppRoutes.SPLASH,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: AppRoutes.LOGIN,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.HOME,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.EVENT,
      page: () => EventPage(),
      binding: EventBinding(),
    ),
  ];
}
