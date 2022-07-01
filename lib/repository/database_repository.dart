import 'package:consulta_cep_app/config/database_config.dart';
import 'package:consulta_cep_app/models/endereco_model.dart';
import 'package:sqflite/sqflite.dart';

abstract class DatabaseRepository {
  final Database _db = DatabaseConfig.database!;

  Future<void> create(String table, Map<String, Object> data) async {
    _db.insert(table, data, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  // createRaw(dynamic object) async {
  //   var result = await _db.rawInsert("INSERT INTO Categoria (id,nome) "
  //       " VALUES (${object.id},${object.nome})");
  //   return result;
  // }

  Future<int> insert(dynamic object) async {
    var result = await _db.insert('Endereco', object.toMap());
    return result;
  }

   Future<List<Map<String, dynamic>>> retrieve(
      {required String table,
      required String field,
      required String arg}) async {
    //		var result = await db.rawQuery('SELECT * FROM $table order by id');
    return _db.query(table, where: 'cep', whereArgs: [arg]);
  }

  Future<Map<String, dynamic>?> retrieve2(
      {required String table,
        required String field,
        required String arg}) async {

    // var results = await _db.query(table, where: 'cep', whereArgs: [arg]);
    var results = await _db.rawQuery('SELECT * FROM $table WHERE  $field = $arg');
    if (results.isEmpty) {
      return null;
    }
    return results.first;
  }


   Future<int> update(EnderecoModel object) async {
    var result = await _db.update(object.runtimeType.toString(), object.toMap(),
        where: 'id = ?', whereArgs: [object.id]);
    return result;
  }

   Future<int> delete(int id, String tableName) async {
    int result = await _db.delete(tableName, where: 'id = ?', whereArgs: [id]);
//    int result = await db.rawDelete('DELETE FROM $tableName WHERE id = $id');
    return result;
  }
}
