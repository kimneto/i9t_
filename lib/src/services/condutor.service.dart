import 'dart:async';

import 'package:i9t/src/model/condutor.model.dart';
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

  Future<CondutorModel> pegaCondutorPorCpf(String CPF) async {
    CondutorModel condutor = CondutorModel();

    queryCondutorService.whereEqualTo("cpf", CPF);

    final response = await queryCondutorService.query();
    if (response.success) {
      condutor = CondutorModel.fromJson(await response.result[0].toJson());
    }

    return condutor;
  }

  Future<void> cadastraCondutor(CondutorModel condutor) async {
    final condutorParse = ParseObject('Condutor');
    await condutorParse
      ..set('nome', condutor.nome)
      ..set('cpf', condutor.cpf)
      ..set('email', condutor.email)
      ..set('codUnidade', condutor.codUnidade)
      ..set('nivel', 1)
      ..save().then((value) => print(value));
  }
}
