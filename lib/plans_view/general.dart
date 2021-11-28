import 'package:flutter/material.dart';
import 'package:flutter_application_1/choose_services/choose_services.dart';
import 'package:flutter_application_1/models/info_card_model.dart';
import 'package:flutter_application_1/models/point_row.dart';
import 'package:flutter_application_1/plans_view/widgets/gradient_button.dart';
import 'package:flutter_application_1/plans_view/widgets/plan_card.dart';
import 'package:flutter_application_1/plans_view/widgets/plan_position.dart';
import 'package:flutter_application_1/widgets/custom_app_bar.dart';
import 'package:flutter_application_1/widgets/custom_transition.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:swipe/swipe.dart';

class General extends StatefulWidget {
  const General({Key? key}) : super(key: key);
  @override
  _GeneralState createState() => _GeneralState();
}

class _GeneralState extends State<General> {
  late int currentIndex;
  late PageController pageControllerPage;
  late ScrollController pageControllerBackground;
  late List<PointRowModel> pointsList;
  late List<InfoCardModel> cardsList;

  // Стили
  late Color pointGradientStart;
  late Color pointGradientEnd;
  late Color buttonGradientStart;
  late Color buttonGradientEnd;
  late Color stepsGradientStart;
  late Color stepsGradientEnd;

  @override
  void initState() {
    super.initState();
    currentIndex = 0;
    setconfigurationPage(currentIndex);
    pageControllerPage = PageController(initialPage: 0);
    pageControllerBackground = ScrollController(initialScrollOffset: 0.0);
    cardsList = [
      InfoCardModel(
        square: 50,
        price: 1490,
        previousPrice: 1900,
        image: 'lib/assets/images/first_step.png',
      ),
      InfoCardModel(
          square: 70,
          price: 1890,
          previousPrice: 2900,
          image: 'lib/assets/images/second_step.png'),
      InfoCardModel(
          square: 90,
          price: 2390,
          previousPrice: 3700,
          image: 'lib/assets/images/third_step.png'),
    ];
    pointsList = [
      PointRowModel(
        title: 'Все на своих местах',
        description: 'Гарантия сохранности',
        icon: 'lib/assets/images/pen.png',
      ),
      PointRowModel(
        title: 'Воскресим Порядок',
        description: 'Постель заправлена, чистоста',
        icon: 'lib/assets/images/butterfly.png',
        isDoubleColor: true,
      ),
      PointRowModel(
        title: 'Постираем одежду',
        description: 'Морозная свежесть белья',
        icon: 'lib/assets/images/sun.png',
      ),
      PointRowModel(
        title: 'Анигиляция пыл',
        description: 'Kärcher Home & Garden',
        icon: 'lib/assets/images/bird.png',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CustomAppBar(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    /// Карточки с площадью и ценой
                    SizedBox(
                      height: height * 303 / 812,
                      width: width,
                      child: Swipe(
                        onSwipeLeft: () {
                          if (currentIndex < 2) {
                            setPage(currentIndex + 1);
                          }
                        },
                        onSwipeRight: () {
                          if (currentIndex > 0) {
                            setPage(currentIndex - 1);
                          }
                        },
                        child: PageView(
                          physics: const NeverScrollableScrollPhysics(),
                          controller: pageControllerPage,
                          children: List.generate(
                            cardsList.length,
                            (index) => PlanCard(
                              item: cardsList[index],
                            ),
                          ),
                        ),
                      ),
                    ),

                    /// Виджет позиции в PageView
                    Padding(
                      padding: const EdgeInsets.only(left: 139.0, right: 139.0),
                      child: PlanPosition(
                        width: (width - 290) / 3,
                        height: 7,
                        currentIndex: currentIndex,
                        colorStart: stepsGradientStart,
                        colorEnd: stepsGradientEnd,
                      ),
                    ),
                    const SizedBox(height: 21),

                    /// Белый контейнер с подробным описанием и кнопкой
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50),
                          ),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 20,
                              color: const Color(0xff000000).withOpacity(0.05),
                            )
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 22.0, vertical: 32),
                          child: Column(
                            children: [
                              // Пункты
                              Padding(
                                padding: const EdgeInsets.only(left: 14.0),
                                child: Column(
                                  children:
                                      List.generate(pointsList.length, (index) {
                                    return _buildRow(
                                      title: pointsList[index].title,
                                      description:
                                          pointsList[index].description,
                                      emodji: pointsList[index].icon,
                                      startColor: pointGradientStart,
                                      endColor: pointGradientEnd,
                                      isDoubleColor:
                                          pointsList[index].isDoubleColor,
                                    );
                                  }),
                                ),
                              ),
                              const SizedBox(height: 27),

                              // Градиент-кнопка
                              GradientButton(
                                text: 'Продолжить',
                                onTap: () {
                                  Navigator.of(context)
                                      .push(CustomPageRoute(ChooseServices(
                                    currentPrice: cardsList[currentIndex].price,
                                  )));
                                },
                                startColor: buttonGradientStart,
                                endColor: buttonGradientEnd,
                              ),
                              const SizedBox(height: 60),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  void setPage(int index) {
    setState(() {
      currentIndex = index;
      setconfigurationPage(currentIndex);
      pageControllerPage.animateToPage(index,
          duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
    });
  }

  void setconfigurationPage(int index) {
    switch (index) {
      case 0:
        setState(() {
          pointGradientStart = const Color(0xffFFBC8A);
          pointGradientEnd = const Color(0xffE866E5);
          buttonGradientStart = const Color(0xffFFC883);
          buttonGradientEnd = const Color(0xffE967E5);
          stepsGradientStart = const Color(0xffF495C0);
          stepsGradientEnd = const Color(0xffA16EFA);
        });
        break;
      case 1:
        setState(() {
          pointGradientStart = const Color(0xff7494FF);
          pointGradientEnd = const Color(0xff81F5A8);
          buttonGradientStart = const Color(0xff7494FF);
          buttonGradientEnd = const Color(0xff80F0B0);
          stepsGradientStart = const Color(0xff81F5A9);
          stepsGradientEnd = const Color(0xff7495FF);
        });
        break;
      case 2:
        setState(() {
          pointGradientStart = const Color(0xffFF69D3);
          pointGradientEnd = const Color(0xff3DBDFF);
          buttonGradientStart = const Color(0xffFF67D5);
          buttonGradientEnd = const Color(0xff3DBDFF);
          stepsGradientStart = const Color(0xff4FF0FF);
          stepsGradientEnd = const Color(0xffFF60DE);
        });
        break;
      default:
        setState(() {
          pointGradientStart = const Color(0xffFFBC8A);
          pointGradientEnd = const Color(0xffE866E5);
          buttonGradientStart = const Color(0xffFFC883);
          buttonGradientEnd = const Color(0xffE967E5);
          stepsGradientStart = const Color(0xffF495C0);
          stepsGradientEnd = const Color(0xffA16EFA);
        });
        break;
    }
  }

  Widget _buildRow({
    required String title,
    required String description,
    required String emodji,
    required Color startColor,
    required Color endColor,
    bool isDoubleColor = false,
  }) {
    var titleList = title.split(' ');
    return Padding(
      padding: const EdgeInsets.only(bottom: 11.0),
      child: Row(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            height: 35,
            width: 35,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(90),
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      startColor,
                      endColor,
                    ]),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 20,
                    color: const Color(0xff000000).withOpacity(0.05),
                  )
                ]),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: SvgPicture.asset(
                  'lib/assets/images/daw.svg',
                  width: 19,
                  height: 19,
                ),
              ),
            ),
          ),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  isDoubleColor
                      ? RichText(
                          text: TextSpan(children: <TextSpan>[
                          TextSpan(
                            text: '${titleList[0]} ',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          TextSpan(
                            text: titleList[1],
                            style: const TextStyle(
                              fontSize: 14,
                              color: Color(0xff3DBDFF),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ]))
                      : Text(
                          title,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                  const SizedBox(width: 4),
                  Image.asset(
                    emodji,
                    width: 14,
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: TextStyle(
                    color: const Color(0xff000000).withOpacity(0.25),
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              )
            ],
          )
        ],
      ),
    );
  }
}
