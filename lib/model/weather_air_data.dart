// To parse this JSON data, do
//
//     final weatherAirData = weatherAirDataFromJson(jsonString);

import 'dart:convert';

WeatherAirData weatherAirDataFromJson(String str) => WeatherAirData.fromJson(json.decode(str));

String weatherAirDataToJson(WeatherAirData data) => json.encode(data.toJson());

class WeatherAirData {
  WeatherAirData({
    this.heWeather6,
  });

  List<HeWeather6> heWeather6;

  factory WeatherAirData.fromJson(Map<String, dynamic> json) => WeatherAirData(
    heWeather6: List<HeWeather6>.from(json["HeWeather6"].map((x) => HeWeather6.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "HeWeather6": List<dynamic>.from(heWeather6.map((x) => x.toJson())),
  };
}

class HeWeather6 {
  HeWeather6({
    this.basic,
    this.update,
    this.status,
    this.airNowCity,
    this.airNowStation,
  });

  Basic basic;
  Update update;
  String status;
  AirNowCity airNowCity;
  List<AirNowStation> airNowStation;

  factory HeWeather6.fromJson(Map<String, dynamic> json) => HeWeather6(
    basic: Basic.fromJson(json["basic"]),
    update: Update.fromJson(json["update"]),
    status: json["status"],
    airNowCity: AirNowCity.fromJson(json["air_now_city"]),
    airNowStation: List<AirNowStation>.from(json["air_now_station"].map((x) => AirNowStation.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "basic": basic.toJson(),
    "update": update.toJson(),
    "status": status,
    "air_now_city": airNowCity.toJson(),
    "air_now_station": List<dynamic>.from(airNowStation.map((x) => x.toJson())),
  };
}

class AirNowCity {
  AirNowCity({
    this.aqi,
    this.qlty,
    this.main,
    this.pm25,
    this.pm10,
    this.no2,
    this.so2,
    this.co,
    this.o3,
    this.pubTime,
  });

  String aqi;
  String qlty;
  String main;
  String pm25;
  String pm10;
  String no2;
  String so2;
  String co;
  String o3;
  String pubTime;

  factory AirNowCity.fromJson(Map<String, dynamic> json) => AirNowCity(
    aqi: json["aqi"],
    qlty: json["qlty"],
    main: json["main"],
    pm25: json["pm25"],
    pm10: json["pm10"],
    no2: json["no2"],
    so2: json["so2"],
    co: json["co"],
    o3: json["o3"],
    pubTime: json["pub_time"],
  );

  Map<String, dynamic> toJson() => {
    "aqi": aqi,
    "qlty": qlty,
    "main": main,
    "pm25": pm25,
    "pm10": pm10,
    "no2": no2,
    "so2": so2,
    "co": co,
    "o3": o3,
    "pub_time": pubTime,
  };
}

class AirNowStation {
  AirNowStation({
    this.airSta,
    this.aqi,
    this.asid,
    this.co,
    this.lat,
    this.lon,
    this.main,
    this.no2,
    this.o3,
    this.pm10,
    this.pm25,
    this.pubTime,
    this.qlty,
    this.so2,
  });

  String airSta;
  String aqi;
  String asid;
  String co;
  String lat;
  String lon;
  String main;
  String no2;
  String o3;
  String pm10;
  String pm25;
  String pubTime;
  String qlty;
  String so2;

  factory AirNowStation.fromJson(Map<String, dynamic> json) => AirNowStation(
    airSta: json["air_sta"],
    aqi: json["aqi"],
    asid: json["asid"],
    co: json["co"],
    lat: json["lat"],
    lon: json["lon"],
    main: json["main"],
    no2: json["no2"],
    o3: json["o3"],
    pm10: json["pm10"],
    pm25: json["pm25"],
    pubTime: json["pub_time"],
    qlty: json["qlty"],
    so2: json["so2"],
  );

  Map<String, dynamic> toJson() => {
    "air_sta": airSta,
    "aqi": aqi,
    "asid": asid,
    "co": co,
    "lat": lat,
    "lon": lon,
    "main": main,
    "no2": no2,
    "o3": o3,
    "pm10": pm10,
    "pm25": pm25,
    "pub_time": pubTime,
    "qlty": qlty,
    "so2": so2,
  };
}

class Basic {
  Basic({
    this.cid,
    this.location,
    this.parentCity,
    this.adminArea,
    this.cnty,
    this.lat,
    this.lon,
    this.tz,
  });

  String cid;
  String location;
  String parentCity;
  String adminArea;
  String cnty;
  String lat;
  String lon;
  String tz;

  factory Basic.fromJson(Map<String, dynamic> json) => Basic(
    cid: json["cid"],
    location: json["location"],
    parentCity: json["parent_city"],
    adminArea: json["admin_area"],
    cnty: json["cnty"],
    lat: json["lat"],
    lon: json["lon"],
    tz: json["tz"],
  );

  Map<String, dynamic> toJson() => {
    "cid": cid,
    "location": location,
    "parent_city": parentCity,
    "admin_area": adminArea,
    "cnty": cnty,
    "lat": lat,
    "lon": lon,
    "tz": tz,
  };
}

class Update {
  Update({
    this.loc,
    this.utc,
  });

  String loc;
  String utc;

  factory Update.fromJson(Map<String, dynamic> json) => Update(
    loc: json["loc"],
    utc: json["utc"],
  );

  Map<String, dynamic> toJson() => {
    "loc": loc,
    "utc": utc,
  };
}
