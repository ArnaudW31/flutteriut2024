import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'cityPage.dart';
import 'package:flutteriut2024/app/weather_icon.dart';
import 'package:flutteriut2024/app/weather_temperature.dart';


class weatherRoot extends StatelessWidget {
  final double temperature;
  final String weatherConditionCode;

  weatherRoot(
      {required this.temperature, required this.weatherConditionCode});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.orange,
            Colors.white,
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
