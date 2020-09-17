import 'package:dio/dio.dart';

DioUtl dioUtl = DioUtl();

class DioUtl {
  factory DioUtl() {
    return DioUtl._internal();
  }

  DioUtl._internal() {
    if(dio==null){
      dio=Dio();
      dio.options.baseUrl="https://free-api.heweather.net";
      dio.options.connectTimeout = 60 * 1000;
      dio.options.sendTimeout = 60 * 1000;
      dio.options.receiveTimeout = 60 * 1000;
      dio.interceptors.add(LogInterceptor(
          requestBody: true,
          requestHeader: true,
          request: true,
          responseBody: true,
          responseHeader: true));
    }
  }
  Dio dio;
}
