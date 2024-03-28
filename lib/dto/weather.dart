class Weather {
  final double temp;

  Weather({required this.temp});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      temp: json['main']['temp'],
    );
  }
}