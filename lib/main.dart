import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutteriut2024/app/weatherScreen.dart';
import 'package:flutteriut2024/db_helper.dart';
import 'package:flutteriut2024/root/home/AddCityScreen.dart';
import 'package:flutteriut2024/root/home/cityPage.dart';

import 'dto/weather.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DbHelper.initDb();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int temperature = 20;
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
  const MyHomePage(
      {Key? key,
      required this.title,
      required this.temperature,
      required this.weatherConditionCode})
      : super(key: key);

  final String title;
  final int temperature;
  final String weatherConditionCode;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  int temperature = 20;
  String ville = "";
  late Future<Weather> futureWeather;

  final List<Widget> _pages = [WeatherScreen(), VilleScreen()];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Scaffold(
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
      floatingActionButton: _currentIndex == 0 ? null : FloatingActionButton(
        onPressed: () async {
          // Utiliser Navigator.push pour naviguer vers AddCityScreen
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddCityScreen()),
          );
          setState(() {
          });
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.orange[200],
      ),
    ));
  }
}
