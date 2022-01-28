class VeiculoModel {
  String? objectId;
  String? patrimonio;
  String? placa;
  String? tipo;
  String? grupo;
  int? statusVtr;
  int? ultimoOdometro;

  VeiculoModel(
      {this.objectId,
      this.patrimonio,
      this.placa,
      this.tipo,
      this.grupo,
      this.statusVtr,
      this.ultimoOdometro});

  VeiculoModel.fromJson(Map<String, dynamic> json) {
    objectId = json['objectId'];
    patrimonio = json['patrimonio'];
    placa = json['placa'];
    tipo = json['tipo'];
    grupo = json['grupo'];
    statusVtr = json['statusVtr'];
    ultimoOdometro = json['ultimoOdometro'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['objectId'] = this.objectId;
    data['patrimonio'] = this.patrimonio;
    data['placa'] = this.placa;
    data['tipo'] = this.tipo;
    data['grupo'] = this.grupo;
    data['statusVtr'] = this.statusVtr;
    data['ultimoOdometro'] = this.ultimoOdometro;
    return data;
  }
}
