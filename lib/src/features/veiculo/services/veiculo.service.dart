import 'package:flutter/cupertino.dart';
import 'package:i9t/src/features/veiculo/model/veiculo.model.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

import '../model/veiculo.model.dart';

class VeiculoService extends ChangeNotifier {
  final queryVeiculoService = QueryBuilder(ParseObject('Veiculo'));

  Future<List<VeiculoModel>> pegaVeiculosMenosStatusZero() async {
    List<VeiculoModel> listaVeiculos = [];

    queryVeiculoService.whereNotEqualTo('statusVtr', 1);
    final response = await queryVeiculoService.query();
    if (response.error is! ParseError) {
      response.results!
          .map((e) => {listaVeiculos.add(VeiculoModel.fromJson(e.toJson()))});
    }
    return listaVeiculos;
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
  /*Future<VeiculoModel> pegaUsuarioPorCpf(String CPF) async {
    VeiculoModel usuario = VeiculoModel();

    queryUserService.whereEqualTo("cpf", CPF);

    final response = await queryUserService.query();
    if (response.success) {
      usuario = VeiculoModel.fromJson(await response.result[0].toJson());
    }

    return usuario;
  }*/
