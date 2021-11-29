import 'package:flutter/material.dart';
import 'package:flutter_application_1/filling_data/widgets/container_with_star.dart';
import 'package:flutter_application_1/plans_view/widgets/gradient_button.dart';
import 'package:flutter_application_1/widgets/custom_app_bar.dart';
import 'package:flutter_application_1/widgets/default_container.dart';
import 'package:flutter_application_1/filling_data/widgets/input.dart';

class FillingData extends StatefulWidget {
  final int summaryPrice;
  final String currency;
  const FillingData({
    Key? key,
    required this.summaryPrice,
    required this.currency,
  }) : super(key: key);

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

  @override
  void initState() {
    super.initState();
    controllerCity = TextEditingController();
    controllerStreet = TextEditingController();
    controllerHome = TextEditingController();
    controllerFlat = TextEditingController();
    controllerComment = TextEditingController();
    controllerNumber = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            const CustomAppBar(isBackArrow: true),
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
                        padding: const EdgeInsets.symmetric(horizontal: 94),
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
                                cursorColor: const Color(0xFF3DBDFF),
                                keyboardType: TextInputType.number,
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
                                    color: Colors.black.withOpacity(0.15),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: Color(0xFF3DBDFF),
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
                                cursorColor: const Color(0xFF3DBDFF),
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
                                    color: Colors.black.withOpacity(0.15),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: Color(0xFF3DBDFF),
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
                          padding: const EdgeInsets.fromLTRB(18, 12, 12, 13),
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
                                                const EdgeInsets.only(top: 1.0),
                                            child: RichText(
                                              text: TextSpan(
                                                children: <TextSpan>[
                                                  TextSpan(
                                                    text:
                                                        'Волшебное место, где можно написать полезный ',
                                                    style: TextStyle(
                                                      fontSize: 13,
                                                      color: Colors.black
                                                          .withOpacity(0.15),
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                  const TextSpan(
                                                    text: 'комментарий',
                                                    style: TextStyle(
                                                      fontSize: 13,
                                                      color: Color(0xFF3DBDFF),
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text:
                                                        ' для мастера, важные детали, удобное время приема',
                                                    style: TextStyle(
                                                      fontSize: 13,
                                                      color: Colors.black
                                                          .withOpacity(0.15),
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
                                      cursorColor: const Color(0xFF3DBDFF),
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
                                        color: Color(0xFF3DBDFF),
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
                            hintText: 'Номер мобильного телефона',
                            controller: controllerNumber,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ),
                      const SizedBox(height: 21),

                      GradientButton(
                        onTap: () async {},
                        startColor: const Color(0xff4FF0FF),
                        endColor: const Color(0xffFF60DE),
                        richText: RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              const TextSpan(
                                text: 'Мастер за ',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white70,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              TextSpan(
                                text:
                                    '${widget.summaryPrice} ${widget.currency}',
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 60),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
