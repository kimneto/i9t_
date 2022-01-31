import 'package:flutter_modular/flutter_modular.dart';
import 'package:i9t/src/features/login/login.controller.dart';

class AuthGuard extends RouteGuard {
  AuthGuard() : super(redirectTo: '/login');

  @override
  bool canActivate(String path, ModularRoute router) {
    return Modular.get<LoginController>().estaLogado;
  }
}
