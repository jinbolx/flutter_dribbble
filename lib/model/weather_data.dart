// To parse this JSON data, do
//
//     final weatherData = weatherDataFromJson(jsonString);

import 'dart:convert';

WeatherData weatherDataFromJson(String str) => WeatherData.fromJson(json.decode(str));

String weatherDataToJson(WeatherData data) => json.encode(data.toJson());

class WeatherData {
  WeatherData({
    this.heWeather6,
  });

  List<HeWeather6> heWeather6;

  factory WeatherData.fromJson(Map<String, dynamic> json) => WeatherData(
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
    this.now,
    this.dailyForecast,
    this.hourly,
    this.lifestyle,
  });

  Basic basic;
  Update update;
  String status;
  Now now;
  List<DailyForecast> dailyForecast;
  List<Now> hourly;
  List<Lifestyle> lifestyle;

  factory HeWeather6.fromJson(Map<String, dynamic> json) => HeWeather6(
    basic: Basic.fromJson(json["basic"]),
    update: Update.fromJson(json["update"]),
    status: json["status"],
    now: Now.fromJson(json["now"]),
    dailyForecast: List<DailyForecast>.from(json["daily_forecast"].map((x) => DailyForecast.fromJson(x))),
    hourly: List<Now>.from(json["hourly"].map((x) => Now.fromJson(x))),
    lifestyle: List<Lifestyle>.from(json["lifestyle"].map((x) => Lifestyle.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "basic": basic.toJson(),
    "update": update.toJson(),
    "status": status,
    "now": now.toJson(),
    "daily_forecast": List<dynamic>.from(dailyForecast.map((x) => x.toJson())),
    "hourly": List<dynamic>.from(hourly.map((x) => x.toJson())),
    "lifestyle": List<dynamic>.from(lifestyle.map((x) => x.toJson())),
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

class DailyForecast {
  DailyForecast({
    this.condCodeD,
    this.condCodeN,
    this.condTxtD,
    this.condTxtN,
    this.date,
    this.hum,
    this.mr,
    this.ms,
    this.pcpn,
    this.pop,
    this.pres,
    this.sr,
    this.ss,
    this.tmpMax,
    this.tmpMin,
    this.uvIndex,
    this.vis,
    this.windDeg,
    this.windDir,
    this.windSc,
    this.windSpd,
  });

  String condCodeD;
  String condCodeN;
  String condTxtD;
  String condTxtN;
  DateTime date;
  String hum;
  String mr;
  String ms;
  String pcpn;
  String pop;
  String pres;
  String sr;
  String ss;
  String tmpMax;
  String tmpMin;
  String uvIndex;
  String vis;
  String windDeg;
  String windDir;
  String windSc;
  String windSpd;

  factory DailyForecast.fromJson(Map<String, dynamic> json) => DailyForecast(
    condCodeD: json["cond_code_d"],
    condCodeN: json["cond_code_n"],
    condTxtD: json["cond_txt_d"],
    condTxtN: json["cond_txt_n"],
    date: DateTime.parse(json["date"]),
    hum: json["hum"],
    mr: json["mr"],
    ms: json["ms"],
    pcpn: json["pcpn"],
    pop: json["pop"],
    pres: json["pres"],
    sr: json["sr"],
    ss: json["ss"],
    tmpMax: json["tmp_max"],
    tmpMin: json["tmp_min"],
    uvIndex: json["uv_index"],
    vis: json["vis"],
    windDeg: json["wind_deg"],
    windDir: json["wind_dir"],
    windSc: json["wind_sc"],
    windSpd: json["wind_spd"],
  );

  Map<String, dynamic> toJson() => {
    "cond_code_d": condCodeD,
    "cond_code_n": condCodeN,
    "cond_txt_d": condTxtD,
    "cond_txt_n": condTxtN,
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "hum": hum,
    "mr": mr,
    "ms": ms,
    "pcpn": pcpn,
    "pop": pop,
    "pres": pres,
    "sr": sr,
    "ss": ss,
    "tmp_max": tmpMax,
    "tmp_min": tmpMin,
    "uv_index": uvIndex,
    "vis": vis,
    "wind_deg": windDeg,
    "wind_dir": windDir,
    "wind_sc": windSc,
    "wind_spd": windSpd,
  };
}

class Now {
  Now({
    this.cloud,
    this.condCode,
    this.condTxt,
    this.dew,
    this.hum,
    this.pop,
    this.pres,
    this.time,
    this.tmp,
    this.windDeg,
    this.windDir,
    this.windSc,
    this.windSpd,
    this.fl,
    this.pcpn,
    this.vis,
  });

  String cloud;
  String condCode;
  String condTxt;
  String dew;
  String hum;
  String pop;
  String pres;
  String time;
  String tmp;
  String windDeg;
  String windDir;
  String windSc;
  String windSpd;
  String fl;
  String pcpn;
  String vis;

  factory Now.fromJson(Map<String, dynamic> json) => Now(
    cloud: json["cloud"],
    condCode: json["cond_code"],
    condTxt: json["cond_txt"],
    dew: json["dew"] == null ? null : json["dew"],
    hum: json["hum"],
    pop: json["pop"] == null ? null : json["pop"],
    pres: json["pres"],
    time: json["time"] == null ? null : json["time"],
    tmp: json["tmp"],
    windDeg: json["wind_deg"],
    windDir: json["wind_dir"],
    windSc: json["wind_sc"],
    windSpd: json["wind_spd"],
    fl: json["fl"] == null ? null : json["fl"],
    pcpn: json["pcpn"] == null ? null : json["pcpn"],
    vis: json["vis"] == null ? null : json["vis"],
  );

  Map<String, dynamic> toJson() => {
    "cloud": cloud,
    "cond_code": condCode,
    "cond_txt": condTxt,
    "dew": dew == null ? null : dew,
    "hum": hum,
    "pop": pop == null ? null : pop,
    "pres": pres,
    "time": time == null ? null : time,
    "tmp": tmp,
    "wind_deg": windDeg,
    "wind_dir": windDir,
    "wind_sc": windSc,
    "wind_spd": windSpd,
    "fl": fl == null ? null : fl,
    "pcpn": pcpn == null ? null : pcpn,
    "vis": vis == null ? null : vis,
  };
}

class Lifestyle {
  Lifestyle({
    this.type,
    this.brf,
    this.txt,
  });

  String type;
  String brf;
  String txt;

  factory Lifestyle.fromJson(Map<String, dynamic> json) => Lifestyle(
    type: json["type"],
    brf: json["brf"],
    txt: json["txt"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "brf": brf,
    "txt": txt,
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
