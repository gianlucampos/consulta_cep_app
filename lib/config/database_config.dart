import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseConfig {
  static Database? _database;

  static Database? get database => _database;

  DatabaseConfig() {
    if (_database == null) {
      _initDB().then((value) => _database = value);
    }
  }

  static Future<Database> _initDB() async {
    final caminhoBanco = await getDatabasesPath();
    final path = join(caminhoBanco, 'cep_database.db');
    return await openDatabase(path, onCreate: _onCreate, version: 1);
  }

  static _onCreate(Database db, int version) async {
    await db.execute('CREATE TABLE ENDERECO ( '
        'id INTEGER PRIMARY KEY AUTOINCREMENT, '
        'cep TEXT, '
        'logradouro TEXT, '
        'complemento TEXT, '
        'bairro TEXT, '
        'localidade TEXT, '
        'uf TEXT, '
        'ibge TEXT, '
        'gia TEXT, '
        'ddd TEXT, '
        'siafi TEXT '
        ')');
  }
}
