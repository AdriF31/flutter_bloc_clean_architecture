import 'package:dio/dio.dart';

import '../const/const_value.dart';

class NetworkCore{
  Dio dio = Dio();

  NetworkCore() {
    dio.options = BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: 30000,
        receiveTimeout: 30000,
        sendTimeout: 30000,
        headers: {"Accept": "application/json"});
    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
  }
}