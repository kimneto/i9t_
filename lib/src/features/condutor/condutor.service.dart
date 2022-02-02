import 'package:flutter/material.dart';
import 'package:i9t/src/data/resposta_api.model.dart';

import 'package:i9t/src/features/condutor/condutor.model.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class CondutorService extends ChangeNotifier {
  final queryCondutorService = QueryBuilder(ParseObject('Condutor'));

  Future<RespostaApiModel> pegaCondutorPorCpf(String cpf) async {
    final function = ParseCloudFunction('pega-condutor-por-cpf');
    final resposta = await function.execute(parameters: {'cpf': cpf});
    return RespostaApiModel.fromJson(resposta.result);
  }

  Future<RespostaApiModel> cadastraCondutor(CondutorModel condutor) async {
    final function = ParseCloudFunction('cria-condutor');
    final resposta = await function.execute(parameters: condutor.toJson());
    return RespostaApiModel.fromJson(resposta.result);
  }
}