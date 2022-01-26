import 'package:i9t/src/features/veiculo/model/veiculo.model.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import '../model/veiculo.model.dart';

class VeiculoService {
  final queryVeiculoService = QueryBuilder(ParseObject('Veiculo'));

  Future<List<VeiculoModel>> pegaVeiculosMenosStatusZero() async {
    List<VeiculoModel> listaVeiculos = [];
    queryVeiculoService.whereNotEqualTo('statusVtr', '1');
    final response = await queryVeiculoService.query();

    if (response.success && response.results != null) {
      for (final object in response.results!) {
        listaVeiculos.add(VeiculoModel.fromJson(object.toJson()));
      }
      return listaVeiculos;
    } else {
      return listaVeiculos;
    }
  }

  Future<List<VeiculoModel>> pegaVeiculos() async {
    List<VeiculoModel> listaVeiculos = [];
    await ParseObject('Veiculo').getAll().then((Veiculos) {
      if (Veiculos.success) {
        Veiculos.results!.map((e) {
          listaVeiculos.add(VeiculoModel.fromJson(e.toJson()));
        });
      }
    });
    return listaVeiculos;
  }
}
