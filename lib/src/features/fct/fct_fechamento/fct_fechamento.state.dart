import '../models/fct.model.dart';

abstract class FctFechamentoState {}

class FctFechamentoInitialState extends FctFechamentoState {}

class FctFechamentoLoadingState extends FctFechamentoState {}

class FctFechamentoFailureState extends FctFechamentoState {
  final String error;

  FctFechamentoFailureState({required this.error});
}

class FctFechamentoSuccessState extends FctFechamentoState {
  FctFechamentoSuccessState();
}
