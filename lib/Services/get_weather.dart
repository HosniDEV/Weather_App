import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/weather_model.dart';

class getWeather {
  Future<WeatherModel> getData(String city) async {
    //  https://api.openweathermap.org/data/2.5/weather?q=casablanca&appid=}
    final parametreq = {
      'q': city,
      'appid': '9adaaae40bf8560aa2bf3087fecae496',
      'units': 'imperial'
    };
    final uri =
        Uri.https('api.openweathermap.org', '/data/2.5/weather', parametreq);
    var response = await http.get(uri);

    final json = jsonDecode(response.body);
    if (response.statusCode == 200) {
      final data = WeatherModel.fromJson(json);

      return data;
    } else {
      throw ('failed to connect');
    }
  }
}
