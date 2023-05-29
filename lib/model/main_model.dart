class Main {
  double? temp, feelsLike, tempMin, tempMax;
  int? pressure, humidity;
  Main({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.humidity,
  });
  factory Main.formJson(Map<String, dynamic> json) {
    return Main(
      feelsLike: json['feels_like'],
      temp: json['temp'],
      tempMin: json['temp_min'],
      tempMax: json['temp_max'],
      pressure: json['pressure'],
      humidity: json['humidity'],
    );
  }
}
