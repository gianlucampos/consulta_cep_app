import 'package:consulta_cep_app/core/app_globals.dart';
import 'package:consulta_cep_app/models/theme_data_model.dart';
import 'package:consulta_cep_app/repository/theme_data_repository.dart';

class InitDataConfig {
  final ThemeDataRepository _themeDataRepository = ThemeDataRepository();

  Future loadData() async {
    await _getThemeFromDatabase();
  }

  Future _getThemeFromDatabase() async {
    var map = await _themeDataRepository.retrieveAll(table: 'ThemeData');
    var themeDatabase = ThemeDataModel.fromMap(map.first);
    themeData = themeDatabase;
  }
}
