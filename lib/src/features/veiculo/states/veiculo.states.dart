import 'package:i9t/src/features/veiculo/model/veiculo.model.dart';

abstract class VeiculoState {
  List<VeiculoModel>? veiculos;
}

class VeiculoInitial extends VeiculoState {}

class VeiculoLoading extends VeiculoState {}

class VeiculoFailure extends VeiculoState {
  final String error;

  VeiculoFailure({required this.error});
}

class VeiculoSuccess extends VeiculoState {
  final List<VeiculoModel> veiculos;

  VeiculoSuccess({required this.veiculos});
}
