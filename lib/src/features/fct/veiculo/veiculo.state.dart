import 'package:i9t/src/features/fct/veiculo/veiculo.model.dart';

abstract class VeiculoState {}

class VeiculoInitialState extends VeiculoState {}

class VeiculoLoadingState extends VeiculoState {}

class VeiculoConnectionStateError extends VeiculoState {}

class VeiculoFailureState extends VeiculoState {
  final String error;

  VeiculoFailureState({required this.error});
}

class VeiculoSuccessState extends VeiculoState {
  final VeiculoModel veiculo;

  VeiculoSuccessState({required this.veiculo});
}
