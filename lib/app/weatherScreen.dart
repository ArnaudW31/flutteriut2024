import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutteriut2024/db_helper.dart';
import 'package:flutteriut2024/root/home/home_root.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:wave/wave.dart';
import 'package:wave/config.dart';

import '../dto/weather.dart';

class WeatherScreen extends StatelessWidget {

  const WeatherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return FutureBuilder<Weather>(
        future: fetchWeather(),
      builder: (context, snapshot) {
          int temperatureGet = 0;
          String cityGet;
        if (snapshot.hasError) {
          if(snapshot.error?.toString() == 'No city found') {
            cityGet = "Veuillez ajouter une ville !";
          }
          else{
            cityGet = DbHelper.cityName; 
          }
        }
        else if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        else{
          temperatureGet = snapshot.data!.temp ?? 0;
          cityGet = DbHelper.cityName;
        }
        return Stack(

          children: [
            weatherRoot(
              temperature: temperatureGet,
              weatherConditionCode: "01d",
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: WaveWidget(
                config: CustomConfig(
                  gradients: [
                    [Colors.orange, Colors.yellowAccent],
                    [Colors.red, Colors.orangeAccent],
                  ],
                  durations: [10000, 8000],
                  heightPercentages: [0.2, 0.4],
                  gradientBegin: Alignment.bottomLeft,
                  gradientEnd: Alignment.topRight,
                ),
                waveAmplitude: 30,
                size: Size(double.infinity, 200),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 80),
                child: Text(
                  cityGet,
                  textAlign: TextAlign.center,
                    style: GoogleFonts.ubuntu(textStyle:TextStyle(fontSize: 60.0, fontWeight: FontWeight.bold, color: Colors.deepOrange)
                  ),
                ),
              ),
            ),
          ],
        );
      }
      );
  }

  Future<String> getCityName() async{
    final city = await DbHelper.city();
    if(city.isEmpty){
      return "pas de ville";
    }
    else {
      return city[DbHelper.nbVille].nom;
    }
  }


  Future<Weather> fetchWeather() async {
    String cityGet = await getCityName();
    if(cityGet == "pas de ville"){
      throw Exception('No city found');
    }
    DbHelper.cityName = cityGet;
    final response = await get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?q='+ DbHelper.cityName +'&appid=8b4f5e2e6f178fdbee06ab9f9674904a&units=metric'));
    if (response.statusCode == 200) {
      // si serveur retourne une reponse "200 OK", on parse le JSON
      return Weather.fromJson(jsonDecode(response.body));
    } else {
      // si requête échoue, leve une exception
      throw Exception('Failed to load weather data');
    }
  }
}
