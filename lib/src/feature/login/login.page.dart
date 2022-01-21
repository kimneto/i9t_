import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:i9trafego/src/component/custom_input_field.dart';
import 'package:i9trafego/src/feature/login/login.controller.dart';
import 'package:i9trafego/src/services/autentica_pm.dart';
import 'package:provider/src/provider.dart';

import 'states/login.state.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool saida = false;
  bool olhoMagico = false;

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<LoginController>();

    return ValueListenableBuilder(
        valueListenable: controller,
        builder: (context, value, child) {
          if (value is LoginSuccess) {
            Future.delayed(Duration.zero).then((_) {
              Navigator.of(context)
                  .pushReplacementNamed('/home', arguments: value.user);
            });
          }
          if (value is LoginLoading) {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }

          if (value is LoginFailure) {
            return Center(
              child: Text(value.error),
            );
          }

          return Scaffold(
            body: ListView(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        children: [
                          Image.asset(
                            "assets/logo.png",
                            height: MediaQuery.of(context).size.height * 0.3,
                            width: MediaQuery.of(context).size.height * 0.3,
                          ),
                          Text("i9FCT",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              )),
                        ],
                      ),
                      SizedBox(height: 80),
                      Center(
                        child: Column(
                          children: [
                            Text(
                              "É NECESSÁRIO CADASTRO ANTES DE COMEÇAR",
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                            SizedBox(height: 20),
                            Text(
                              "Clique aqui para se cadastrar",
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          CustomInputField(
                            controller: controller.controllerCPF,
                            maxLength: 11,
                            keyboardType: TextInputType.number,
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
                            controller: controller.controllerSenha,
                            maxLength: 20,
                            keyboardType: TextInputType.visiblePassword,
                            label: 'SENHA',
                            isPassword: !olhoMagico,
                            hint: 'Senha do Holerite',
                            hasIcon: true,
                            icon: GestureDetector(
                              onTap: () => setState(() {
                                olhoMagico = !olhoMagico;
                              }),
                              child: olhoMagico
                                  ? Icon(Icons.visibility_off)
                                  : Icon(Icons.visibility),
                            ),
                          )
                        ],
                      ),
                      Container(
                        width: double.infinity,
                        child: MaterialButton(
                          onPressed: () {
                            controller.logar();
                          },
                          child: Text(
                            "PRONTO",
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
}
