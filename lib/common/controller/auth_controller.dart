import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:teste_mesh/common/route/app_routes.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> user;
  FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleAuthProvider _provider = GoogleAuthProvider();

  @override
  void onReady() {
    super.onReady();
    user = Rx<User?>(auth.currentUser);
    // abre uma stream para verificar o que esta acontecendo com o usuario
    user.bindStream(auth.userChanges());
    ever(user, _initialScreen);
  }

  _initialScreen(User? user) {
    if (user == null) {
      Get.offAllNamed(AppRoutes.LOGIN);
    } else {
      Get.offAllNamed(AppRoutes.HOME);
    }
  }

  Future<void> login({required String email, required String password}) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  void handleGoogleSignIn() {
    try {
      auth.signInWithProvider(_provider);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> logOut() async {
    await auth.signOut();
  }
}
