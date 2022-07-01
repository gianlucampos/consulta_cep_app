import 'package:consulta_cep_app/core/app_colors.dart';
import 'package:consulta_cep_app/core/app_text_styles.dart';
import 'package:consulta_cep_app/models/endereco_model.dart';
import 'package:consulta_cep_app/repository/endereco_repository.dart';
import 'package:consulta_cep_app/services/cep_service.dart';
import 'package:flutter/material.dart';

class EnderecoPage extends StatefulWidget {
  final String numeroCep;

  const EnderecoPage({Key? key, required this.numeroCep}) : super(key: key);

  @override
  State<EnderecoPage> createState() => _EnderecoPageState();
}

class _EnderecoPageState extends State<EnderecoPage> {
  final CepService service = CepService();
  final EnderecoRepository repository = EnderecoRepository();
  EnderecoModel? endereco;

  @override
  void initState() {
    super.initState();
    repository
        .retrieveEnderecoByCep(widget.numeroCep)
        .then((value) => endereco = value)
        .whenComplete(() => { super.setState(() {})});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Resultados", style: AppTextStyles.titleBold)),
      body: Container(
        child: Center(
          child: endereco == null
              ? futureBuilderRequest()
              : _buildTable(endereco!),
        ),
      ),
    );
  }

  FutureBuilder<EnderecoModel> futureBuilderRequest() {
    return FutureBuilder<EnderecoModel>(
      future: service.getEndereco(widget.numeroCep),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            repository.insert(snapshot.data);
            return _buildTable(snapshot.data!);
          }
          if (snapshot.hasError) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(snapshot.error.toString(),
                  style: AppTextStyles.bodyBold20),
            );
          }
        }
        return const CircularProgressIndicator();
      },
    );
  }

  Widget _buildTable(EnderecoModel endereco) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Table(
        border: TableBorder.all(),
        children: [
          _buildTableRow('CEP', endereco.cep),
          _buildTableRow('Logradouro', endereco.logradouro),
          _buildTableRow('Bairro', endereco.bairro),
          _buildTableRow('Localidade', endereco.localidade),
          _buildTableRow('UF', endereco.uf),
          _buildTableRow('GIA', endereco.gia),
          _buildTableRow('IBGE', endereco.ibge),
          _buildTableRow('DDD', endereco.ddd),
          _buildTableRow('SIAFI', endereco.siafi),
        ],
      ),
    );
  }

  TableRow _buildTableRow(String header, String value) {
    return TableRow(
      decoration: const BoxDecoration(color: AppColors.grey),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Text(header, style: AppTextStyles.title),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Text(value, style: AppTextStyles.title),
        ),
      ],
    );
  }
}
