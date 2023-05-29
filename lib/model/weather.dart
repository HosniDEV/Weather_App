class Weather {
  String? icon;
  String? description;
  String? main;

  Weather({
    this.icon,
    this.description,
    this.main,
  });
  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      icon: json['icon'],
      description: json['description'],
      main: json['main'],
    );
  }
}
