import 'package:flutter/material.dart';
import 'package:i9t/src/features/fct/fct_seleciona_veiculo/fct_seleciona_veiculo.service.dart';
import 'package:i9t/src/features/fct/fct_seleciona_veiculo/fct_seleciona_veiculo.states.dart';

class FctSelecionaVeiculoController
    extends ValueNotifier<FctSelecionaVeiculoState> {
  FctSelecionaVeiculoController() : super(FctSelecionaVeiculInitial());

  VeiculoService veiculoService = VeiculoService();

  pegaVeiculos() {
    try {
      value = FctSelecionaVeiculLoading();
      veiculoService.pegaVeiculosMenosStatusZero().then((items) {
        if (items.isNotEmpty) {
          value = FctSelecionaVeiculSuccess(veiculos: items);
        } else {
          value = FctSelecionaVeiculFailure(
              error: 'Não existe veículos cadastrados');
        }
      });
    } catch (e) {
      value = FctSelecionaVeiculFailure(error: e.toString());
    }
  }
}
