import 'package:consulta_cep_app/core/core.dart';
import 'package:consulta_cep_app/home/home_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //https://stackoverflow.com/questions/61424636/flutter-looking-up-a-deactivated-widgets-ancestor-is-unsafe
    Future.delayed(const Duration(seconds: 2))
        .then((_) => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            ));
    return Scaffold(
      body: Container(
        color: AppColors.yellow,
        child: Center(
          child: Image.asset(AppImages.logo),
        ),
      ),
    );
  }
}
