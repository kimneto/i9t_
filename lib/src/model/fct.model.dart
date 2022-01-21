import 'package:i9trafego/src/model/condutor.model.dart';
import 'package:i9trafego/src/model/viatura.model.dart';

class FctModel {
  String? objectId;
  CondutorModel? condutor;
  ViaturaModel? viatura;
  String? documento;
  bool? concluido;
  String? dataInicio;
  String? novidadesVerificadas;
  int? tempoUtilizacao;
  int? kmUtilizacao;

  FctModel(
      {this.objectId,
      this.condutor,
      this.viatura,
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
    viatura = json['viatura'] != null
        ? new ViaturaModel.fromJson(json['viatura'])
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
    if (this.viatura != null) {
      data['viatura'] = this.viatura!.toJson();
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
