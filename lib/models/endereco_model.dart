class EnderecoFields {
  static final String TABLE_NAME = 'Endereco';
  static final String ID = 'id';
  static final String CEP = 'cep';
  static final String LOGRADOURO = 'logradouro';
  static final String COMPLEMENTO = 'complemento';
  static final String BAIRRO = 'bairro';
  static final String LOCALIDATE = 'localidade';
  static final String UF = 'uf';
  static final String IBGE = 'ibge';
  static final String GIA = 'gia';
  static final String DDD = 'ddd';
  static final String SIAFI = 'siafi';
}

class EnderecoModel {
  final int? id;
  final String cep;
  final String logradouro;
  final String complemento;
  final String bairro;
  final String localidade;
  final String uf;
  final String ibge;
  final String gia;
  final String ddd;
  final String siafi;

  const EnderecoModel({
    required this.id,
    required this.cep,
    required this.logradouro,
    required this.complemento,
    required this.bairro,
    required this.localidade,
    required this.uf,
    required this.ibge,
    required this.gia,
    required this.ddd,
    required this.siafi,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'cep': cep,
      'logradouro': logradouro,
      'complemento': complemento,
      'bairro': bairro,
      'localidade': localidade,
      'uf': uf,
      'ibge': ibge,
      'gia': gia,
      'ddd': ddd,
      'siafi': siafi,
    };
  }

  factory EnderecoModel.fromMap(Map<String, dynamic> map) {
    return EnderecoModel(
      id: map['id'] == null ? 0 : map['id'],
      cep: map['cep'] as String,
      logradouro: map['logradouro'] as String,
      complemento: map['complemento'] as String,
      bairro: map['bairro'] as String,
      localidade: map['localidade'] as String,
      uf: map['uf'] as String,
      ibge: map['ibge'] as String,
      gia: map['gia'] as String,
      ddd: map['ddd'] as String,
      siafi: map['siafi'] as String,
    );
  }
}
