import 'package:i9t/src/features/condutor/models/condutor.model.dart';
import 'package:i9t/src/features/veiculo/model/veiculo.model.dart';

class FctModel {
  String? objectId;
  CondutorModel? condutor;
  VeiculoModel? veiculo;
  String? documento;
  bool? concluido;
  String? dataInicio;
  String? novidadesVerificadas;
  int? tempoUtilizacao;
  int? kmUtilizacao;

  FctModel(
      {this.objectId,
      this.condutor,
      this.veiculo,
      this.documento,
      this.concluido,
      this.dataInicio,
      this.novidadesVerificadas,
      this.tempoUtilizacao,
      this.kmUtilizacao});

  FctModel.fromJson(Map<String, dynamic> json) {
    objectId = json['objectId'];
    condutor = json['condutor'] != null
        ? new CondutorModel.fromJson(json['condutor'])
        : null;
    veiculo = json['veiculo'] != null
        ? new VeiculoModel.fromJson(json['veiculo'])
        : null;
    documento = json['documento'];
    concluido = json['concluido'];
    dataInicio = json['dataInicio'];
    novidadesVerificadas = json['novidadesVerificadas'];
    tempoUtilizacao = json['tempoUtilizacao'];
    kmUtilizacao = json['kmUtilizacao'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['objectId'] = this.objectId;
    if (this.condutor != null) {
      data['condutor'] = this.condutor!.toJson();
    }
    if (this.veiculo != null) {
      data['veiculo'] = this.veiculo!.toJson();
    }
    data['documento'] = this.documento;
    data['concluido'] = this.concluido;
    data['dataInicio'] = this.dataInicio;
    data['novidadesVerificadas'] = this.novidadesVerificadas;
    data['tempoUtilizacao'] = this.tempoUtilizacao;
    data['kmUtilizacao'] = this.kmUtilizacao;
    return data;
  }
}
