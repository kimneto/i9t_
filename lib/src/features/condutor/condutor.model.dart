class CondutorModel {
  String? id;
  String? nome;
  String? cpf;
  String? email;
  int? codUnidade;
  int? nivel;

  CondutorModel(
      {this.id, this.nome, this.cpf, this.email, this.codUnidade, this.nivel});

  CondutorModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    cpf = json['cpf'];
    email = json['email'];
    codUnidade = json['codUnidade'];
    nivel = json['nivel'];
  }

  Map<String, dynamic> toJson() {
    final data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['cpf'] = this.cpf;
    data['email'] = this.email;
    data['codUnidade'] = this.codUnidade;
    data['nivel'] = this.nivel;
    return data;
  }
}
