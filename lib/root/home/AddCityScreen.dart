import 'package:flutter/material.dart';

class AddCityScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajouter une ville'),
      ),
      body: Center(
        child: Text('Formulaire d\'ajout de ville ici'),
      ),
    );
  }
}