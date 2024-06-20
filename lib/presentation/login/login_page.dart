import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste_mesh/common/light_colors.dart';
import 'package:teste_mesh/common/light_textstyle.dart';
import 'package:teste_mesh/presentation/common/app_button.dart';
import 'package:teste_mesh/presentation/common/app_text_field.dart';
import 'package:teste_mesh/presentation/common/colored_safe_area.dart';
import 'package:teste_mesh/presentation/common/google_social_login_button.dart';
import 'package:teste_mesh/presentation/common/line_with_text.dart';
import 'package:teste_mesh/presentation/login/login_controller.dart';

// ignore: must_be_immutable
class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void showSnackBar(BuildContext context) {
      final snackBar = SnackBar(
        backgroundColor: LightColors().backGroundPageColor,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Erro de login',
              style: LightTextstyle().loginErrorSnackbarTitleText,
            ),
            Text(
              'Usuario ou senha estao incorretos',
              style: LightTextstyle().loginErrorSnackbarMessageText,
            ),
          ],
        ),
        behavior: SnackBarBehavior.floating,
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

    return ColoredSafeArea(
      child: LayoutBuilder(builder: (contex, constraints) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Container(
              color: LightColors().backGroundPageColor,
              width: constraints.maxWidth,
              height: constraints.maxHeight,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 80.0),
                      child: Image.asset(
                        'assets/images/mesh_logo.png',
                        width: 206,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 62.0),
                      child: Obx(
                        () => APPTextField(
                          errorText: Get.find<LoginController>().isEmailInvalid
                              ? "Formato incorreto"
                              : null,
                          controller: _emailController,
                          onChanged: Get.find<LoginController>().setEmail,
                          fieldName: 'E-mail pessoal',
                          hintText: 'exemplo@gmail.com',
                          fieldNameStyle:
                              LightTextstyle().appTextFieldSubtitleText,
                          fieldNameErrorStyle:
                              LightTextstyle().appTextFieldErrorSubtitleText,
                          hintStyle: LightTextstyle().appTextFieldHintText,
                          inputTextStyle:
                              LightTextstyle().appTextFieldInputText,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Obx(() => APPTextField(
                          controller: _senhaController,
                          onChanged: Get.find<LoginController>().setPassword,
                          errorText:
                              Get.find<LoginController>().isPasswordlInvalid
                                  ? 'Formato incorreto'
                                  : null,
                          fieldName: 'Senha',
                          hintText: "Digite sua senha",
                          isPassword: true,
                          fieldNameStyle:
                              LightTextstyle().appTextFieldSubtitleText,
                          fieldNameErrorStyle:
                              LightTextstyle().appTextFieldErrorSubtitleText,
                          hintStyle: LightTextstyle().appTextFieldHintText,
                          inputTextStyle:
                              LightTextstyle().appTextFieldInputText,
                        )),
                    const SizedBox(
                      height: 28,
                    ),
                    Obx(() {
                      var c = Get.find<LoginController>();
                      return AppButton(
                        constraints: constraints,
                        text: 'Entrar',
                        color: LightColors().loginPageEnterButtonColor,
                        onPressed: (c.userEmail.isEmpty ||
                                c.userPassword.isEmpty ||
                                c.isEmailInvalid ||
                                c.isPasswordlInvalid)
                            ? null
                            : c.tryLogin,
                      );
                    }),
                    const SizedBox(
                      height: 24,
                    ),
                    const LineWithText(text: 'ou'),
                    const SizedBox(
                      height: 24,
                    ),
                    GoogleSignInButton(
                      onPressed: Get.find<LoginController>().logWithGoogle,
                      screenSize:
                          Size(constraints.maxWidth, constraints.minHeight),
                    ),
                    Obx(
                      () {
                        var c = Get.find<LoginController>();

                        if (c.isUserNotValid) {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            showSnackBar(context);
                          });
                          c.setUserError();
                        }

                        return const SizedBox.shrink();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
