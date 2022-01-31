import 'package:flutter/material.dart';

import 'package:i9t/src/features/condutor/condutor.model.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class CondutorService extends ChangeNotifier {
  final queryCondutorService = QueryBuilder(ParseObject('Condutor'));

  pegaCondutorPorCpf(String CPF) async {
    QueryBuilder<ParseObject> queryCondutor =
        QueryBuilder<ParseObject>(ParseObject('Condutor'));
    queryCondutor.whereEqualTo("cpf", CPF);
    final ParseResponse apiResponse = await queryCondutor.query();

    if (apiResponse.success && apiResponse.results != null) {
      return CondutorModel.fromJson(apiResponse.results!.last.toJson());
    } else {
      return [];
    }
  }

  cadastraCondutor(CondutorModel condutor) async {
    final condutorParse = ParseObject('Condutor');
    await condutorParse
      ..set('nome', condutor.nome)
      ..set('cpf', condutor.cpf)
      ..set('email', condutor.email)
      ..set('codUnidade', condutor.codUnidade)
      ..set('nivel', 1);

    await condutorParse.save();
  }
}
