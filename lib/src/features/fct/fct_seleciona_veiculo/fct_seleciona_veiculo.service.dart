import 'package:parse_server_sdk/parse_server_sdk.dart';
import '../veiculo/veiculo.model.dart';

class VeiculoService {
  Future<List<VeiculoModel>> pegaVeiculosPorStatus(
      {required int statusVeiculo}) async {
    final funcao = ParseCloudFunction('pega-veiculos-por-status');

    final resultado = await funcao
        .executeObjectFunction(parameters: {'statusVeiculo': '$statusVeiculo'});

    List<VeiculoModel> listaVeiculos = [];

    return listaVeiculos;
  }

  Future<List<VeiculoModel>> pegaVeiculos() async {
    List<VeiculoModel> listaVeiculos = [];
    await ParseCloudFunction('pega-veiculos').getAll().then((veiculos) {
      if (veiculos.success) {
        listaVeiculos.add(VeiculoModel.fromJson(veiculos.result));
      }
    });
    return listaVeiculos;
  }
}
