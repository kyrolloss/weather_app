import 'dart:convert';

import 'package:dio/dio.dart';

import '../End Points/End Points.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: EndPoint.baseUrl,

      headers: {
        'Content-Type': 'application/json',
        'key': '2c5bd23c241b46dca75103044240903'
      },
    ));
  }

  static Future<Response> getWeather({required String endPoint,
    Map<String, dynamic>? queryParameters}) async {
    try {
      final Response response =
      await dio.get(endPoint, queryParameters: queryParameters);
      return response;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

}
