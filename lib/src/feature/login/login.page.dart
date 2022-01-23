import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:i9t/src/component/botao_grande.component.dart';
import 'package:i9t/src/component/custom_input_field.dart';
import 'package:i9t/src/component/logo.dart';
import 'package:i9t/src/feature/formulario_de_cadastro_usuario/form_cadastro.controller.dart';
import 'package:i9t/src/feature/formulario_de_cadastro_usuario/form_cadastro.dart';
import 'package:i9t/src/feature/login/login.controller.dart';
import 'package:i9t/src/model/condutor.model.dart';
import 'package:i9t/src/shared/tema.dart';
import 'package:provider/src/provider.dart';

import 'states/login.state.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool saida = false;
  bool olhoMagico = false;
  String mensagemErro = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final controller = context.read<FormCadastroController>();
    if (controller.condutorModel.cpf != null) {
      controller.cpfEditingController.text =
          controller.condutorModel.cpf.toString();
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    setState(() {
      final controller = context.read<LoginController>();
      controller.value = LoginInitial();
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<LoginController>();
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    return ValueListenableBuilder(
        valueListenable: controller,
        builder: (context, value, child) {
          debugPrint(value.toString());
          if (value is LoginSuccess) {
            Future.delayed(Duration.zero).then((_) {
              Navigator.of(context)
                  .popAndPushNamed('/home', arguments: controller.condutor);
            });
          }
          if (value is LoginLoading) {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(
                  color: amareloi9t,
                  strokeWidth: 10,
                ),
              ),
            );
          }

          if (value is LoginFailure) {
            mensagemErro = value.error;
            value = LoginInitial();
          }

          return Scaffold(
            body: SafeArea(
              child: ListView(
                children: [
                  Logo(tamanho: 50),
                  Center(
                    child: Container(
                      width: 320,
                      // padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(height: h / 6),
                          Text(
                            "Olá,",
                            style: TextStyle(
                                fontSize: 32, fontWeight: FontWeight.w900),
                          ),
                          Text("Bem vindo",
                              style: TextStyle(
                                  fontSize: 28, fontWeight: FontWeight.w900)),
                          Row(
                            children: [
                              Text("Se você é novo por aqui / ",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey)),
                              InkWell(
                                onTap: () =>
                                    Navigator.pushNamed(context, '/cadastro'),
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
                                        padding:
                                            const EdgeInsets.only(bottom: 8),
                                        child: mensagemErro != ''
                                            ? Text(
                                                "*$mensagemErro",
                                                style: TextStyle(
                                                    color: vermelhoi9t,
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            : null),
                                    CustomInputField(
                                      h: h,
                                      w: w,
                                      controller: controller.controllerCPF,
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
                                      controller: controller.controllerSenha,
                                      maxLength: 20,
                                      keyboardType:
                                          TextInputType.visiblePassword,
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
                                            setState(() {
                                              olhoMagico = !olhoMagico;
                                            });
                                          }),
                                    ),
                                    Center(
                                      child: Container(
                                        padding: EdgeInsets.only(top: 20),
                                        child: Row(children: [
                                          Text("Esqueceu a Senha? / ",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.grey)),
                                          InkWell(
                                            onTap: () {
                                              controller.resetarSenha();
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
                                              aoApertar: () =>
                                                  controller.logar(),
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
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
