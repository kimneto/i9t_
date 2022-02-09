import '../models/fct.model.dart';

abstract class FctCadastroSaidaState {}

class FctCadastroSaidaInitialState extends FctCadastroSaidaState {}

class FctCadastroSaidaLoadingState extends FctCadastroSaidaState {}

class FctCadastroSaidaFailureState extends FctCadastroSaidaState {
  final String error;

  FctCadastroSaidaFailureState({required this.error});
}

class FctCadastroSaidaSuccessState extends FctCadastroSaidaState {
  FctCadastroSaidaSuccessState();
}
