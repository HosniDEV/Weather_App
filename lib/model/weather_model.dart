import 'package:flutter/foundation.dart';
import 'package:weather_app/model/weather.dart';

import 'main_model.dart';
import 'wind_model.dart';

class WeatherModel {
  String? name;
  Wind? wind;
  Main? main;
  Weather? weather;
  int? visibility;
  WeatherModel({
    this.name,
    this.wind,
    this.main,
    this.weather,
    this.visibility,
  });
  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      weather:
          json['weather'] == null ? null : Weather.fromJson(json['weather'][0]),
      name: json['name'],
      visibility: json['visibility'],
      wind: json['wind'] == null ? null : Wind.fromJson(json['wind']),
      main: json['main'] == null ? null : Main.formJson(json['main']),
    );
  }
}
