import 'package:flutter/material.dart';

class AppConfig {
  // Брэнд
  static const String logo = 'Super Clean';

  /// Валюта
  static const String currency = 'руб';
  static const String currencySymbol = '₽';

  /*------------------Цвета-----------------------------*/
  ///Базовые
  static const Color whiteColor = Colors.white;
  static const Color blackColor = Colors.black;
  static const Color pinkColor = Color(0xFFF59CEC);
  static const Color blueColor = Color(0xFF3DBDFF);

  // Трекер позиции в PageView
  static const Color planPositionDefaultColor = Color(0xFFD8D8D8);

  /// Обязательное поле
  static const Color textFieldEmptyColor = Color(0xFFD9D9D9);
  static const Color textFieldGradientStart = Color(0xFFF59CEC);
  static const Color textFieldGradientEnd = Color(0xFF3DBDFF);

  /// 1 страница градиенты
  static const Color pointGradientStartFirst = Color(0xffFFBC8A);
  static const Color pointGradientEndFirst = Color(0xffE866E5);
  static const Color buttonGradientStartFirst = Color(0xffFFC883);
  static const Color buttonGradientEndFirst = Color(0xffE967E5);
  static const Color stepsGradientStartFirst = Color(0xffF495C0);
  static const Color stepsGradientEndFirst = Color(0xffA16EFA);

  /// 2 страница градиенты
  static const Color pointGradientStartSecond = Color(0xff7494FF);
  static const Color pointGradientEndSecond = Color(0xff81F5A8);
  static const Color buttonGradientStartSecond = Color(0xff7494FF);
  static const Color buttonGradientEndSecond = Color(0xff80F0B0);
  static const Color stepsGradientStartSecond = Color(0xff81F5A9);
  static const Color stepsGradientEndSecond = Color(0xff7495FF);

  /// 3 страница градиенты
  static const Color pointGradientStartThird = Color(0xffFF69D3);
  static const Color pointGradientEndThird = Color(0xff3DBDFF);
  static const Color buttonGradientStartThird = Color(0xffFF67D5);
  static const Color buttonGradientEndThird = Color(0xff3DBDFF);
  static const Color stepsGradientStartThird = Color(0xff4FF0FF);
  static const Color stepsGradientEndThird = Color(0xffFF60DE);
}
