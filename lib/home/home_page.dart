import 'package:consulta_cep_app/core/app_colors.dart';
import 'package:consulta_cep_app/core/app_globals.dart';
import 'package:consulta_cep_app/core/app_text_styles.dart';
import 'package:consulta_cep_app/endereco/endereco_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _myController = TextEditingController();
  bool _isTapped = false;

  @override
  void initState() {
    _myController.addListener(() {
      setState(() {
        _isTapped = true;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consulta CEP", style: AppTextStyles.title),
        actions: [
          IconButton(
              onPressed: () {
                currentTheme.switchTheme();
              },
              icon: Icon(Icons.dark_mode)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              style: AppTextStyles.body20,
              controller: _myController,
              decoration: InputDecoration(
                helperText: "Preencha este campo com um número com 8 digitos",
                hintText: "Exemplo: 40170110",
                labelText: "Insira um CEP",
                errorText: _isTapped ? _getErrorMessage() : null,
              ),
              autofocus: false,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              maxLength: 8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: _getErrorMessage() != null
                      ? Colors.blueGrey
                      : AppColors.blue,
                ),
                onPressed: _getErrorMessage() != null ? null : _changePage,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text("Consultar", style: AppTextStyles.bodyBold20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _changePage() {
    if (_getErrorMessage() != null) {
      return null;
    }
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EnderecoPage(numeroCep: _myController.text),
      ),
    );
  }

  String? _getErrorMessage() {
    if (_myController.text.isEmpty) {
      return "É necessário informar um CEP!";
    }
    if (_myController.text.length != 8) {
      return "É necessário um CEP com 8 digitos!";
    }
    return null;
  }
}
