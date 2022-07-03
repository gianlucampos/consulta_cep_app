import 'package:consulta_cep_app/core/app_globals.dart';
import 'package:consulta_cep_app/models/theme_data_model.dart';
import 'package:consulta_cep_app/repository/theme_data_repository.dart';
import 'package:flutter/material.dart';

class MyTheme extends ChangeNotifier {
  final ThemeDataRepository repository = ThemeDataRepository();

  ThemeMode currentTheme() {
    return themeData.isDark ? ThemeMode.dark : ThemeMode.light;
  }

  void switchTheme() {
    themeData.isDark = !themeData.isDark;
    repository.updateByField(object: themeData, field: ThemeDataFields.isDark);
    notifyListeners();
  }
}