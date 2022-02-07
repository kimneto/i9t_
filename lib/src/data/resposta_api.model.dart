class RespostaApiModel {
  String? menssagem;
  dynamic data;
  bool? sucesso;
  String? erro;

  RespostaApiModel(
      {required this.menssagem,
      this.data,
      required this.sucesso,
      required this.erro});

  RespostaApiModel.fromJson(Map<String, dynamic> json) {
    menssagem = json['menssagem'];
    data = json['data'];
    sucesso = json['sucesso'];
    erro = json['erro'];
  }
}
