import 'package:flutter/material.dart';
import 'package:i9t/src/features/fct/models/fct.model.dart';
import 'package:i9t/src/features/condutor/condutor.model.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

import '../data/resposta_api.model.dart';

class FctService {
  final queryFctsService = QueryBuilder(ParseObject('Fct'));

  Future<RespostaApiModel> pegaFtcAbertaPorCondutor(
      CondutorModel condutor) async {
    final function = ParseCloudFunction("pega-fcts-por-condutor");
    final resposta = await function.execute(
        parameters: {"condutorId": condutor.id, "estaConcluido": false});

    return RespostaApiModel.fromJson(await resposta.result[0] ?? {});
  }

  Future<RespostaApiModel> pegaFtcsFchadasPorCondutor(
      CondutorModel condutor) async {
    final function = ParseCloudFunction("pega-fcts-por-condutor");
    final resposta = await function.execute(
        parameters: {"condutorId": condutor.id, "estaConcluido": true});

    return RespostaApiModel.fromJson(resposta.result);
  }

  Future<RespostaApiModel> criaNovoFctAberto(FctModel fct) async {
    final function = ParseCloudFunction("cria-fct-aberto");
    final resposta = await function.execute(
      parameters: fct.toJson(),
    );
    return RespostaApiModel.fromJson(resposta.result);
  }

  Future<RespostaApiModel> pegaNumeroDocumentoFct(String anoVigente) async {
    final function = ParseCloudFunction("pega-numero-documento-por-ano");
    final resposta =
        await function.execute(parameters: {"anoVigente": anoVigente});
    return RespostaApiModel.fromJson(resposta.result);
  }

  pegaFctsPorAno(int ano) async {}

  pegaFcts() async {}

  pegaFctComTrafegoComVeiculo() async {}
}
