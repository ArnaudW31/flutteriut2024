import 'package:flutter/material.dart';
import '../../db_helper.dart'; // Assurez-vous que le chemin d'accès correspond à votre structure de fichiers
import '../../dto/city.dto.dart'; // Assurez-vous que le chemin d'accès correspond à votre structure de fichiers

class VilleScreen extends StatelessWidget {
  final DbHelper helper = DbHelper.initDb();

  VilleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liste des Villes'),
      ),
      body: FutureBuilder<List<CityDTO>>(
        future: helper.city(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text("Erreur lors du chargement"));
          }
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final villes = snapshot.data!;
          return SingleChildScrollView(
            child: Column(
              children: villes.map((ville) => ListTile(title: Text(ville.nom))).toList(),
            ),
          );
        },
      ),
    );
  }
}
