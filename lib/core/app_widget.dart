import 'package:consulta_cep_app/core/app_colors.dart';
import 'package:consulta_cep_app/splash/splash_page_animated.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.blue),
      ),
      darkTheme: ThemeData.dark(),
      title: "Consulta CEP",
      // home: const SplashPage(),
      home: SplashPageAnimated(),
    );
  }
}
