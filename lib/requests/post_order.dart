import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_application_1/config/config.dart';
import 'package:flutter_application_1/models/services.dart';

Future<dynamic> postOrder({
  required String square,
  required String typeOfCleaning,
  required List<ServicesModel> extras,
  required String city,
  required String street,
  required String house,
  required String flat,
  required String comment,
  required String phone,
  required int totalPrice,
  required String endPoint,
}) async {
  final String url = '${AppConfig.apiUrl}$endPoint';
  BaseOptions options = BaseOptions(
    baseUrl: AppConfig.apiUrl,
    connectTimeout: 10000,
    receiveTimeout: 10000,
  );
  final dioClient = Dio(options);
  final Map<String, dynamic> body = {
    'phone': phone,
    'city': city,
    'street': street,
    'house': house,
    'flat': flat,
    'type_of_cleaning': typeOfCleaning,
    'plan': square,
    'extras': extras.map((v) => v.toJson()).toList(),
    'comment': comment != '' ? comment : null,
    'total_price': totalPrice,
  };
  try {
    final response = await dioClient.post(url, data: jsonEncode(body));
    return response.statusCode;
  } catch (e) {
    // ignore: avoid_print
    print(e);
  }
}
