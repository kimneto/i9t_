import 'package:i9t/src/data/data.model.dart';
import 'package:i9t/src/features/condutor/condutor.model.dart';
import 'package:i9t/src/features/fct/veiculo/veiculo.model.dart';
import 'package:i9t/src/features/trafego/trafego.model.dart';
import 'package:i9t/src/shared/settings.dart';

class FctModel {
  String? objectId;
  CondutorModel? condutorModel;
  VeiculoModel? veiculoModel;
  List<TrafegoModel>? trafegoModel;
  String? documento;
  String? pontoInicial;
  bool? concluido;
  DataModel? dataInicio;
  DataModel? dataFinal;
  String? novidadesVerificadas;
  String? defeitosVerificados;
  int? hodometroInicial;
  int? hodometroFinal;
  int? tempoUtilizacao;
  int? kmUtilizacao;

  FctModel(
      {this.objectId,
      this.condutorModel,
      this.veiculoModel,
      this.trafegoModel,
      this.documento,
      this.pontoInicial,
      this.concluido,
      this.dataInicio,
      this.dataFinal,
      this.novidadesVerificadas,
      this.defeitosVerificados,
      this.hodometroInicial,
      this.hodometroFinal,
      this.tempoUtilizacao,
      this.kmUtilizacao});

  FctModel.fromJson(Map<String, dynamic> json) {
    objectId = json['objectId'];
    condutorModel = json['CondutorModel'] != null
        ? new CondutorModel.fromJson(json['CondutorModel'])
        : null;
    veiculoModel = json['VeiculoModel'] != null
        ? new VeiculoModel.fromJson(json['VeiculoModel'])
        : null;
    if (json['trafego'] != null) {
      trafegoModel = new TrafegoModel.fromJson(json['TrafegoModel'])
          as List<TrafegoModel>?;
    } else {
      trafegoModel = null;
    }
    documento = json['documento'];
    pontoInicial = json['pontoInicial'];
    concluido = json['concluido'];
    dataInicio = json['dataInicio'] != null
        ? new DataModel.fromJson(json['dataInicio'])
        : null;
    dataFinal = json['dataFinal'] != null
        ? new DataModel.fromJson(json['dataFinal'])
        : null;
    novidadesVerificadas = json['novidadesVerificadas'];
    defeitosVerificados = json['defeitosVerificados'];
    hodometroInicial = json['hodometroInicial'];
    hodometroFinal = json['hodometroFinal'];
    tempoUtilizacao = json['tempoUtilizacao'];
    kmUtilizacao = json['kmUtilizacao'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['objectId'] = this.objectId;
    if (this.condutorModel != null) {
      data['CondutorModel'] = this.condutorModel!.toJson();
    }
    if (this.veiculoModel != null) {
      data['VeiculoModel'] = this.veiculoModel!.toJson();
    }
    if (this.trafegoModel != null) {
      data['TrafegoModel'] = this.trafegoModel!.map((v) => v.toJson()).toList();
    }
    data['documento'] = this.documento;
    data['pontoInicial'] = this.pontoInicial;
    data['concluido'] = this.concluido;
    if (this.dataInicio != null) {
      data['dataInicio'] = this.dataInicio!.toJson();
    }
    if (this.dataFinal != null) {
      data['dataFinal'] = this.dataFinal!.toJson();
    }
    data['novidadesVerificadas'] = this.novidadesVerificadas;
    data['defeitosVerificados'] = this.defeitosVerificados;
    data['hodometroInicial'] = this.hodometroInicial;
    data['hodometroFinal'] = this.hodometroFinal;
    data['tempoUtilizacao'] = this.tempoUtilizacao;
    data['kmUtilizacao'] = this.kmUtilizacao;
    return data;
  }

  geradorNumeroDocumentoFct(String numero) {
    /*
    ano = ano.substring(2, 4);
    String codDocumento = numero.toString().padLeft(3, '0');
    String numeroDocumento =
        '$PREFIXO_UNIDADE-$codDocumento/$COD_CURTO_UNIDADE/$ano';
    return numeroDocumento;*/
  }
}
