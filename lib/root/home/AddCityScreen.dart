import 'package:flutter/material.dart';
import '../../db_helper.dart';
import '../../dto/city.dto.dart';

class AddCityScreen extends StatefulWidget {
  const AddCityScreen({super.key});

  @override
  State<AddCityScreen> createState() => _AddCityScreenState();
}

class _AddCityScreenState extends State<AddCityScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajouter une ville'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Champ pour nom de la ville
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Nom de la ville',
                hintText: 'Entrez le nom de la ville',
              ),
            ),
            SizedBox(height: 20), // Un peu d'espace
            // Bouton pour soumettre
            ElevatedButton(
              onPressed: () {
                final String cityName = _controller.text;
                if (cityName.isNotEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Ville ajoutée : $cityName')),
                  );
                  DbHelper.insert(CityDTO(nom: cityName));
                  Navigator.pop(context, true);
                }
              },
              child: Text('Ajouter'),
            ),
          ],
        ),
      ),
    );
  }
}
