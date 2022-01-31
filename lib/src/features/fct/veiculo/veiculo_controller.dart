import 'package:flutter/cupertino.dart';
import 'package:i9t/src/features/fct/fct_seleciona_veiculo/fct_seleciona_veiculo.service.dart';
import 'package:i9t/src/features/fct/veiculo/veiculo.model.dart';
import 'package:i9t/src/features/fct/veiculo/veiculo.state.dart';

class VeiculoController extends ValueNotifier<VeiculoState> {
  VeiculoController() : super(VeiculoInitialState());

  VeiculoService veiculoService = VeiculoService();

  pegaVeiculos() {
    try {
      value = VeiculoLoadingState();
      veiculoService.pegaVeiculosMenosStatusZero().then((items) {
        if (items.isNotEmpty) {
          value = VeiculoSuccessState(veiculo: VeiculoModel());
        } else {
          value = VeiculoFailureState(error: 'Não existe veículos cadastrados');
        }
      });
    } catch (e) {
      value = VeiculoFailureState(error: e.toString());
    }
  }
}
