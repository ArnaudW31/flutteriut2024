import 'package:flutter/material.dart';
import 'package:flutteriut2024/root/home/home_root.dart';

class weatherApp extends StatelessWidget {
  const weatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title : "Matéo",
        theme: ThemeData(
          appBarTheme : const AppBarTheme(color: Colors.greenAccent),
        ),
        home : const WeatherRoot()
    );
  }
}