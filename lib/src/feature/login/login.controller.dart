import 'package:flutter/material.dart';
import 'package:i9trafego/src/feature/login/states/login.state.dart';
import 'package:i9trafego/src/model/user.model.dart';
import 'package:i9trafego/src/services/autentica_pm.dart';
import 'package:i9trafego/src/services/user.service.dart';

class LoginController extends ValueNotifier<LoginState> {
  LoginController(LoginState value) : super(LoginInitial());
  final userService = UserService();
  final autentica = AutenticaPM();
  TextEditingController controllerCPF =
      TextEditingController(text: 30459220829.toString());
  TextEditingController controllerSenha =
      TextEditingController(text: 'mbz98r81');

  logar() async {
    value = LoginLoading();

    try {
      /*  verificaSeUsuarioExisteNaPM(controllerCPF.text, controllerSenha.text)
          .then((v) async {
        if (v) {*/
      final user = await userService.getUser(controllerCPF.text);
      value = LoginSuccess(user: user);
      /*   }
      });*/
    } catch (e) {
      value = LoginFailure(error: 'Algo deu errado $e');
    }
  }

  Future<bool> verificaSeUsuarioExisteNaPM(String CPF, String Senha) async =>
      await autentica.autenticaMike(CPF: CPF, Senha: Senha).then((value) {
        if (value.tipo == 'Sucesso') {
          return true;
        } else {
          return false;
        }
      });
}
