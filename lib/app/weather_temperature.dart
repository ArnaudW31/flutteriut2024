import 'package:flutter/material.dart';

class WeatherTemperature extends StatelessWidget {
  final int temperature;

  WeatherTemperature({required this.temperature});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final bool isAfternoon = now.hour >= 11;
    final textColor = isAfternoon ? Colors.deepPurple : Colors.lightBlue;
    return Text(
      '${temperature.toStringAsFixed(1)} °C',
      style: TextStyle(fontSize: 60.0, fontWeight: FontWeight.bold, color: textColor),
    );
  }
}