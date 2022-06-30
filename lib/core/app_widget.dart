import 'dart:developer';

import 'package:consulta_cep_app/core/app_colors.dart';
import 'package:consulta_cep_app/core/app_globals.dart';
import 'package:consulta_cep_app/splash/splash_page_animated.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  void initState() {
    super.initState();
    currentTheme.addListener(() {
      log('Changing Theme');
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: AppColors.blue),
        // scaffoldBackgroundColor: AppColors.yellow,
      ),
      darkTheme: ThemeData.dark(),
      themeMode: currentTheme.currentTheme(),
      title: "Consulta CEP",
      // home: const SplashPage(),
      home: SplashPageAnimated(),
    );
  }
}
