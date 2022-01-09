import 'package:flutter/material.dart';
import 'package:i9trafego/src/component/custom_input_field.dart';
import 'package:i9trafego/src/feature/home/home.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool saida = false;

  @override
  Widget build(BuildContext context) {
    ModalRoute.of(context)?.settings.arguments != null
        ? saida = ModalRoute.of(context)?.settings.arguments as bool
        : saida;

    if (saida) {
      Navigator.of(context).pop();
    }

    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image.asset(
              "assets/logo.png",
              height: 350,
              width: 350,
            ),
            SizedBox(height: 80),
            Center(
              child: Text(
                "É NECESSÁRIO CADASTRO ANTES DE COMEÇAR",
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
            Column(
              children: [
                CustomInputField(
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
                  label: 'SENHA',
                  isPassword: true,
                  hint: 'Senha do Holerite',
                  hasIcon: true,
                  icon: Icon(Icons.lock),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              child: MaterialButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Home();
                      },
                    ),
                  );
                },
                child: Text(
                  "PRONTO",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
