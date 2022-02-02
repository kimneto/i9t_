class RespostaApiModel {
  String? menssagem;
  dynamic? data;
  bool? sucesso;
  String? erro;

  RespostaApiModel(
      {required this.menssagem,
      required this.data,
      required this.sucesso,
      required this.erro});

  RespostaApiModel.fromJson(Map<String, dynamic> json) {
    menssagem = json['menssagem'];
    data = json['data'][0];
    sucesso = json['sucesso'];
    erro = json['erro'];
  }
}