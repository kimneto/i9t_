import 'package:flutter/cupertino.dart';
import 'package:i9t/src/features/condutor/condutor.model.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import '../../../../data/resposta_api.model.dart';

class FctsFechadasService extends ChangeNotifier {
  Future<RespostaApiModel> pegaFtcsConcluidasPorCondutor(
      CondutorModel condutor) async {
    final function = ParseCloudFunction("pega-fcts-concluidas-por-condutor");
    final resposta =
        await function.execute(parameters: {"condutorId": "a0GyF8r4dt"});
    return RespostaApiModel.fromJson(resposta.result);
  }
}
