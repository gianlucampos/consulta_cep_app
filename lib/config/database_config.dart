import 'package:consulta_cep_app/models/endereco_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseConfig {
  static const String _database_name = "cep_database.db";
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
    final path = join(dbPath, _database_name);

    return await openDatabase(path, onCreate: _createDB, version: 1);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final StringType = 'TEXT';

    await db.execute('''
      CREATE TABLE ${EnderecoFields.TABLE_NAME} 
          ${EnderecoFields.ID} $idType,
          ${EnderecoFields.CEP} $StringType,
          ${EnderecoFields.LOGRADOURO} $StringType,
          ${EnderecoFields.COMPLEMENTO} $StringType,
          ${EnderecoFields.BAIRRO} $StringType,
          ${EnderecoFields.UF} $StringType,
          ${EnderecoFields.IBGE} $StringType,
          ${EnderecoFields.GIA} $StringType,
          ${EnderecoFields.DDD} $StringType,
          ${EnderecoFields.SIAFI} $StringType,
''');
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
