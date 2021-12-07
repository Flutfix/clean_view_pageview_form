import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_application_1/config/config.dart';
import 'package:flutter_application_1/controllers/order_controller.dart';
import 'package:flutter_application_1/models/services.dart';

Future<dynamic> postOrder({
  required String endPoint,
  required StateOrder data,
}) async {
  final String url = '${AppConfig.apiUrl}$endPoint';
  BaseOptions options = BaseOptions(
    baseUrl: AppConfig.apiUrl,
    connectTimeout: 10000,
    receiveTimeout: 10000,
  );
  final dioClient = Dio(options);
  final Map<String, dynamic> body = {
    'phone': data.phone,
    'city': data.city,
    'street': data.street,
    'house': data.house,
    'flat': data.flat,
    'type_of_cleaning': data.typeOfCleaning,
    'plan': data.square,
    'extras': data.extras.map((v) => v.toJson()).toList(),
    'comment': data.comment != '' ? data.comment : null,
    'total_price': data.totalPrice,
  };
  try {
    final response = await dioClient.post(url, data: jsonEncode(body));
    return response.statusCode;
  } catch (e) {
    // ignore: avoid_print
    print(e);
  }
}
