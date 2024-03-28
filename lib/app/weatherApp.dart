import 'package:flutter/material.dart';
import 'package:flutteriut2024/root/home/home_root.dart';

class weatherApp extends StatelessWidget {
  final double temperature;
  final String weatherConditionCode;

  const weatherApp({required this.temperature, required this.weatherConditionCode, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text("Météo")),
      body: weatherRoot(
        temperature: temperature,
        weatherConditionCode: weatherConditionCode,
      ),
    );
  }
}
