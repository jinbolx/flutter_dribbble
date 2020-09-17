import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter_dribbble/config/urls.dart';

import 'cookieUtils.dart';

HttpUtil httpUtil = HttpUtil();

class HttpUtil {
  static HttpUtil _httpUtil;

  factory HttpUtil() {
    if (_httpUtil == null) {
      return HttpUtil._internal();
    }
    return _httpUtil;
  }

  HttpUtil._internal() {
    init();
  }

  void init() async {
    if (_dio == null) {
      _dio = Dio();
      _dio.options.baseUrl = Urls.app_url;
      _dio.options.connectTimeout = 600 * 1000;
      _dio.options.sendTimeout = 600 * 1000;
      _dio.options.receiveTimeout = 600 * 1000;
      _dio.interceptors.add(LogInterceptor(
          requestBody: true,
          requestHeader: true,
          request: true,
          responseBody: true,
          responseHeader: true));
//      _dio.interceptors.add(CustomInterceptor());
      (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (client) {
        // config the http client
        client.findProxy = (uri) {
          //proxy all request to localhost:8888
//            return "PROXY 192.168.2.11:8888";
          return "PROXY 192.168.31.112:8888";
        };
        // you can also create a HttpClient to dio
        // return HttpClient();
      };
    }
  }

  Dio _dio;

  Future<Response> get(String url, {Map<String, dynamic> params}) async {
    _dio.interceptors.add(CookieManager(CookiesUtils.getCookieJar()));
    Response response;
    try {
      if (params == null) {
        response = await _dio.get(url);
      } else {
        response = await _dio.get(url, queryParameters: params);
      }
      return response;
    } catch (e) {
      return null;
    }
  }

  Future<Response> post(url,
      {dynamic formData, Map<String, dynamic> params}) async {
    // var cookieJar= await CookiesUtils.getCookieJar();
    _dio.interceptors.add(CookieManager(CookiesUtils.getCookieJar()));
    Response response;
    try {
      if (formData != null) {
        response = await _dio.post(url, data: formData);
      } else if (params != null) {
        response = await _dio.post(url, queryParameters: params);
      } else {
        response = await _dio.post(url);
      }
      print(response.toString());
      return response;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
