import 'package:i9t/src/features/fct/models/veiculo.model.dart';

abstract class FctSelecionaVeiculoState {
  List<VeiculoModel>? veiculos;
}

class FctSelecionaVeiculInitial extends FctSelecionaVeiculoState {}

class FctSelecionaVeiculLoading extends FctSelecionaVeiculoState {}

class FctSelecionaVeiculFailure extends FctSelecionaVeiculoState {
  final String error;

  FctSelecionaVeiculFailure({required this.error});
}

class FctSelecionaVeiculSuccess extends FctSelecionaVeiculoState {
  final List<VeiculoModel> veiculos;

  FctSelecionaVeiculSuccess({required this.veiculos});
}
