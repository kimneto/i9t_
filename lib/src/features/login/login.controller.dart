import 'dart:io';

import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:i9t/src/features/condutor/condutor.model.dart';
import 'package:i9t/src/data/autentica_pm.service.dart';
import 'package:i9t/src/features/condutor/condutor.service.dart';
import 'package:i9t/src/shared/settings.dart';

import 'package:url_launcher/url_launcher.dart';

import 'login.state.dart';

class LoginController extends ValueNotifier<LoginState> {
  LoginController(LoginState value) : super(LoginInitialState());

  final condutorService = CondutorService();
  final autenticaPM = AutenticaPM();

  TextEditingController controllerCPF =
      TextEditingController(text: '30459220829');
  TextEditingController controllerSenha =
      TextEditingController(text: 'mbz98r81');

  bool estaLogado = false;
  String mensagemErro = "";

  ValueNotifier<bool> olhoMagico = ValueNotifier<bool>(false);

  logar() async {
    try {
      //VERIFICA CONEXAO SERVIDOR PM

      CPFValidator.strip(controllerCPF.text);
      // 1 - Coloca a Pagina no modo Status
      value = LoginLoadingState();
      // 2 - Verifica se o CPF e a Senha estão preenchidos
      if (CPFValidator.strip(controllerCPF.text).isEmpty ||
          controllerSenha.text.isEmpty) {
        value = LoginFailureState(
            error: 'Preencha o CPF e a Senha para continuar!');
        return;
      }
      // 3 - Verifica se o CPF e a Senha estão corretos
      await autenticaPM
          .autenticaMike(
              CPF: CPFValidator.strip(controllerCPF.text),
              Senha: controllerSenha.text)
          .then((v) {
        if (true /*v.tipo == 'Sucesso'*/) {
          condutorService
              .pegaCondutorPorCpf(CPFValidator.strip(controllerCPF.text))
              .then((c) {
            print(c.data.first);
            if (c.sucesso == true) {
              value = LoginSuccessState(
                  condutor: CondutorModel.fromJson(c.data.first));

              estaLogado = true;
            } else {
              value = LoginFailureState(error: 'Condutor não encontrado!');
            }
          });
        }
      });
    } catch (e) {
      value = LoginFailureState(error: '$e');
    }
  }

  void resetarSenha() async {
    if (!await launch(URL_RESETAR_SENHA))
      throw 'Could not launch $URL_RESETAR_SENHA';
  }
}
