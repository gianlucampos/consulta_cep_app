import 'package:consulta_cep_app/config/database_config.dart';
import 'package:sqflite/sqflite.dart';

abstract class DatabaseRepository {
  final Future<Database> _database = DatabaseConfig.instance.database;

  Future<int> insert({required dynamic object}) async {
    var db = await _database;
    var result = await db.insert('Endereco', object.toMap());
    return result;
  }

  Future<List<Map<String, Object?>>> retrieveAll(
      {required String table}) async {
    var db = await _database;
    var results = await db.query(table);
    return results;
  }

  Future<Map<String, dynamic>?> retrieveByField(
      {required String table,
      required String field,
      required String arg}) async {
    var db = await _database;
    var results = await db.query(table, where: '$field = ?', whereArgs: [arg]);
    if (results.isEmpty) {
      return null;
    }
    return results.first;
  }

  Future<int> update({dynamic object}) async {
    var db = await _database;
    var result = await db.update(object.runtimeType.toString(), object.toMap(),
        where: 'id = ?', whereArgs: [object.id]);
    return result;
  }

  Future<int> updateByField(
      {required dynamic object, required String field}) async {
    var db = await _database;
    String tableName = object.runtimeType.toString().replaceAll("Model", "");
    var result = await db.update(tableName, object.toMap());
    return result;
  }

  Future<int> delete({required int id, required String tableName}) async {
    var db = await _database;
    int result = await db.delete(tableName, where: 'id = ?', whereArgs: [id]);
    return result;
  }
}
