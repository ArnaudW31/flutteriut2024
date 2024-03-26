import 'package:flutter/material.dart';
import '../../db_helper.dart';
import '../../dto/city.dto.dart';

class VilleScreen extends StatelessWidget {


  VilleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return FutureBuilder<List<CityDTO>>(
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
              //get your item data here ...
              return Card(
                child: ListTile(
                  title: Text(
                      snapshot.data![position].nom),
                ),
              );
            }
          );
        },
      );
  }
}
