import 'package:flutter/cupertino.dart';

import 'package:i9t/src/features/veiculo/services/veiculo.service.dart';

import 'package:i9t/src/features/veiculo/states/veiculo.states.dart';

class VeiculoController extends ValueNotifier<VeiculoState> {
  VeiculoController() : super(VeiculoInitial());

  VeiculoService veiculoService = VeiculoService();

  pegaVeiculos() {
    try {
      value = VeiculoLoading();
      veiculoService.pegaVeiculosMenosStatusZero().then((items) {
        if (items.isNotEmpty) {
          value = VeiculoSuccess(veiculos: items);
        } else {
          value = VeiculoFailure(error: 'Não existe veículos cadastrados');
        }
      });
    } catch (e) {
      value = VeiculoFailure(error: e.toString());
    }
  }
}
