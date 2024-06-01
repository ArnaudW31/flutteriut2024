import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'cityPage.dart';
import 'package:flutteriut2024/app/weather_icon.dart';
import 'package:flutteriut2024/app/weather_temperature.dart';


class weatherRoot extends StatelessWidget {
  final int temperature;
  final String weatherConditionCode;

  weatherRoot(
      {required this.temperature, required this.weatherConditionCode});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final bool isAfternoon = now.hour >= 11;

    // Définir les couleurs en fonction de l'heure
    final backgroundTopColor = isAfternoon ? Colors.black : Colors.blue;
    final backgroundBottomColor = isAfternoon ? Colors.deepPurple : Colors.white;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            backgroundTopColor,
            backgroundBottomColor,
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          WeatherIcon(weatherConditionCode: weatherConditionCode),
          WeatherTemperature(temperature: temperature),
        ],
      ),
      width: double.infinity,
      height: double.infinity,
    );
  }
}
