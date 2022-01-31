import 'package:i9t/src/features/condutor/condutor.model.dart';

abstract class CadastroCondutorState {}

class CadastroCondutorInitial extends CadastroCondutorState {}

class CadastroCondutorLoading extends CadastroCondutorState {}

class CadastroCondutorFailure extends CadastroCondutorState {
  final String error;

  CadastroCondutorFailure({required this.error});
}

class CadastroCondutorSuccess extends CadastroCondutorState {
  final CondutorModel condutor;

  CadastroCondutorSuccess({required this.condutor});
}
