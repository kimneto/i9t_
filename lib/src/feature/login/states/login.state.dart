import 'package:i9t/src/model/condutor.model.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginFailure extends LoginState {
  final String error;

  LoginFailure({required this.error});
}

class LoginSuccess extends LoginState {
  final CondutorModel condutor;

  LoginSuccess({required this.condutor});
}
