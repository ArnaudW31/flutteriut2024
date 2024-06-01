import 'dart:math';

class Weather {
  final int temp;
  final String icon;

  Weather({required this.temp, required this.icon});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      temp: json['main']['temp'].round(),
      icon: json['weather'][0]['icon'],
    );
  }
}