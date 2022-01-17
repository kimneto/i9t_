import 'package:i9trafego/src/model/user.model.dart';
import 'package:i9trafego/src/model/viatura.model.dart';

class FctModel {
  int? id;
  String? numero_documento;
  UserModel? condutor;
  ViaturaModel? viatura;
  double? tempoUtilizacao;
  double? kmUtilizacao;
  String? novidadesVerifiadas;
  DateTime? dataInicio;
}
