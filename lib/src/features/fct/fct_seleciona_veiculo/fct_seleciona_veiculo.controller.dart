import 'package:flutter/material.dart';
import 'package:i9t/src/features/fct/fct_seleciona_veiculo/fct_seleciona_veiculo.service.dart';
import 'package:i9t/src/features/fct/fct_seleciona_veiculo/fct_seleciona_veiculo.states.dart';
import 'package:i9t/src/features/fct/veiculo/veiculo.model.dart';

class FctSelecionaVeiculoController
    extends ValueNotifier<FctSelecionaVeiculoState> {
  FctSelecionaVeiculoController() : super(FctSelecionaVeiculoInitial());

  VeiculoService veiculoService = VeiculoService();

  pegaVeiculos(int statusVeiculo) {
    List<VeiculoModel> veiculos = [];
    try {
      value = FctSelecionaVeiculoLoading();
      veiculoService
          .pegaVeiculosPorStatus(statusVeiculo: statusVeiculo)
          .then((items) {
        if (items.sucesso == true && items.erro == null) {
          items.data.forEach((item) {
            veiculos.add(VeiculoModel.fromJson(item));
          });
          value = FctSelecionaVeiculoSuccess(veiculos: veiculos);
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
