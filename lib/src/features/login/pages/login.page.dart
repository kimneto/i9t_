import 'package:i9t/src/features/login/controllers/login.controller.dart';
import 'package:i9t/src/features/login/states/login.state.dart';
import 'package:provider/provider.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:i9t/src/component/botao_grande.component.dart';
import 'package:i9t/src/component/custom_input_field.dart';
import 'package:i9t/src/component/logo.dart';

import 'package:i9t/src/shared/tema.dart';

import '../../condutor/controllers/condutor.controller.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool saida = false;
  bool olhoMagico = false;
  String mensagemErro = "";

  @override
  Widget build(BuildContext context) {
    final loginController = context.watch<LoginController>();
    final condutorController = context.watch<CondutorController>();
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    Widget widget = Container();
    var state = loginController.value;

    if (state is LoginSuccessState) {
      condutorController.condutor = state.condutor;
      Future.delayed(Duration.zero, () async {
        await Navigator.of(context).popAndPushNamed('/home', arguments: state);
      });
    }

    if (state is LoginLoadingState) {
      widget = Expanded(
        child: Center(
          child: CircularProgressIndicator(
            color: amareloi9t,
            strokeWidth: 10,
          ),
        ),
      );
    }

    if (state is LoginFailureState) {
      mensagemErro = state.error;
      widget = Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(height: h / 6),
          Text(
            "Olá,",
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900),
          ),
          Text("Bem vindo",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900)),
          Row(
            children: [
              Text("Se você é novo por aqui / ",
                  style: TextStyle(fontSize: 12, color: Colors.grey)),
              InkWell(
                onTap: () => Navigator.pushNamed(context, '/cadastro'),
                child: Text("Cadastre-se",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ],
          ),
          Center(
            child: Container(
              padding: EdgeInsets.fromLTRB(0, 60, 0, 20),
              height: 400,
              width: 320,
              child: Center(
                child: Column(
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: mensagemErro != ''
                            ? Text(
                                "*$mensagemErro",
                                style: TextStyle(
                                    color: vermelhoi9t,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              )
                            : null),
                    CustomInputField(
                      h: h,
                      w: w,
                      controller: loginController.controllerCPF,
                      maxLength: 120,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        CpfInputFormatter(),
                      ],
                      isPassword: false,
                      label: 'CPF',
                      hint: 'CPF',
                      hasIcon: true,
                      icon: Icon(Icons.person),
                    ),
                    SizedBox(
                      height: 21,
                    ),
                    CustomInputField(
                      h: h,
                      w: w,
                      controller: loginController.controllerSenha,
                      maxLength: 20,
                      keyboardType: TextInputType.visiblePassword,
                      label: 'Senha',
                      isPassword: !olhoMagico,
                      hint: 'Senha do Holerite',
                      hasIcon: true,
                      botaoCampoForm: IconButton(
                          color: pretoi9t,
                          icon: olhoMagico
                              ? Icon(FontAwesomeIcons.eyeSlash,
                                  size: 16, color: cinzalitei9t)
                              : Icon(
                                  FontAwesomeIcons.eye,
                                  size: 16,
                                  color: cinzalitei9t,
                                ),
                          onPressed: () {
                            olhoMagico = !olhoMagico;
                          }),
                    ),
                    Center(
                      child: Container(
                        padding: EdgeInsets.only(top: 20),
                        child: Row(children: [
                          Text("Esqueceu a Senha? / ",
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey)),
                          InkWell(
                            onTap: () {
                              loginController.resetarSenha();
                            },
                            child: Text("Resetar",
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: pretoi9t,
                                )),
                          ),
                        ]),
                      ),
                    ),
                    SizedBox(
                      height: 21,
                    ),
                    Container(
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 10),
                          BotaoGrandeI9t(
                              texto: 'Entrar',
                              aoApertar: () => loginController.logar(),
                              estaAtivo: true)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    }

    if (state is LoginInitialState) {
      widget = Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(height: h / 6),
          Text(
            "Olá,",
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900),
          ),
          Text("Bem vindo",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900)),
          Row(
            children: [
              Text("Se você é novo por aqui / ",
                  style: TextStyle(fontSize: 12, color: Colors.grey)),
              InkWell(
                onTap: () => Navigator.pushNamed(context, '/cadastro'),
                child: Text("Cadastre-se",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ],
          ),
          Center(
            child: Container(
              padding: EdgeInsets.fromLTRB(0, 60, 0, 20),
              height: 400,
              width: 320,
              child: Center(
                child: Column(
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: mensagemErro != ''
                            ? Text(
                                "*$mensagemErro",
                                style: TextStyle(
                                    color: vermelhoi9t,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              )
                            : null),
                    CustomInputField(
                      h: h,
                      w: w,
                      controller: loginController.controllerCPF,
                      maxLength: 120,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        CpfInputFormatter(),
                      ],
                      isPassword: false,
                      label: 'CPF',
                      hint: 'CPF',
                      hasIcon: true,
                      icon: Icon(Icons.person),
                    ),
                    SizedBox(
                      height: 21,
                    ),
                    CustomInputField(
                      h: h,
                      w: w,
                      controller: loginController.controllerSenha,
                      maxLength: 20,
                      keyboardType: TextInputType.visiblePassword,
                      label: 'Senha',
                      isPassword: !olhoMagico,
                      hint: 'Senha do Holerite',
                      hasIcon: true,
                      botaoCampoForm: IconButton(
                          color: pretoi9t,
                          icon: olhoMagico
                              ? Icon(FontAwesomeIcons.eyeSlash,
                                  size: 16, color: cinzalitei9t)
                              : Icon(
                                  FontAwesomeIcons.eye,
                                  size: 16,
                                  color: cinzalitei9t,
                                ),
                          onPressed: () {
                            olhoMagico = !olhoMagico;
                          }),
                    ),
                    Center(
                      child: Container(
                        padding: EdgeInsets.only(top: 20),
                        child: Row(children: [
                          Text("Esqueceu a Senha? / ",
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey)),
                          InkWell(
                            onTap: () {
                              loginController.resetarSenha();
                            },
                            child: Text("Resetar",
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: pretoi9t,
                                )),
                          ),
                        ]),
                      ),
                    ),
                    SizedBox(
                      height: 21,
                    ),
                    Container(
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 10),
                          BotaoGrandeI9t(
                              texto: 'Entrar',
                              aoApertar: () => loginController.logar(),
                              estaAtivo: true)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    }

    return Scaffold(
      body: ListView(
        children: [
          Logo(tamanho: 50),
          Center(
            child: Container(
              width: 320,
              // padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: widget,
            ),
          ),
        ],
      ),
    );
  }
}
