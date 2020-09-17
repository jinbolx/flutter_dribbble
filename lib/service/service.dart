library services;
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dribbble/net/dio_util.dart';

abstract class Service {
  final cancelToken = CancelToken();

  Dio dio = dioUtl.dio;

  @protected
  Future<Response<T>> get<T>(String path,
      {Map<String, dynamic> params,
      Options options,
      CancelToken cancelToken,
      ProgressCallback callback}) async {
    Response<T> response = await dio.get(path,
        queryParameters: params,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: callback);
    return response;
  }
}
