import 'package:consulta_cep_app/core/app_colors.dart';
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
  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.yellow,
      appBar: AppBar(
        title: Text("Consulta CEP", style: AppTextStyles.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              style: AppTextStyles.body20,
              controller: myController,
              decoration: const InputDecoration(labelText: "Insira o CEP"),
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              maxLength: 8,
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        EnderecoPage(numeroCep: myController.text),
                  ),
                );
              },
              child: Text("Consultar", style: AppTextStyles.bodyBold20),
            ),
          ],
        ),
      ),
    );
  }
}
