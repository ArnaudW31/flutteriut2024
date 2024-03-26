import 'package:flutter/material.dart';
import 'package:flutteriut2024/app/weatherApp.dart';
import 'package:flutteriut2024/db_helper.dart';
import 'package:flutteriut2024/dto/city.dto.dart';
import 'package:flutteriut2024/root/home/cityPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DbHelper.initDb();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double temperature = 20.0;
    String weatherConditionCode = '01d';

    return MaterialApp(
      title: 'My Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
        title: 'My Flutter App',
        temperature: temperature,
        weatherConditionCode: weatherConditionCode,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title, required this.temperature, required this.weatherConditionCode})
      : super(key: key);

  final String title;
  final double temperature;
  final String weatherConditionCode;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    weatherApp(temperature: 20, weatherConditionCode: "01d"),
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
