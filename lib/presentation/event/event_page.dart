import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste_mesh/common/light_colors.dart';
import 'package:teste_mesh/common/light_textstyle.dart';
import 'package:teste_mesh/common/route/app_routes.dart';
import 'package:teste_mesh/data/models/event_model.dart';
import 'package:teste_mesh/presentation/common/app_button.dart';
import 'package:teste_mesh/presentation/common/app_text_field.dart';
import 'package:teste_mesh/presentation/common/colored_safe_area.dart';
import 'package:teste_mesh/presentation/event/event_controller.dart';

class EventPage extends StatelessWidget {
  EventPage({super.key});

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    final Event? _event = Get.arguments[0];
    if (_event != null) {
      _titleController.text = _event.title;
      _categoryController.text = _event.category;
      Get.find<EventController>().setEventFromHome(_event);
    }

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
                              onPressed: () => Get.offAllNamed(AppRoutes.HOME),
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
                      controller: _titleController,
                      onChanged: Get.find<EventController>().setTitle,
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
                      controller: _categoryController,
                      onChanged: Get.find<EventController>().setCategory,
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
                    Obx(
                      () => AppButton(
                        constraints: constraints,
                        text: 'Confirmar',
                        color: LightColors().eventConfirmButtonColor,
                        onPressed: Get.find<EventController>().isEventValid
                            ? () {
                                Get.find<EventController>().sendEvent();
                                Get.offAllNamed(AppRoutes.HOME);
                              }
                            : null,
                      ),
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
