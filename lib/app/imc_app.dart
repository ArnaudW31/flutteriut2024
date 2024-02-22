import 'package:flutter/material.dart';
import 'package:projet_test2/root/home/home_root.dart';

class imcApp extends StatelessWidget {
  const imcApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title : "Calculator de fou",
      theme: ThemeData(
        appBarTheme : const AppBarTheme(color: Colors.greenAccent),
      ),
      home : const HomeRoot()
    );
  }
}
