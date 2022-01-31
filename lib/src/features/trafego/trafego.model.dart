import 'package:i9t/src/data/data.model.dart';

class TrafegoModel {
  String? objectId;
  String? pontoDestino;
  int? hodometro;
  DataModel? horaChegada;
  DataModel? horaPartida;

  TrafegoModel(
      {this.objectId,
      this.pontoDestino,
      this.horaChegada,
      this.horaPartida,
      this.hodometro});

  TrafegoModel.fromJson(Map<String, dynamic> json) {
    objectId = json['objectId'];
    pontoDestino = json['pontoDestino'];
    hodometro = json['hodometro'];

    horaChegada = json['horaChegada'] != null
        ? new DataModel.fromJson(json['horaChegada'])
        : null;
    horaPartida = json['horaPartida'] != null
        ? new DataModel.fromJson(json['horaPartida'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['objectId'] = this.objectId;
    data['pontoDestino'] = this.pontoDestino;
    data['hodometro'] = this.hodometro;
    if (this.horaChegada != null) {
      data['horaChegada'] = this.horaChegada!.toJson();
    }
    if (this.horaPartida != null) {
      data['horaPartida'] = this.horaPartida!.toJson();
    }
    return data;
  }
}