import 'package:flutter/services.dart';

class Wind {
  var speed;
  int? deg;
  Wind({
    this.speed,
    this.deg,
  });
  factory Wind.fromJson(Map<String, dynamic> json) {
    return Wind(
      speed: json['speed'],
      deg: json['deg'],
    );
  }
}
