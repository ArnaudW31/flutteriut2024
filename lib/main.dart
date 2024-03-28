import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutteriut2024/app/weatherApp.dart';
import 'package:flutteriut2024/db_helper.dart';
import 'package:flutteriut2024/dto/city.dto.dart';
import 'package:flutteriut2024/root/home/cityPage.dart';
import 'package:http/http.dart';

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
  double temperature = 20.0;
  late Future<Weather> futureWeather;

  @override
  void initState() {
    super.initState();
    futureWeather = fetchWeather();
  }


    @override
    Widget build(BuildContext context) {
      return Center(
        child: FutureBuilder<Weather>(
          future: futureWeather,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            // Par défaut, affiche un loader
            final List<Widget> _pages = [
              WeatherApp(temperature: snapshot.data!.temp , weatherConditionCode: "01d"),
              VilleScreen()
            ];

            return Scaffold(
              body: _pages[_currentIndex],
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: _currentIndex,
                onTap: (index) {
                  setState(() {
                    _currentIndex = index;
                    futureWeather = fetchWeather();
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
          },
        ),
      );
    }

  Future<Weather> fetchWeather() async {
    final city = await DbHelper.city();
    final response = await get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?q='+ city[DbHelper.nbVille].nom +'&appid=8b4f5e2e6f178fdbee06ab9f9674904a&units=metric'));
    print(city[DbHelper.nbVille].nom);

    if (response.statusCode == 200) {
      // si serveur retourne une reponse "200 OK", on parse le JSON
      return Weather.fromJson(jsonDecode(response.body));
    } else {
      // si requête échoue, leve une exception
      throw Exception('Failed to load weather data');
    }
  }
}
