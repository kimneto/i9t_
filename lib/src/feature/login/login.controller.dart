import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:i9t/src/feature/login/states/login.state.dart';
import 'package:i9t/src/model/condutor.model.dart';
import 'package:i9t/src/services/autentica_pm.dart';
import 'package:i9t/src/services/condutor.service.dart';
import 'package:i9t/src/shared/settings.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginController extends ValueNotifier<LoginState> {
  LoginController(LoginState value) : super(LoginInitial());
  final condutor = CondutorModel();
  final userService = CondutorService();
  final autentica = AutenticaPM();

  TextEditingController controllerCPF = TextEditingController();
  TextEditingController controllerSenha = TextEditingController();

  logar() async {
    CPFValidator.strip(controllerCPF.text);
    // 1 - Coloca a Pagina no modo Status
    value = LoginLoading();
    // 2 - Verifica se o CPF e a Senha estão preenchidos
    if (CPFValidator.strip(controllerCPF.text).isEmpty ||
        controllerSenha.text.isEmpty) {
      value = LoginFailure(error: 'Preencha o CPF e a Senha para continuar!');
      return;
    }
    // 3 - Verifica se o CPF e a Senha estão corretos
    await autentica
        .autenticaMike(
            CPF: CPFValidator.strip(controllerCPF.text),
            Senha: controllerSenha.text)
        .then((v) {
      if (v.tipo == 'Sucesso') {
        userService
            .pegaCondutorPorCpf(CPFValidator.strip(controllerCPF.text))
            .then((c) =>
                // ignore: unnecessary_null_comparison
                (c != null)
                    ? value = LoginSuccess(condutor: c)
                    : value = LoginFailure(error: 'Usuário não encontrado!'));
      } else {
        value = LoginFailure(error: 'Usuário ou senha inválido');
      }
    });
  }

  void resetarSenha() async {
    if (!await launch(URL_RESETAR_SENHA))
      throw 'Could not launch $URL_RESETAR_SENHA';
  }
}
