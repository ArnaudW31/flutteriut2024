import 'package:flutter/material.dart';
import 'package:flutteriut2024/root/home/home_root.dart';
import 'package:wave/wave.dart';
import 'package:wave/config.dart';


class WeatherApp extends StatelessWidget {
  final double temperature;
  final String weatherConditionCode;

  const WeatherApp({required this.temperature, required this.weatherConditionCode, Key? key}) : super(key: key);

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
                  [Colors.red.shade500, Colors.red.shade500],
                  [Colors.orangeAccent.shade400, Colors.orangeAccent.shade400],
                ],
                durations: [19440, 10800],
                heightPercentages: [0.30, 0.35], // Augmentez ces valeurs pour augmenter la taille des vagues
                gradientBegin: Alignment.bottomLeft,
                gradientEnd: Alignment.topRight,
              ),
              waveAmplitude: 0,
              size: Size(double.infinity, 180),
            ),
          ),
        ],
      ),
    );
  }
}
