import 'package:flutter/cupertino.dart';
import 'package:i9t/src/data/pointer.model.dart';
import 'package:i9t/src/features/fct/models/fct.model.dart';
import 'package:i9t/src/features/condutor/condutor.model.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

import '../../../../data/resposta_api.model.dart';

class FctAbertaService extends ChangeNotifier {
  final queryFctsService = QueryBuilder(ParseObject('Fct'));

  Future<RespostaApiModel> pegaFtcsNaoConcluidasPorCondutor(
      CondutorModel condutor) async {
    final function =
        ParseCloudFunction("pega-fcts-nao-concluidas-por-condutor");
    final resposta =
        await function.execute(parameters: {"condutorId": "a0GyF8r4dt"});

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
    return RespostaApiModel.fromJson(resposta.result).data;
  }

  pegaFctsPorAno(int ano) async {}

  pegaFcts() async {}

  pegaFctComTrafegoComVeiculo() async {}
}
