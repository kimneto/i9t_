class CondutorModel {
  String? objectId;
  String? nome;
  String? cpf;
  String? email;
  String? re;
  int? codUnidade;
  int? nivel;

  CondutorModel(
      {this.objectId,
      this.nome,
      this.cpf,
      this.email,
      this.re,
      this.codUnidade,
      this.nivel});

  CondutorModel.fromJson(Map<String, dynamic> json) {
    objectId = json['objectId'];
    nome = json['nome'];
    cpf = json['cpf'];
    email = json['email'];
    re = json['re'];
    codUnidade = json['codUnidade'];
    nivel = json['nivel'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['objectId'] = this.objectId;
    data['nome'] = this.nome;
    data['cpf'] = this.cpf;
    data['email'] = this.email;
    data['re'] = this.re;
    data['codUnidade'] = this.codUnidade;
    data['nivel'] = this.nivel;
    return data;
  }
}
