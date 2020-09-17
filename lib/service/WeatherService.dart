import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dribbble/config/urls.dart';
import 'package:flutter_dribbble/model/weather_air_data.dart';
import 'package:flutter_dribbble/model/weather_data.dart';
import 'package:flutter_dribbble/service/service.dart';

class WeatherService extends Service {
  Future<WeatherData> getWeather({@required String city}) async {
    final Response<String> response = await get(
        "/s6/weather?key=$weather_key&location=$city&lang=",
        cancelToken: cancelToken);
    return _formatWeather(response.data);
  }

  Future<WeatherData> _formatWeather(String data) async =>
      await compute(weatherDataFromJson, data);

  Future<WeatherAirData> getAir({@required String city}) async {
    final Response<String> response = await get(
        "/s6/air/now?key=$weather_key&location=$city&lang=",
        cancelToken: cancelToken);

    return _formatWeatherAirData(response.data);
  }

  Future<WeatherAirData> _formatWeatherAirData(String data) async =>
      await compute(weatherAirDataFromJson, data);
}
