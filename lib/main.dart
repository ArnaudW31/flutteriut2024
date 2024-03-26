import 'package:flutter/material.dart';
import 'package:flutteriut2024/app/weatherApp.dart';
import 'package:flutteriut2024/root/home/cityPage.dart';
import 'package:flutteriut2024/db_helper.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    DbHelper.initDb();
    double temperature = 20.0;
    String weatherConditionCode = '01d';

    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
        temperature: temperature,
        weatherConditionCode: weatherConditionCode,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.temperature, required this.weatherConditionCode})
      : super(key: key);

  final double temperature;
  final String weatherConditionCode;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    weatherApp(temperature: 20, weatherConditionCode: "01d"),
    VilleScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.cloud),
            label: 'Météo',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_city),
            label: 'Villes',
          ),
        ],
      ),
    );
  }
}
