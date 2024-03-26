import 'package:flutter/material.dart';
import '../../db_helper.dart';
import '../../dto/city.dto.dart';
import 'AddCityScreen.dart';

class VilleScreen extends StatefulWidget {

  @override
  _VilleScreen createState() => _VilleScreen();
}

class _VilleScreen extends State<VilleScreen>{

  @override
  Widget build(BuildContext context) {
    // Utilisation de Scaffold pour ajouter un FloatingActionButton
    return Scaffold(
      body: FutureBuilder<List<CityDTO>>(
        future: DbHelper.city(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text("Erreur lors du chargement"));
          }
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (_, int position) {
              final item = snapshot.data![position];
              return Card(
                child: ListTile(
                  title: Text(snapshot.data![position].nom),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
            // Utiliser Navigator.push pour naviguer vers AddCityScreen
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddCityScreen()),
            );
          },
        child: Icon(Icons.add),
        backgroundColor: Colors.orange[200],
      ),
    );
  }
}