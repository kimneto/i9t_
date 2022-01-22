import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:i9t/src/component/custom_input_field.dart';
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
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 26.0, top: 12),
                        child: Text(
                          'i9t',
                          style: TextStyle(
                            color: pretoi9t,
                            fontSize: w * 0.15,
                            fontFamily: GoogleFonts.dosis().fontFamily,
                            fontWeight:
                                GoogleFonts.dosis(fontWeight: FontWeight.w700)
                                    .fontWeight,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: w * 0.3,
                    padding: EdgeInsets.fromLTRB(30, 0, 20, 10),
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
                                    fontSize: w / 30, color: Colors.grey)),
                            InkWell(
                              onTap: () =>
                                  Navigator.pushNamed(context, '/cadastro'),
                              child: Text("Cadastre-se",
                                  style: TextStyle(
                                    fontSize: w / 25,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 60, 0, 20),
                          height: h / 3,
                          child: Column(
                            children: [
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
                                keyboardType: TextInputType.visiblePassword,
                                label: 'Senha',
                                isPassword: !olhoMagico,
                                hint: 'Senha do Holerite',
                                hasIcon: true,
                                botaoCampoForm: IconButton(
                                    color: pretoi9t,
                                    icon: olhoMagico
                                        ? Icon(FontAwesomeIcons.eyeSlash,
                                            size: 20)
                                        : Icon(FontAwesomeIcons.eye, size: 20),
                                    onPressed: () {
                                      setState(() {
                                        olhoMagico = !olhoMagico;
                                      });
                                    }),
                              )
                            ],
                          ),
                        ),
                        Text(mensagemErro),
                        Row(children: [
                          Text("Esqueceu a Senha? / ",
                              style: TextStyle(
                                  fontSize: w / 30, color: Colors.grey)),
                          InkWell(
                            onTap: () {
                              controller.resetarSenha();
                            },
                            child: Text("Resetar",
                                style: TextStyle(
                                  fontSize: w / 25,
                                  fontWeight: FontWeight.bold,
                                  color: pretoi9t,
                                )),
                          ),
                        ]),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 10),
                        Container(
                          width: double.infinity,
                          child: GestureDetector(
                            onTap: () {
                              controller.logar();
                            },
                            child: Container(
                              width: double.infinity,
                              height: 60,
                              decoration: BoxDecoration(
                                  color: amareloi9t,
                                  borderRadius: BorderRadius.all(
                                      Radius.elliptical(10, 14))),
                              child: Center(
                                child: Text(
                                  "Entrar",
                                  style: TextStyle(
                                      color: pretoi9t,
                                      fontSize: w / 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
