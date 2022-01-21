import 'package:flutter/material.dart';
import 'package:i9trafego/src/feature/login/states/login.state.dart';
import 'package:i9trafego/src/model/condutor.model.dart';
import 'package:i9trafego/src/services/autentica_pm.dart';
import 'package:i9trafego/src/services/user.service.dart';

class LoginController extends ValueNotifier<LoginState> {
  LoginController(LoginState value) : super(LoginInitial());

  final userService = CondutorService();
  final autentica = AutenticaPM();
  TextEditingController controllerCPF =
      TextEditingController(text: 30459220829.toString());
  TextEditingController controllerSenha =
      TextEditingController(text: 'mbz98r81');

  logar() async {
    value = LoginLoading();

    try {
      verificaSeUsuarioExisteNaPM(controllerCPF.text, controllerSenha.text)
          .then((condutor) async {
        if (condutor) {
          userService.pegaUsuarioPorCpf(controllerCPF.text).then((c) =>
              c != null
                  ? value = LoginSuccess(user: c)
                  : value = LoginFailure(error: 'Usuário não encontrado'));
        }
      });
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
