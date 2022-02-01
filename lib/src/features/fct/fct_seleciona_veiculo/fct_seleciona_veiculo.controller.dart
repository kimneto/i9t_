import 'package:flutter/material.dart';
import 'package:i9t/src/features/fct/fct_seleciona_veiculo/fct_seleciona_veiculo.service.dart';
import 'package:i9t/src/features/fct/fct_seleciona_veiculo/fct_seleciona_veiculo.states.dart';

class FctSelecionaVeiculoController
    extends ValueNotifier<FctSelecionaVeiculoState> {
  FctSelecionaVeiculoController() : super(FctSelecionaVeiculoInitial());

  VeiculoService veiculoService = VeiculoService();

  pegaVeiculos() {
    try {
      value = FctSelecionaVeiculoLoading();
      veiculoService.pegaVeiculosPorStatus(statusVeiculo: 1).then((items) {
        if (items.isNotEmpty) {
          value = FctSelecionaVeiculoSuccess(veiculos: items);
        } else {
          value = FctSelecionaVeiculoFailure(
              error: 'Não existe veículos cadastrados');
        }
      });
    } catch (e) {
      value = FctSelecionaVeiculoFailure(error: e.toString());
    }
  }
}
