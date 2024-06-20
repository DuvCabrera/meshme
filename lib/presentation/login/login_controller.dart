import 'package:get/get.dart';
import 'package:teste_mesh/common/controller/auth_controller.dart';
import 'package:teste_mesh/common/email_validator.dart';

class LoginController extends GetxController {
  final AuthController auth;
  final EmailValidator validator;
  LoginController({
    required this.auth,
    required this.validator,
  });

  @override
  void onReady() async {
    super.onReady();
    debounce(_userEmail, _validateEmail,
        time: const Duration(milliseconds: 800));
    ever(_userPassword, _validatePassword);
    // time: const Duration(milliseconds: 800));
  }

  final _userEmail = ''.obs;
  String get userEmail => _userEmail.value;

  final _userPassword = ''.obs;
  String get userPassword => _userPassword.value;

  final _isUserNotValid = false.obs;
  bool get isUserNotValid => _isUserNotValid.value;

  final _isEmailInvalid = false.obs;
  bool get isEmailInvalid => _isEmailInvalid.value;

  final _isPasswordInvalid = false.obs;
  bool get isPasswordlInvalid => _isPasswordInvalid.value;

  Future _validateEmail(String email) async {
    try {
      await validator.checkEmail(email: email);
      _isEmailInvalid.value = false;
    } catch (e) {
      _isEmailInvalid.value = true;
    }
  }

  void _validatePassword(String password) => _isPasswordInvalid.value =
      (password.isEmpty || (password.length < 6)) ? true : false;

  void setEmail(String email) {
    _userEmail.value = email.toLowerCase().trim();
  }

  void setPassword(String password) {
    _userPassword.value = password.trim();
  }

  void setUserError() {
    _isUserNotValid.value = false;
  }

  void tryLogin() async {
    try {
      await auth.login(email: _userEmail.value, password: _userPassword.value);
    } catch (e) {
      _isUserNotValid.value = true;
    }
  }

  void logWithGoogle() {
    try {
      auth.handleGoogleSignIn();
    } catch (e) {
      _isUserNotValid.value = true;
    }
  }
}
