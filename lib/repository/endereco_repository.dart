import 'package:consulta_cep_app/models/endereco_model.dart';
import 'package:consulta_cep_app/repository/database_repository.dart';

class EnderecoRepository extends DatabaseRepository {
  retrieveEnderecoByCep(String numeroCep) async {
    var result =
        await retrieve2(table: 'Endereco', field: 'cep', arg: numeroCep);
    if (result == null) return null;
    EnderecoModel endereco = EnderecoModel.fromMap(result);
    return endereco;
  }
}
