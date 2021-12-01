import 'package:flutter/material.dart';
import 'package:flutter_application_1/config/config.dart';
import 'package:flutter_application_1/pages/choose_services/widgets/services.dart';
import 'package:flutter_application_1/pages/filling_data/filling_data.dart';
import 'package:flutter_application_1/pages/plans_page_view/widgets/gradient_button.dart';
import 'package:flutter_application_1/widgets/custom_app_bar.dart';
import 'package:flutter_application_1/widgets/custom_transition.dart';
import 'package:flutter_application_1/widgets/default_container.dart';
import 'package:flutter_application_1/models/services.dart';
import 'package:swipe/swipe.dart';

class ChooseServices extends StatefulWidget {
  final int currentPrice;
  const ChooseServices({
    Key? key,
    required this.currentPrice,
  }) : super(key: key);

  @override
  _ChooseServicesState createState() => _ChooseServicesState();
}

class _ChooseServicesState extends State<ChooseServices> {
  late final List<String> cleaningName;
  late final List<ServicesModel> services;
  late int indexServices;
  late int indexColorServices;
  late int currentPrice;

  @override
  void initState() {
    super.initState();
    cleaningName = ['Сухая', 'Влажная', 'Генеральная'];
    services = [
      ServicesModel(name: '1 Окно', price: 390),
      ServicesModel(name: 'Ванная комната', price: 290),
      ServicesModel(name: 'Сан узел', price: 190),
      ServicesModel(name: 'Вывоз мусора', price: 390),
    ];
    currentPrice = widget.currentPrice;
    indexServices = 0;
    indexColorServices = 0;
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Swipe(
      onSwipeRight: () => Navigator.pop(context),
      child: Scaffold(
        backgroundColor: AppConfig.whiteColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const CustomAppBar(isBackArrow: true),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 10),

                      /// Анимация
                      Padding(
                        padding: const EdgeInsets.only(left: 67, right: 66),
                        child: Image.asset(
                            'lib/assets/gif/meditation_mindfulness.gif'),
                      ),
                      const SizedBox(height: 57),

                      /// Вид уборки
                      DefaultContainer(
                        child: Stack(
                          children: [
                            Row(
                              children: [
                                GestureDetector(
                                  behavior: HitTestBehavior.translucent,
                                  onTap: () {
                                    setState(() {
                                      indexServices = 0;
                                      indexColorServices = 0;
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 11, bottom: 15),
                                    child: SizedBox(
                                      width: (width - 44) / 3,
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          cleaningName[0],
                                          style: const TextStyle(
                                            fontSize: 13,
                                            color: AppConfig.pinkColor,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  behavior: HitTestBehavior.translucent,
                                  onTap: () {
                                    setState(() {
                                      indexServices = 1;
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 11, bottom: 15),
                                    child: SizedBox(
                                      width: (width - 44) / 3,
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          cleaningName[1],
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: indexColorServices == 0
                                                ? AppConfig.pinkColor
                                                : AppConfig.blueColor,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  behavior: HitTestBehavior.translucent,
                                  onTap: () {
                                    setState(() {
                                      indexServices = 2;
                                      indexColorServices = 2;
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 11, bottom: 15),
                                    child: SizedBox(
                                      width: (width - 44) / 3,
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          cleaningName[2],
                                          style: const TextStyle(
                                            fontSize: 13,
                                            color: AppConfig.blueColor,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            AnimatedAlign(
                              duration: const Duration(milliseconds: 300),
                              alignment: indexServices == 0
                                  ? Alignment.centerLeft
                                  : indexServices == 1
                                      ? Alignment.center
                                      : Alignment.topRight,
                              child: Container(
                                width: (width - 44) / 3,
                                padding:
                                    const EdgeInsets.only(top: 11, bottom: 14),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(34),
                                  gradient: const LinearGradient(
                                    colors: [
                                      AppConfig.textFieldGradientStart,
                                      AppConfig.textFieldGradientEnd,
                                    ],
                                  ),
                                ),
                                child: Text(
                                  cleaningName[indexServices],
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: AppConfig.whiteColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 17),

                      ///Дополнительные услуги
                      Column(
                        children: List.generate(
                          4,
                          (index) {
                            return Column(
                              children: [
                                DefaultContainer(
                                  child: Services(
                                    services: services[index],
                                    width: (width - 44) / 3,
                                    maxCount: index == 2 ? 2 : null,
                                    isGarbageCollection:
                                        index == 3 ? true : false,
                                    onTap: (dopCount) {
                                      setState(() {
                                        currentPrice += dopCount;
                                      });
                                    },
                                  ),
                                ),
                                const SizedBox(height: 17),
                              ],
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 60),
                    ],
                  ),
                ),
              ),
            ),

            /// Нижний блок [Градиент кнопка]
            Container(
              width: width,
              color: AppConfig.whiteColor,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 22.0, vertical: 12),
                child: GradientButton(
                  text: 'Продолжить',
                  startColor: AppConfig.stepsGradientStartThird,
                  endColor: AppConfig.stepsGradientEndThird,
                  onTap: () {
                    Navigator.of(context).push(
                      CustomPageRoute(
                        FillingData(
                          summaryPrice: currentPrice,
                          currency: services[0].currency,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
