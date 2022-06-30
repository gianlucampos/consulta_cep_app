import 'package:consulta_cep_app/models/endereco_model.dart';
import 'package:uno/uno.dart';

class CepService {
  // static const String _urlBase = "https://viacep.com.br/ws/{CEP}/json/";
  final Uno _uno = Uno();

  Future<EnderecoModel> getEndereco(String numeroCep) async {
    // String urlConsultaCep = _urlBase.replaceAll("{CEP}", numeroCep);
    // final response = await uno.get(urlConsultaCep);
    try {
      final response =
          await _uno.get("https://viacep.com.br/ws/$numeroCep/json/");

      if (response.data['erro'] == "true") {
        throw NoElementException();
      }
      final EnderecoModel endereco = EnderecoModel.fromMap(response.data);
      return endereco;
    } catch (exception) {
      if (exception.runtimeType == NoElementException) {
        throw 'Não foi encontrado nenhum endereço!';
      }
      throw 'Endereço não é válido para consulta!';
    }
  }
}

class NoElementException implements Exception {}
