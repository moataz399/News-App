// @dart=2.9

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DioHelper {
  static Dio dio;
// String apikey ='4cdd72fc47ba4bf7b8ea2c6157834859';
 //String url ='https://newsapi.org/v2/everything?q=Apple&from=2021-08-01&sortBy=popularity&apiKey=4cdd72fc47ba4bf7b8ea2c6157834859';
  static init() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://newsapi.org/',
      receiveDataWhenStatusError: true,


    ));
  }

  static Future<Response> getData(
      {@required String url, @required Map<String, dynamic> query}) async {
    return await dio.get(url, queryParameters: query);
  }
}
