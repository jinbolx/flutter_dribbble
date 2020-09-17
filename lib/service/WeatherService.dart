import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dribbble/model/weather_data.dart';
import 'package:flutter_dribbble/service/service.dart';

class WeatherService extends Service {
  Future<WeatherData> getWeather({@required String city}) async {
    Response<String> response = await get<String>(
        "/s6/weather?key=2d2a76fac8324146a1b17b68bda42c76&location=$city&lang=",
        cancelToken: cancelToken);
    return _compute(response.data);
  }

  Future<WeatherData> _compute(String data) async =>
      await compute(weatherDataFromJson, data);
}
