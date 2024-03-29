import 'package:flutter/material.dart';
import 'package:flutteriut2024/db_helper.dart';
import 'package:flutteriut2024/root/home/home_root.dart';
import 'package:wave/wave.dart';
import 'package:wave/config.dart';

class WeatherApp extends StatelessWidget {
  final double temperature;
  final String weatherConditionCode;
  final String ville;

  const WeatherApp({required this.temperature, required this.weatherConditionCode, required this.ville, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Météo"),
      ),
      body: Stack(
        children: [
          weatherRoot(
            temperature: temperature,
            weatherConditionCode: weatherConditionCode,
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: WaveWidget(
              config: CustomConfig(
                gradients: [
                  [Colors.blue, Colors.lightGreenAccent],
                  [Colors.blueGrey, Colors.lightBlueAccent],
                ],
                durations: [10000, 8000],
                heightPercentages: [0.2, 0.4],
                gradientBegin: Alignment.bottomLeft,
                gradientEnd: Alignment.topRight,
              ),
              waveAmplitude: 30,
              size: Size(double.infinity, 200),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 80),
              child: Text(
                ville,
                style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrange,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
