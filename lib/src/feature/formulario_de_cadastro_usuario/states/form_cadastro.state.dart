import 'package:i9t/src/model/condutor.model.dart';

abstract class FormCadastroState {}

class FormCadastroInitial extends FormCadastroState {}

class FormCadastroLoading extends FormCadastroState {}

class FormCadastroFailure extends FormCadastroState {
  final String error;

  FormCadastroFailure({required this.error});
}

class FormCadastroSuccess extends FormCadastroState {
  final CondutorModel condutor;

  FormCadastroSuccess({required this.condutor});
}
