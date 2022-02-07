class VeiculoModel {
  String? id;
  String? patrimonio;
  String? placa;
  String? tipo;
  String? grupo;
  int? statusVeiculo;
  int? ultimoOdometro;

  VeiculoModel(
      {this.id,
      this.patrimonio,
      this.placa,
      this.tipo,
      this.grupo,
      this.statusVeiculo,
      this.ultimoOdometro});

  VeiculoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    patrimonio = json['patrimonio'];
    placa = json['placa'];
    tipo = json['tipo'];
    grupo = json['grupo'];
    statusVeiculo = json['statusVeiculo'];
    ultimoOdometro = json['ultimoOdometro'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['patrimonio'] = this.patrimonio;
    data['placa'] = this.placa;
    data['tipo'] = this.tipo;
    data['grupo'] = this.grupo;
    data['statusVeiculo'] = this.statusVeiculo;
    data['ultimoOdometro'] = this.ultimoOdometro;
    return data;
  }
}
