import 'package:flutter/material.dart';

class AddCityScreen extends StatefulWidget {
  @override
  _AddCityScreenState createState() => _AddCityScreenState();
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
                // Arnaud ajoute ici la méthode d'insert en bdd stp
                final String cityName = _controller.text;
                if (cityName.isNotEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Ville ajoutée : $cityName'),
                    ),
                  );
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
