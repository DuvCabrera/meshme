import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste_mesh/common/controller/auth_controller.dart';
import 'package:teste_mesh/common/light_colors.dart';
import 'package:teste_mesh/common/light_textstyle.dart';
import 'package:teste_mesh/common/route/app_routes.dart';
import 'package:teste_mesh/presentation/common/app_button.dart';
import 'package:teste_mesh/presentation/common/colored_safe_area.dart';
import 'package:teste_mesh/presentation/home/home_controler.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _showConfirmationBottomSheet(BuildContext context, int id) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return LayoutBuilder(builder: (context, constraints) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const SizedBox(
                height: 21,
              ),
              Container(
                alignment: Alignment.topRight,
                padding: const EdgeInsets.only(right: 20),
                child: IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(
                    Icons.close,
                    size: 24,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Image.asset(
                'assets/images/x_icon.png',
                scale: 0.75,
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                'Excluir evento',
                style: LightTextstyle().homeModalTitleText,
              ),
              const SizedBox(
                height: 4,
              ),
              SizedBox(
                width: 245,
                child: Text(
                  'Você está prestes a excluir o evento. Deseja confirmar?',
                  textAlign: TextAlign.center,
                  style: LightTextstyle().homeModalSubTitleText,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: AppButton(
                  isLogin: false,
                  text: 'Confirmar',
                  constraints: constraints,
                  color: LightColors().homeModalButtonColor,
                  onPressed: () {
                    Get.find<HomeControler>().removeEvent(id);
                    Navigator.of(context).pop();
                  },
                ),
              ),
              const SizedBox(
                height: 48,
              ),
            ],
          );
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ColoredSafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Scaffold(
            body: Container(
              color: LightColors().safeAreaColor,
              width: constraints.maxWidth,
              height: constraints.maxHeight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: Get.find<AuthController>().logOut,
                      child: Image.asset(
                        'assets/images/small_mesh_logo.png',
                        height: 20,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Divider(
                    color: LightColors().homeDividerColor,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Minha agenda',
                      style: LightTextstyle().homeTitleText,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Obx(
                        () => ListView.builder(
                          itemCount: Get.find<HomeControler>().eventList.length,
                          itemBuilder: (context, index) {
                            var itens = Get.find<HomeControler>().eventList;
                            return Container(
                              clipBehavior: Clip.hardEdge,
                              margin: const EdgeInsets.only(bottom: 16),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: LightColors().homeCardBorderColor),
                              ),
                              child: GestureDetector(
                                onTap: () => Get.offAllNamed(AppRoutes.EVENT,
                                    arguments: [itens[index]]),
                                child: Row(
                                  children: <Widget>[
                                    Image.asset(
                                      'assets/images/futbol.png',
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                    const SizedBox(width: 16),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            itens[index].title,
                                            style: LightTextstyle()
                                                .homeCardTitleText,
                                          ),
                                          Text(
                                            itens[index].category,
                                            style: LightTextstyle()
                                                .homeCardSubTitleText,
                                          ),
                                        ],
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () => _showConfirmationBottomSheet(
                                          context, itens[index].id!),
                                      child: SizedBox(
                                        width: 45,
                                        height: 45,
                                        child: Image.asset(
                                          'assets/images/delete_icon.png',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: AppButton(
                      constraints: constraints,
                      text: 'Adicionar',
                      color: LightColors().homePageAddButtonColor,
                      onPressed: () =>
                          Get.offAllNamed(AppRoutes.EVENT, arguments: [null]),
                    ),
                  ),
                  const SizedBox(
                    height: 48,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
