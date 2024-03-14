import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutteriut2024/dto/city.dto.dart'; // Assurez-vous que le chemin d'accès correspond à votre structure de fichiers

class DatabaseHelper {
  static const _databaseName = "ville.db";
  static const _databaseVersion = 1;
  static const table = 'ville_table';
  static const columnId = 'id';
  static const columnNom = 'nom';

  // Faire de cette classe un singleton
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
            $columnNom TEXT NOT NULL
          )
          ''');
  }

  // Ajouter une ville à la base de données
  Future<void> insertVille(Ville ville) async {
    Database db = await database;
    await db.insert(
      table,
      ville.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Récupérer toutes les villes
  Future<List<Ville>> ville() async {
    Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query(table);
    return List.generate(maps.length, (i) {
      return Ville.fromMap(maps[i]);
    });
  }
}
