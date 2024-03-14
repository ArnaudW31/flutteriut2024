class CityDTO {
  final int? id;
  final String nom;

  CityDTO({this.id, required this.nom});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nom': nom,
    };
  }


}
