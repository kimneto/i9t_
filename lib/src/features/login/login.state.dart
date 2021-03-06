import 'package:i9t/src/features/condutor/condutor.model.dart';

abstract class LoginState {}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginConnectionStateError extends LoginState {}

class LoginFailureState extends LoginState {
  final String error;

  LoginFailureState({required this.error});
}

class LoginSuccessState extends LoginState {
  final CondutorModel condutor;

  LoginSuccessState({required this.condutor});
}
