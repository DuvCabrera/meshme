import 'package:flutter/material.dart';
import 'package:teste_mesh/common/light_colors.dart';
import 'package:teste_mesh/common/light_textstyle.dart';
import 'package:teste_mesh/presentation/common/app_button.dart';
import 'package:teste_mesh/presentation/common/app_text_field.dart';
import 'package:teste_mesh/presentation/common/colored_safe_area.dart';
import 'package:teste_mesh/presentation/common/google_social_login_button.dart';
import 'package:teste_mesh/presentation/common/line_with_text.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                      child: APPTextField(
                        fieldName: 'E-mail pessoal',
                        hintText: 'exemplo@gmail.com',
                        fieldNameStyle:
                            LightTextstyle().appTextFieldSubtitleText,
                        fieldNameErrorStyle:
                            LightTextstyle().appTextFieldErrorSubtitleText,
                        hintStyle: LightTextstyle().appTextFieldHintText,
                        inputTextStyle: LightTextstyle().appTextFieldInputText,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    APPTextField(
                      fieldName: 'Senha',
                      hintText: "Digite sua senha",
                      isPassword: true,
                      fieldNameStyle: LightTextstyle().appTextFieldSubtitleText,
                      fieldNameErrorStyle:
                          LightTextstyle().appTextFieldErrorSubtitleText,
                      hintStyle: LightTextstyle().appTextFieldHintText,
                      inputTextStyle: LightTextstyle().appTextFieldInputText,
                    ),
                    const SizedBox(
                      height: 28,
                    ),
                    AppButton(
                      constraints: constraints,
                      text: 'Entrar',
                      color: LightColors().loginPageEnterButtonColor,
                      onPressed: () {},
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const LineWithText(text: 'ou'),
                    const SizedBox(
                      height: 24,
                    ),
                    GoogleSignInButton(
                      onPressed: () {},
                      screenSize:
                          Size(constraints.maxWidth, constraints.minHeight),
                    )
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
