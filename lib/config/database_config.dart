import 'package:consulta_cep_app/models/endereco_model.dart';
import 'package:consulta_cep_app/models/theme_data_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseConfig {
  static const String _databaseName = "cep_database.db";
  static final DatabaseConfig instance = DatabaseConfig._singleton();

  static Database? _database;

  DatabaseConfig._singleton();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _initDB();
  }

  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, _databaseName);

    return await openDatabase(path, onCreate: _createDB, version: 1);
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const stringType = 'TEXT';
    const intType = 'INTEGER';

    await db.execute('''
      CREATE TABLE ${EnderecoFields.tableName} (
          ${EnderecoFields.id} $idType,
          ${EnderecoFields.cep} $stringType,
          ${EnderecoFields.logradouro} $stringType,
          ${EnderecoFields.complemento} $stringType,
          ${EnderecoFields.bairro} $stringType,
          ${EnderecoFields.localidade} $stringType,
          ${EnderecoFields.uf} $stringType,
          ${EnderecoFields.ibge} $stringType,
          ${EnderecoFields.gia} $stringType,
          ${EnderecoFields.ddd} $stringType,
          ${EnderecoFields.siafi} $stringType 
      );
      ''');

    await db.execute('''
      CREATE TABLE ${ThemeDataFields.tableName} (
          ${ThemeDataFields.isDark} $intType 
      );
      ''');

    await db.execute('''
      INSERT INTO ${ThemeDataFields.tableName} (
          ${ThemeDataFields.isDark}
      ) VALUES (0); 
      ''');
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
