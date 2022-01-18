class UserModel {
  String? id;
  String? nome;
  String? email;
  String? cpf;
  String? re;
  int? nivel;
  int? codUnidade;

  UserModel({
    this.id,
    this.nome,
    this.email,
    this.cpf,
    this.re,
    this.nivel,
    this.codUnidade,
  });
  //NIVEL 1 - ADMINISTRADOR (EXCLUI USUÁRIO, ADICIONA USUÁRIO, ALTERA USUÁRIO)
  //NIVEL 2 - USUARIO
  //NIVEL 3 - CLIENTE

}
