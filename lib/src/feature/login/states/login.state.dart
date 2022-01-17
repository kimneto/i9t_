import 'package:i9trafego/src/model/user.model.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginFailure extends LoginState {
  final String error;

  LoginFailure({required this.error});
}

class LoginSuccess extends LoginState {
  final UserModel user;

  LoginSuccess({required this.user});
}
