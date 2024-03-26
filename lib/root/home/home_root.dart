import 'package:flutter/material.dart';
import 'package:flutteriut2024/root/home/home_root_body.dart';

class weatherRoot extends StatelessWidget {
  final double temperature;
  final String weatherConditionCode;

  const weatherRoot({required this.temperature, required this.weatherConditionCode, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Météo"),
      ),
      body: weatherRootBody(
        temperature: temperature,
        weatherConditionCode: weatherConditionCode,
      ),
    );
  }
}
