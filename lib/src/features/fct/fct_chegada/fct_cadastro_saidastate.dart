import '../models/fct.model.dart';

abstract class FctCadastroChegadaState {}

class FctCadastroChegadaInitialState extends FctCadastroChegadaState {}

class FctCadastroChegadaLoadingState extends FctCadastroChegadaState {}

class FctCadastroChegadaFailureState extends FctCadastroChegadaState {
  final String error;

  FctCadastroChegadaFailureState({required this.error});
}

class FctCadastroChegadaSuccessState extends FctCadastroChegadaState {
  FctCadastroChegadaSuccessState();
}
