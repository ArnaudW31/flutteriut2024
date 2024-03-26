class CityDTO {
  final String nom;

  CityDTO({required this.nom});

  Map<String, dynamic> toJson() {
    return {
      'nom': nom,
    };
  }


}
