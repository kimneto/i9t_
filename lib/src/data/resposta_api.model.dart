class RespostaApiModel {
  String? mensagem;
  dynamic data;
  bool? sucesso;
  String? erro;

  RespostaApiModel(
      {required this.mensagem,
      this.data,
      required this.sucesso,
      required this.erro});

  RespostaApiModel.fromJson(Map<String, dynamic> json) {
    if (json['mensagem'] != null) {
      mensagem = json['mensagem'];
      data = json['data'];
      sucesso = json['sucesso'];
      erro = json['erro'];
    } else {
      throw Exception('Erro ao converter json');
    }
  }
}
