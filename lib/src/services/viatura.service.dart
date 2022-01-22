import 'package:i9t/src/model/viatura.model.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class ViaturaService {
  final queryViaturaService = QueryBuilder(ParseObject('Viatura'));

  Future<List<ViaturaModel>> pegaViaturasMenosStatusZero() async {
    List<ViaturaModel> listaViaturas = [];

    queryViaturaService.whereNotEqualTo('statusVtr', 0);
    final response = await queryViaturaService.query();
    for (var vtr in response.results!) {
      listaViaturas.add(ViaturaModel.fromJson(vtr.toJson()));
    }
    return listaViaturas;
  }

  Future<List<ViaturaModel>> pegaViaturas() async {
    List<ViaturaModel> listaViaturas = [];
    await ParseObject('Viatura').getAll().then((viaturas) {
      if (viaturas.success) {
        viaturas.results?.forEach((element) {
          listaViaturas.add(ViaturaModel.fromJson(element.toJson()));
        });
      }
    });
    return listaViaturas;
  }

  /*Future<ViaturaModel> pegaUsuarioPorCpf(String CPF) async {
    ViaturaModel usuario = ViaturaModel();

    queryUserService.whereEqualTo("cpf", CPF);

    final response = await queryUserService.query();
    if (response.success) {
      usuario = ViaturaModel.fromJson(await response.result[0].toJson());
    }

    return usuario;
  }*/
}
