import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/config/config.dart';
import 'package:flutter_application_1/controllers/general_controller.dart';
import 'package:flutter_application_1/pages/filling_data/widgets/container_with_star.dart';
import 'package:flutter_application_1/pages/filling_data/widgets/input.dart';
import 'package:flutter_application_1/pages/plans_page_view/widgets/gradient_button.dart';
import 'package:flutter_application_1/pages/successfull_order/successfull_order_page.dart';
import 'package:flutter_application_1/requests/post_order.dart';
import 'package:flutter_application_1/widgets/custom_app_bar.dart';
import 'package:flutter_application_1/widgets/custom_transition.dart';
import 'package:flutter_application_1/widgets/default_container.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:swipe/swipe.dart';

class FillingData extends StatefulWidget {
  const FillingData({Key? key}) : super(key: key);

  @override
  _FillingDataState createState() => _FillingDataState();
}

class _FillingDataState extends State<FillingData> {
  late final TextEditingController controllerCity;
  late final TextEditingController controllerStreet;
  late final TextEditingController controllerHome;
  late final TextEditingController controllerFlat;
  late final TextEditingController controllerComment;
  late final TextEditingController controllerNumber;
  late final List<TextEditingController> requiredTextControllers;
  late bool _canVibrate;
  late bool _loading;

  @override
  void initState() {
    super.initState();
    _canVibrate = true;
    _initVibrate();
    _loading = false;
    controllerCity = TextEditingController();
    controllerStreet = TextEditingController();
    controllerHome = TextEditingController();
    controllerFlat = TextEditingController();
    controllerComment = TextEditingController();
    controllerNumber = TextEditingController();
    requiredTextControllers = [
      controllerCity,
      controllerStreet,
      controllerHome,
      controllerFlat,
      controllerNumber,
    ];
  }

  Future<void> _initVibrate() async {
    bool canVibrate = await Vibrate.canVibrate;
    setState(() {
      _canVibrate = canVibrate;
    });
  }

  Future<int> _postOrderLoading(GeneralController controller) async {
    setState(() {
      _loading = true;
    });
    FocusManager.instance.primaryFocus?.unfocus();

    ///Request func
    var statusCode = await postOrder(
      endPoint: 'order',
      square: controller.orderController.data!.square,
      typeOfCleaning: controller.orderController.data!.typeOfCleaning,
      extras: controller.orderController.data!.extras,
      city: controller.orderController.data!.city,
      street: controller.orderController.data!.street,
      house: controller.orderController.data!.house,
      flat: controller.orderController.data!.flat,
      comment: controller.orderController.data!.comment,
      phone: controller.orderController.data!.phone,
      totalPrice: controller.orderController.data!.totalPrice,
    );

    setState(() {
      _loading = false;
    });

    return statusCode;
  }

  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<GeneralController>(context);
    final width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Stack(
        children: [
          Swipe(
            onSwipeRight: () => Navigator.pop(context),
            child: Scaffold(
              appBar: const CustomAppBar(isBackArrow: true),
              backgroundColor: AppConfig.whiteColor,
              body: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 22),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(height: 10),

                            /// Анимация
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 94),
                              child: Image.asset(
                                'lib/assets/gif/winning_cup.gif',
                              ),
                            ),
                            const SizedBox(height: 57),

                            /// Выбор города
                            DefaultContainer(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 18),
                                child: Input(
                                  width: width - 122,
                                  hintText: 'Город',
                                  controller: controllerCity,
                                  textInputAction: TextInputAction.next,
                                ),
                              ),
                            ),
                            const SizedBox(height: 17),

                            /// Выбор улицы
                            DefaultContainer(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 18),
                                child: Input(
                                  width: width - 122,
                                  hintText: 'Улица',
                                  controller: controllerStreet,
                                  textInputAction: TextInputAction.next,
                                ),
                              ),
                            ),
                            const SizedBox(height: 17),

                            /// Выбор дома и квартиры
                            Row(
                              children: [
                                DefaultContainer(
                                  child: SizedBox(
                                    width: (width - 110) / 2,
                                    height: 42,
                                    child: TextField(
                                      textInputAction: TextInputAction.next,
                                      textAlign: TextAlign.center,
                                      controller: controllerHome,
                                      cursorColor: AppConfig.blueColor,
                                      scrollPadding:
                                          const EdgeInsets.only(bottom: 100),
                                      onChanged: (_) {
                                        setState(() {});
                                      },
                                      decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.only(bottom: 5.0),
                                        border: InputBorder.none,
                                        hintText: 'Дом',
                                        hintStyle: TextStyle(
                                          fontSize: 13,
                                          color: AppConfig.blackColor
                                              .withOpacity(0.15),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      style: const TextStyle(
                                        fontSize: 13,
                                        color: AppConfig.blueColor,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                ContainerWithStar(
                                  isActive: controllerHome.text.isNotEmpty &&
                                          controllerFlat.text.isNotEmpty
                                      ? true
                                      : false,
                                ),
                                const SizedBox(width: 12),
                                DefaultContainer(
                                  child: SizedBox(
                                    width: (width - 110) / 2,
                                    height: 42,
                                    child: TextField(
                                      textInputAction: TextInputAction.next,
                                      textAlign: TextAlign.center,
                                      controller: controllerFlat,
                                      cursorColor: AppConfig.blueColor,
                                      keyboardType: TextInputType.number,
                                      onChanged: (_) {
                                        setState(() {});
                                      },
                                      decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.only(bottom: 5.0),
                                        border: InputBorder.none,
                                        hintText: 'Квартира',
                                        hintStyle: TextStyle(
                                          fontSize: 13,
                                          color: AppConfig.blackColor
                                              .withOpacity(0.15),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      style: const TextStyle(
                                        fontSize: 13,
                                        color: AppConfig.blueColor,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 17),

                            /// Добавление комментария
                            DefaultContainer(
                              borderRadius: 8,
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(18, 12, 12, 13),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: width - 74,
                                      child: Stack(
                                        alignment: Alignment.topLeft,
                                        children: [
                                          controllerComment.text.isEmpty
                                              ? Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 1.0),
                                                  child: RichText(
                                                    text: TextSpan(
                                                      children: <TextSpan>[
                                                        TextSpan(
                                                          text:
                                                              'Волшебное место, где можно написать полезный ',
                                                          style: TextStyle(
                                                            fontSize: 13,
                                                            color: AppConfig
                                                                .blackColor
                                                                .withOpacity(
                                                                    0.15),
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        ),
                                                        const TextSpan(
                                                          text: 'комментарий',
                                                          style: TextStyle(
                                                            fontSize: 13,
                                                            color: AppConfig
                                                                .blueColor,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text:
                                                              ' для мастера, важные детали, удобное время приема',
                                                          style: TextStyle(
                                                            fontSize: 13,
                                                            color: AppConfig
                                                                .blackColor
                                                                .withOpacity(
                                                                    0.15),
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              : const SizedBox(),
                                          TextField(
                                            minLines: 3,
                                            maxLines: 3,
                                            scrollPadding:
                                                const EdgeInsets.only(
                                                    bottom: 180),
                                            cursorColor: AppConfig.blueColor,
                                            controller: controllerComment,
                                            onChanged: (_) {
                                              setState(() {});
                                            },
                                            textCapitalization:
                                                TextCapitalization.sentences,
                                            decoration: const InputDecoration(
                                              contentPadding: EdgeInsets.zero,
                                              border: InputBorder.none,
                                            ),
                                            style: const TextStyle(
                                              fontSize: 13,
                                              color: AppConfig.blueColor,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 17),

                            /// Выбор номера телефона
                            DefaultContainer(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 18),
                                child: Input(
                                  textInputAction: TextInputAction.done,
                                  width: width - 122,
                                  scrollPadding:
                                      const EdgeInsets.only(bottom: 150),
                                  hintText: 'Номер мобильного телефона',
                                  controller: controllerNumber,
                                  keyboardType: TextInputType.number,
                                  textFormatters: [
                                    MaskTextInputFormatter(
                                        mask: '+# ### ### ## ##',
                                        filter: {"#": RegExp(r'[0-9]')})
                                  ],
                                ),
                              ),
                            ),

                            /// Нижний блок [Градиент кнопка]
                            Visibility(
                              visible:
                                  MediaQuery.of(context).viewInsets.bottom != 0,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 24.0),
                                child: GradientButton(
                                    onTap: () async {
                                      await _validateRequiredFields(controller);
                                    },
                                    startColor:
                                        AppConfig.stepsGradientStartThird,
                                    endColor: AppConfig.stepsGradientEndThird,
                                    text: 'Вызвать мастера'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: MediaQuery.of(context).viewInsets.bottom == 0,
                    child: Container(
                      width: width,
                      color: AppConfig.whiteColor,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 22.0, right: 22.0, bottom: 22, top: 12),
                        child: GradientButton(
                            onTap: () async {
                              await _validateRequiredFields(controller);
                            },
                            startColor: AppConfig.stepsGradientStartThird,
                            endColor: AppConfig.stepsGradientEndThird,
                            text: 'Вызвать мастера'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          _loading
              ? SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 3,
                      sigmaY: 3,
                    ),
                    child: const Center(
                      child: CircularProgressIndicator(
                        color: AppConfig.textFieldGradientStart,
                      ),
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }

  Future<void> _validateRequiredFields(GeneralController controller) async {
    int countNotEmptyFields = 0;
    for (int i = 0; i < requiredTextControllers.length; i++) {
      if (requiredTextControllers[i].text.isNotEmpty) {
        countNotEmptyFields++;
      }
    }
    if (countNotEmptyFields == 5 &&
        controllerCity.text != ' ' &&
        controllerStreet.text != ' ' &&
        controllerHome.text != ' ' &&
        controllerFlat.text != ' ' &&
        controllerNumber.text != ' ' &&
        controllerNumber.text.length == 16) {
      controller.orderController.setClientInfo(
        city: controllerCity.text,
        street: controllerStreet.text,
        house: controllerHome.text,
        flat: controllerFlat.text,
        comment: controllerComment.text,
        phone: controllerNumber.text,
      );
      var statusCode = await _postOrderLoading(controller);
      if (statusCode == 200) {
        if (_canVibrate) {
          try {
            Vibrate.feedback(FeedbackType.success);
          } catch (e) {
            // ignore: avoid_print
            print(e);
          }
        }
        Navigator.of(context)
            .push(CustomPageRoute(const SuccessFullOrderPage()));
      } else {
        if (_canVibrate) {
          try {
            Vibrate.feedback(FeedbackType.error);
          } catch (e) {
            // ignore: avoid_print
            print(e);
          }
        }
      }
      return;
    }
    for (int i = 0; i < requiredTextControllers.length; i++) {
      if (requiredTextControllers[i].text.isEmpty) {
        setState(() {
          requiredTextControllers[i].text = ' ';
        });
      }
    }
    await Future.delayed(const Duration(milliseconds: 500));
    for (int i = 0; i < requiredTextControllers.length; i++) {
      if (requiredTextControllers[i].text == ' ') {
        setState(() {
          requiredTextControllers[i].clear();
        });
      }
    }
  }
}
