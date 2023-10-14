class CepBack4AppModel {
  List<Ceps> ceps = [];

  CepBack4AppModel(this.ceps);

  CepBack4AppModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      ceps = <Ceps>[];
      json['results'].forEach((v) {
        ceps.add(Ceps.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['results'] = ceps.map((v) => v.toJsonEndPoint()).toList();
      return data;
  }
}



class Ceps {
  String objectId = "";
  String logradouro = "";
  String cep = "";
  String createdAt = "";
  String updatedAt = "";
  String bairro = "";
  String localidade = "";
  String uf = "";
  String ddd = "";

  Ceps(
      this.objectId,
      this.logradouro,
      this.cep,
      this.createdAt,
      this.updatedAt,
      this.bairro,
      this.localidade,
      this.uf,
      this.ddd);
  
  Ceps.criar(
    this.logradouro,
    this.cep,
    this.bairro,
    this.localidade,
    this.uf,
    this.ddd
  );

  Ceps.fromJson(Map<String, dynamic> json) {
    objectId = json['objectId'];
    logradouro = json['logradouro'];
    cep = json['cep'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    bairro = json['bairro'];
    localidade = json['localidade'];
    uf = json['uf'];
    ddd = json['ddd'];
  }

  Map<String, dynamic> toJsonEndPoint() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['objectId'] = objectId;
    data['logradouro'] = logradouro;
    data['cep'] = cep;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['bairro'] = bairro;
    data['localidade'] = localidade;
    data['uf'] = uf;
    data['ddd'] = ddd;
    return data;
  }

  Map<String, dynamic> toJsonCreateEndPoint() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['logradouro'] = logradouro;
    data['cep'] = cep;
    data['bairro'] = bairro;
    data['localidade'] = localidade;
    data['uf'] = uf;
    data['ddd'] = ddd;
    return data;
  }
}
