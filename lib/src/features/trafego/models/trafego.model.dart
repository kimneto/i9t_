import 'package:i9t/src/features/fct/models/fct.model.dart';

class TrafegoModel {
  String? objectId;
  FctModel? fct;
  String? destino;
  DateTime? horaChegada;
  DateTime? horaPartida;
  int? hodometro;

  TrafegoModel(
      {this.objectId,
      this.fct,
      this.destino,
      this.horaChegada,
      this.horaPartida,
      this.hodometro});

  TrafegoModel.fromJson(Map<String, dynamic> json) {
    objectId = json['objectId'];
    fct = json['fct'];
    destino = json['destino'];
    horaChegada = json['horaChegada'];
    horaPartida = json['horaPartida'];
    hodometro = json['hodometro'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['objectId'] = this.objectId;
    data['fct'] = this.fct;
    data['destino'] = this.destino;
    data['horaChegada'] = this.horaChegada;
    data['horaPartida'] = this.horaPartida;
    data['hodometro'] = this.hodometro;
    return data;
  }
}
