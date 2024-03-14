import 'package:flutter/material.dart';
import 'package:flutteriut2024/root/home/home_root_body.dart';

class WeatherRoot extends StatelessWidget {
  const WeatherRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Title")
      ),
      body: WeatherRootBody(),
    );
  }
}
