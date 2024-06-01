import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WeatherTemperature extends StatelessWidget {
  final int temperature;

  WeatherTemperature({required this.temperature});

  @override
  Widget build(BuildContext context) {
    return Text(
      '${temperature.toStringAsFixed(1)} °C',
      style: GoogleFonts.ubuntu(textStyle:TextStyle(fontSize: 60.0, fontWeight: FontWeight.bold, color: Colors.deepOrange)),
    );
  }
}