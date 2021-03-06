import 'package:i9t/src/features/fct/veiculo/veiculo.model.dart';

abstract class FctSelecionaVeiculoState {}

class FctSelecionaVeiculoInitial extends FctSelecionaVeiculoState {}

class FctSelecionaVeiculoLoading extends FctSelecionaVeiculoState {}

class FctSelecionaVeiculoFailure extends FctSelecionaVeiculoState {
  final String error;

  FctSelecionaVeiculoFailure({required this.error});
}

class FctSelecionaVeiculoSuccess extends FctSelecionaVeiculoState {
  final List<VeiculoModel> veiculos;

  FctSelecionaVeiculoSuccess({required this.veiculos});
}
