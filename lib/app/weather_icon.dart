import 'package:flutter/material.dart';

class WeatherIcon extends StatelessWidget {
  final String weatherConditionCode;

  WeatherIcon({required this.weatherConditionCode});

  String _getIconAsset() {
    switch (weatherConditionCode) {
      case '01d':
        return 'assets/01d.png';
      case '01n':
        return 'assets/01n.png';
      case '02d':
        return 'assets/02d.png';
      case '02n':
        return 'assets/02n.png';
      case '03d':
        return 'assets/03d.png';
      case '03n':
        return 'assets/03n.png';
      case '04d':
        return 'assets/04d.png';
      case '04n':
        return 'assets/04n.png';
      case '09d':
        return 'assets/09d.png';
      case '09n':
        return 'assets/09n.png';
      case '10d':
        return 'assets/10d.png';
      case '10n':
        return 'assets/10n.png';
      case '11d':
        return 'assets/11d.png';
      case '11n':
        return 'assets/11n.png';
      case '13d':
        return 'assets/13d.png';
      case '13n':
        return 'assets/13n.png';
      case '50d':
        return 'assets/50d.png';
      case '50n':
        return 'assets/50n.png';
      default:
        return 'assets/default.png'; // Default image if code not found
    }
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      _getIconAsset(),
      width: 200.0,
      height: 200.0,
      fit: BoxFit.fill,
    );
  }
}