import 'package:consulta_cep_app/config/database_config.dart';
import 'package:consulta_cep_app/models/endereco_model.dart';
import 'package:sqflite/sqflite.dart';

abstract class DatabaseRepository {
  final Future<Database> _database = DatabaseConfig.instance.database;

  Future<int> insert(dynamic object) async {
    var db = await _database;
    var result = await db.insert('Endereco', object.toMap());
    return result;
  }

  Future<Map<String, dynamic>?> retrieve(
      {required String table,
      required String field,
      required String arg}) async {
    var db = await _database;
    var results = await db.query(table, where: 'cep = ?', whereArgs: [arg]);
    if (results.isEmpty) {
      return null;
    }
    return results.first;
  }

  Future<int> update(EnderecoModel object) async {
    var db = await _database;
    var result = await db.update(object.runtimeType.toString(), object.toMap(),
        where: 'id = ?', whereArgs: [object.id]);
    return result;
  }

  Future<int> delete(int id, String tableName) async {
    var db = await _database;
    int result = await db.delete(tableName, where: 'id = ?', whereArgs: [id]);
    return result;
  }
}
