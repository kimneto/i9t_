import 'package:flutter/cupertino.dart';
import 'package:i9t/src/services/veiculo.service.dart';
import 'package:i9t/src/features/fct/veiculo/veiculo.model.dart';
import 'package:i9t/src/features/fct/veiculo/veiculo.state.dart';

class VeiculoController extends ValueNotifier<VeiculoState> {
  VeiculoController() : super(VeiculoInitialState());

  VeiculoService veiculoService = VeiculoService();

  pegaVeiculos() {
    try {
      value = VeiculoLoadingState();
      veiculoService.pegaVeiculosPorStatus(statusVeiculo: 0).then((items) {
        if (items.sucesso == true) {
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
