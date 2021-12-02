import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/services.dart';
import 'package:rxdart/rxdart.dart';

class StateOrder {
  StateOrder({
    required this.square,
    required this.typeOfCleaning,
    required this.extras,
    required this.city,
    required this.street,
    required this.house,
    required this.flat,
    required this.comment,
    required this.phone,
    required this.totalPrice,
  });

  final String square;
  final String typeOfCleaning;
  final List<ServicesModel> extras;
  final String city;
  final String street;
  final String house;
  final String flat;
  final String comment;
  final String phone;
  final int totalPrice;
}

class OrderController {
  OrderController({required this.navigatorKeyOrder});

  final GlobalKey<NavigatorState> navigatorKeyOrder;

  late String _square;
  late String _typeOfCleaning;
  late List<ServicesModel> _extras;
  late String _city;
  late String _street;
  late String _house;
  late String _flat;
  late String _comment;
  late String _phone;
  late int _totalPrice;

  final BehaviorSubject<StateOrder> _controllerOrder = BehaviorSubject();
  StateOrder? get data => _controllerOrder.valueOrNull;
  get streamFoods => _controllerOrder.stream;

  void init() {
    _square = '';
    _typeOfCleaning = '';
    _extras = [];
    _city = '';
    _street = '';
    _house = '';
    _flat = '';
    _comment = '';
    _phone = '';
    _totalPrice = 0;
    setState();
  }

  /// Установить выбранную площадь
  void setSquare({required int index}) {
    switch (index) {
      case 0:
        _square = '50 м2';
        break;
      case 1:
        _square = '70 м2';
        break;
      case 2:
        _square = '90 м2';
        break;
    }
    setState();
  }

  /// Установить тип уборки
  void setTypeOfCleaning({required int index}) {
    switch (index) {
      case 0:
        _typeOfCleaning = 'Сухая';
        break;
      case 1:
        _typeOfCleaning = 'Влажная';

        break;
      case 2:
        _typeOfCleaning = 'Генеральная';

        break;
      default:
        _typeOfCleaning = 'Влажная';
    }
    setState();
  }

  /// Установить выбранный доп
  void addService({required ServicesModel extras}) {
    _extras.add(extras);
    setState();
  }

  /// Удалить пустые допы
  void removeService({required ServicesModel extras}) {
    _extras.removeWhere((element) => extras.name == element.name);
    setState();
  }

  /// Установить ифо о клиенте
  void setClientInfo({
    required String city,
    required String street,
    required String house,
    required String flat,
    required String comment,
    required String phone,
    required int totalPrice,
  }) {
    _city = city;
    _street = street;
    _house = house;
    _flat = flat;
    _comment = comment;
    _phone = phone;
    _totalPrice = _totalPrice;
    setState();
  }

  ///GENERAL
  void setState() {
    StateOrder state = StateOrder(
      square: _square,
      typeOfCleaning: _typeOfCleaning,
      extras: _extras,
      city: _city,
      street: _street,
      house: _house,
      flat: _flat,
      comment: _comment,
      phone: _phone,
      totalPrice: _totalPrice,
    );
    _controllerOrder.sink.add(state);
  }

  void dispose() {
    _controllerOrder.close();
  }
}
