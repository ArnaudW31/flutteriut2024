class Weather {
  final int temp;

  Weather({required this.temp});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      temp: json['main']['temp'],
    );
  }
}