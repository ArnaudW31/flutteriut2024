import 'package:flutter/material.dart';
import 'package:flutteriut2024/root/home/home_root.dart';
import 'package:wave/wave.dart';
import 'package:wave/config.dart';


class weatherApp extends StatelessWidget {
  final double temperature;
  final String weatherConditionCode;

  const weatherApp({required this.temperature, required this.weatherConditionCode, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Météo",
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Colors.greenAccent),
      ),
      home: Stack(
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
                  [Colors.blue, Colors.blue.shade200],
                  [Colors.blue.shade200, Colors.blue.shade100],
                ],
                durations: [19440, 10800],
                heightPercentages: [0.30, 0.35],
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
