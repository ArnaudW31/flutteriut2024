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
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: VilleScreen());
    }
}