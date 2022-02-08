import 'package:i9t/src/data/data.model.dart';

class TrafegoModel {
  String? id;
  DataModel? horaChegada;
  DataModel? horaPartida;
  String? hodometro;
  String? pontoParada;
  String? idFct;

  TrafegoModel(
      {this.id,
      this.horaChegada,
      this.horaPartida,
      this.hodometro,
      this.pontoParada,
      this.idFct});

  TrafegoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    horaChegada = json['horaChegada'] != null
        ? new DataModel.fromJson(json['horaChegada'])
        : null;
    horaPartida = json['horaPartida'] != null
        ? new DataModel.fromJson(json['horaPartida'])
        : null;
    hodometro = json['hodometro'];
    pontoParada = json['pontoParada'];
    idFct = json['idFct'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['horaChegada'] = this.horaChegada;
    data['horaPartida'] = this.horaPartida;
    data['hodometro'] = this.hodometro;
    data['pontoParada'] = this.pontoParada;
    data['fct'] = this.idFct;

    return data;
  }
}
