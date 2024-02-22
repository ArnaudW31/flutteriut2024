import 'package:flutter/material.dart';
import 'package:projet_test2/root/home/home_root_body.dart';

class HomeRoot extends StatelessWidget {
  const HomeRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Title")
      ),
      body: HomeRootBody(),
    );
  }
}
