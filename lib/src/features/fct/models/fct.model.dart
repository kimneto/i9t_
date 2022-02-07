import 'package:i9t/src/features/condutor/condutor.model.dart';
import 'package:i9t/src/features/fct/veiculo/veiculo.model.dart';
import 'package:i9t/src/features/trafego/trafego.model.dart';
import 'package:i9t/src/shared/settings.dart';

class FctModel {
  String? id;
  CondutorModel? condutorModel;
  VeiculoModel? veiculoModel;
  List<TrafegoModel>? trafegoModel = [];
  String? documento;
  bool? concluido;
  String? novidadesVerificadas;
  String? defeitosVerificados;
  FctModel? fctModel;

  FctModel({
    this.id,
    this.condutorModel,
    this.veiculoModel,
    this.trafegoModel,
    this.documento,
    this.concluido,
    this.novidadesVerificadas,
    this.defeitosVerificados,
  });

  FctModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    condutorModel = json['condutor'] != null
        ? new CondutorModel.fromJson(json['condutor'])
        : null;
    concluido = json['concluido'];
    documento = json['documento'];
    veiculoModel = json['veiculo'] != null
        ? new VeiculoModel.fromJson(json['veiculo'])
        : null;
    fctModel = json['fct'] != null ? new FctModel.fromJson(json['fct']) : null;

    novidadesVerificadas = json['novidadesVerificadas'];
    defeitosVerificados = json['defeitosVerificados'];
    if (json['trafegos'] != null) {
      json['trafegos'].forEach((res) {
        trafegoModel!.add(TrafegoModel.fromJson(res));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.condutorModel != null) {
      data['condutor'] = this.condutorModel!.toJson();
    }
    data['concluido'] = this.concluido;
    data['documento'] = this.documento;
    if (this.veiculoModel != null) {
      data['veiculo'] = this.veiculoModel!.toJson();
    }

    if (this.fctModel != null) {
      data['fct'] = this.fctModel!.toJson();
    }
    data['novidadesVerificadas'] = this.novidadesVerificadas;
    data['defeitosVerificados'] = this.defeitosVerificados;
    if (this.trafegoModel != null) {
      data['trafegos'] = this.trafegoModel!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  Future<String> geraTempoDeUtilizacao(
      String dataInicial, String dataFinal) async {
    return "30 Minutos";
  }

  Future<String> geraKmUtilizacao() async {
    return "125 Km";
  }

  geradorNumeroDocumentoFct(String numero, String ano) {
    ano.substring(2, 4);
    String codDocumento = numero.toString().padLeft(3, '0');
    String numeroDocumento =
        '$PREFIXO_UNIDADE-$codDocumento/$COD_CURTO_UNIDADE/$ano';
    return numeroDocumento;
  }
}
