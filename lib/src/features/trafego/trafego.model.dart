import 'package:i9t/src/data/data.model.dart';

class TrafegoModel {
  String? id;
  DataModel? horaChegada;
  DataModel? horaPartida;
  String? hodometro;
  String? pontoParada;

  TrafegoModel(
      {this.id,
      this.horaChegada,
      this.horaPartida,
      this.hodometro,
      this.pontoParada});

  TrafegoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    horaChegada = DataModel.fromJson(json['horaChegada'] ?? {});
    horaPartida = DataModel.fromJson(json['horaPartida'] ?? {});
    hodometro = json['hodometro'];
    pontoParada = json['pontoParada'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['horaChegada'] = this.horaChegada?.toJson();
    data['horaPartida'] = this.horaPartida?.toJson();
    data['hodometro'] = this.hodometro;
    data['pontoParada'] = this.pontoParada;
    return data;
  }
}
