import '../models/fct.model.dart';

abstract class FctCadastroPartidaState {}

class FctCadastroPartidaInitialState extends FctCadastroPartidaState {}

class FctCadastroPartidaLoadingState extends FctCadastroPartidaState {}

class FctCadastroPartidaFailureState extends FctCadastroPartidaState {
  final String error;

  FctCadastroPartidaFailureState({required this.error});
}

class FctCadastroPartidaSuccessState extends FctCadastroPartidaState {
  FctCadastroPartidaSuccessState();
}
