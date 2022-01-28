import 'package:i9t/src/features/fct/models/fct.model.dart';

abstract class CadastroOdometroInicialState {}

class CadastroOdometroInicialInitialState extends CadastroOdometroInicialState {
}

class CadastroOdometroInicialLoadingState extends CadastroOdometroInicialState {
}

class CadastroOdometroInicialFailureState extends CadastroOdometroInicialState {
  final String error;

  CadastroOdometroInicialFailureState({required this.error});
}

class CadastroOdometroInicialSuccessState extends CadastroOdometroInicialState {
  final FctModel fct;

  CadastroOdometroInicialSuccessState({required this.fct});
}
