import 'package:consulta_cep_app/core/app_widget.dart';
import 'package:flutter/material.dart';

import 'config/init_data_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await InitDataConfig().loadData();
  runApp(const AppWidget());
}