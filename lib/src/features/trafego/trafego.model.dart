import 'package:i9t/src/data/data.model.dart';

class TrafegoModel {
  String? id;
  String? horaChegada;
  String? horaPartida;
  int? hodometro;
  bool? concluido;
  String? pontoParada;
  String? fctId;

  TrafegoModel(
      {this.id,
      this.horaChegada,
      this.horaPartida,
      this.hodometro,
      this.concluido,
      this.pontoParada,
      this.fctId});

  TrafegoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    horaChegada = json['horaChegada']['iso'];
    horaPartida = json['horaPartida']['iso'];
    hodometro = json['hodometro'];
    concluido = json['concluido'];
    pontoParada = json['pontoParada'];
    fctId = json['fct'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['concluido'] = this.concluido;
    data['horaChegada'] = this.horaChegada;
    data['horaPartida'] = this.horaPartida;
    data['hodometro'] = this.hodometro;
    data['pontoParada'] = this.pontoParada;
    data['fctId'] = this.fctId;

    return data;
  }
}
