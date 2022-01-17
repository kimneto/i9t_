class RequestAutenticaPMModel {
  RequestAutenticaPMModel({required this.tipo, this.mensagem = ""});
  late String tipo;
  String mensagem;

  fromJson(Map<String, dynamic> json) {
    tipo = json['tipo'];

    if (json['mensagem'] != null) {
      mensagem = json['mensagem'];
    } else {
      mensagem = "Autenticado com Sucesso";
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tipo'] = this.tipo;
    data['mensagem'] = this.mensagem;
    return data;
  }
}
