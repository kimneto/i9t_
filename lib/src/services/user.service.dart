import 'dart:async';

import 'package:i9trafego/src/model/condutor.model.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class CondutorService {
  final queryCondutorService = QueryBuilder(ParseObject('Condutor'));
  Future<List<CondutorModel>> pegaCondutores() async {
    List<CondutorModel> listaCondutores = [];
    await ParseObject('Condutor').getAll().then((condutores) {
      if (condutores.success) {
        condutores.results?.forEach((element) {
          listaCondutores.add(CondutorModel.fromJson(element.toJson()));
        });
      }
    });
    return listaCondutores;
  }

  Future<CondutorModel> pegaUsuarioPorCpf(String CPF) async {
    CondutorModel usuario = CondutorModel();

    queryCondutorService.whereEqualTo("cpf", CPF);

    final response = await queryCondutorService.query();
    if (response.success) {
      usuario = CondutorModel.fromJson(await response.result[0].toJson());
    }

    return usuario;
  }
}
