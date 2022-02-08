import 'package:i9t/src/data/resposta_api.model.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class VeiculoService {
  Future<RespostaApiModel> pegaVeiculosPorStatus(
      {required int statusVeiculo}) async {
    final function = await ParseCloudFunction('pega-veiculos-por-status');
    final resposta =
        await function.execute(parameters: {'statusVeiculo': statusVeiculo});
    return RespostaApiModel.fromJson(resposta.result);
  }

  Future<RespostaApiModel> pegaVeiculos() async {
    final function = await ParseCloudFunction('pega-veiculos');
    final resposta = await function.execute();
    return RespostaApiModel.fromJson(resposta.result);
  }
}
