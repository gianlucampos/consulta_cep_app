import 'dart:developer';

import 'package:consulta_cep_app/models/endereco_model.dart';
import 'package:uno/uno.dart';

class CepService {
  final Uno _uno = Uno();

  Future<EnderecoModel> getEndereco(String numeroCep) async {
    try {
      numeroCep = numeroCep.replaceAll("-", "");
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
      log(exception.toString(), time: DateTime.now());
      throw 'Não foi possível consultar o CEP, tente novamente mais tarde!';
    }
  }
}

class NoElementException implements Exception {}
