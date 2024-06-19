import 'package:flutter/material.dart';
import 'package:teste_mesh/common/light_colors.dart';
import 'package:teste_mesh/common/light_textstyle.dart';
import 'package:teste_mesh/presentation/common/app_button.dart';
import 'package:teste_mesh/presentation/common/app_text_field.dart';
import 'package:teste_mesh/presentation/common/colored_safe_area.dart';

class EventPage extends StatelessWidget {
  const EventPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredSafeArea(
      child: LayoutBuilder(builder: (context, constraints) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Container(
              height: constraints.maxHeight,
              width: constraints.maxWidth,
              color: LightColors().backGroundPageColor,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 6.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.arrow_back_ios)),
                          Text(
                            'Adicionar evento',
                            style: LightTextstyle().eventAppBarTitleText,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    APPTextField(
                      fieldName: 'Nome do evento',
                      hintText: 'Ex: Donos da Quadra',
                      fieldNameStyle: LightTextstyle().appTextFieldSubtitleText,
                      fieldNameErrorStyle:
                          LightTextstyle().appTextFieldErrorSubtitleText,
                      hintStyle: LightTextstyle().appTextFieldHintText,
                      inputTextStyle: LightTextstyle().appTextFieldInputText,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    APPTextField(
                      fieldName: 'Modalidade',
                      hintText: 'Ex: Futebol',
                      fieldNameStyle: LightTextstyle().appTextFieldSubtitleText,
                      fieldNameErrorStyle:
                          LightTextstyle().appTextFieldErrorSubtitleText,
                      hintStyle: LightTextstyle().appTextFieldHintText,
                      inputTextStyle: LightTextstyle().appTextFieldInputText,
                    ),
                    const Expanded(
                      child: SizedBox(),
                    ),
                    AppButton(
                      constraints: constraints,
                      text: 'Confirmar',
                      color: LightColors().eventConfirmButtonColor,
                      onPressed: () {},
                    ),
                    const SizedBox(
                      height: 48,
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
