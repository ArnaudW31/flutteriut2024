import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../dto/city.dto.dart';

class DbHelper{
  static const String _dbName = 'city.db';
  static const int _dbVersion = 3;
  static int nbVille = 0;
  static String cityName = "";
  static Database? _db;

  static initDb() async {
    print('initDb');
    final String dbPath = await getDatabasesPath();
    final String path = dbPath + _dbName;
    final Database database = await openDatabase(join(await getDatabasesPath(), 'city_db.db'),
        version: _dbVersion, onCreate: _onCreate, onUpgrade: _onUpgrade);
    _db = database;
    var isOpen = _db?.isOpen;
    print('db is Open: $isOpen');
  }




  static const String tableName = 'villes';

  static const String createTable = '''
  CREATE Table if not exists $tableName (
    id INTEGER PRIMARY KEY AUTOINCREMENT Not Null,
    nom varchar Not null
  ) ''';


  static const String dropTable = '''
  DROP TABLE IF EXISTS user ''';




  static _onCreate(Database db, int version) {
    return db.execute(createTable);
  }

  static _onUpgrade(Database db, int oldVersion, int newVersion) {
    return db.execute(dropTable);

    _onCreate(db, newVersion);
  }

  static void insert(CityDTO w){
    nbVille++;
    final Map<String, dynamic> wordAsMap = w.toJson();
    _db!.insert(tableName, w.toJson());
  }

  static Future<List<CityDTO>> city() async {
    // Get a reference to the database.
    final db = _db;

    // Query the table for all the dogs.
    final List<Map<String, Object?>> resultSet = await _db!.query(tableName);
    if (resultSet.isEmpty) {
      return [];
    }

    // Convert the list of each dog's fields into a list of `Dog` objects.
    return [
      for (final {
      'nom': nom as String,
      } in resultSet)
        CityDTO(nom: nom,),
    ];
  }

  /// Supprimer une ligne de la table par son uid
  static Future<void> delete(String name) async {
    await _db!.delete(tableName, where: 'nom = ?', whereArgs: [name]);
  }

}