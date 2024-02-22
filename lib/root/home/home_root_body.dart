import 'package:flutter/material.dart';
import 'package:projet_test2/root/home/square.dart';

class HomeRootBody extends StatelessWidget {
  const HomeRootBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Square(Colors.yellow, height:250),
        Padding(padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Text("Taille : 64cm",style: TextStyle(fontSize: 24)),
                Text("Poids : 18kg",style: TextStyle(fontSize: 24))
            ]),
        ),

      ],

    );
  }
}
