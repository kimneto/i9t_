class MensagemModel {
  bool? sucesso;
  String? mensagem;
  dynamic data;
  dynamic erros;

  MensagemModel({
    required this.sucesso,
    required this.mensagem,
    required this.data,
    required this.erros,
  });
}
