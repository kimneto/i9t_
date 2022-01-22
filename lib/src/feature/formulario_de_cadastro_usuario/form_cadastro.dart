import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:i9t/src/component/custom_input_field.dart';
import 'package:i9t/src/feature/login/login.controller.dart';
import 'package:i9t/src/services/autentica_pm.dart';
import 'package:i9t/src/shared/tema.dart';
import 'package:provider/src/provider.dart';

class FormCadastro extends StatefulWidget {
  @override
  _FormCadastroState createState() => _FormCadastroState();
}

class _FormCadastroState extends State<FormCadastro> {
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(
                        FontAwesomeIcons.chevronLeft,
                        size: 30,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    'i9t',
                    style: TextStyle(
                      fontSize: w * 0.08,
                      fontFamily: 'Gil',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: w * 0.3,
              padding: EdgeInsets.fromLTRB(30, 0, 20, 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Cadastro",
                    style: TextStyle(
                        fontSize: w / 15,
                        fontWeight: FontWeight.w900,
                        color: pretoi9t),
                  ),
                  Row(
                    children: [
                      Text("Entre com seus dados relacionados a sua função.",
                          style: TextStyle(fontSize: w / 30, color: cinzai9t)),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 30, 10, 10),
                    child: Column(
                      children: [
                        CustomInputField(
                          h: h,
                          w: w,
                          controller: TextEditingController(),
                          maxLength: 11,
                          keyboardType: TextInputType.text,
                          isPassword: false,
                          label: 'Nome Completo',
                          hint: 'Nome Completo',
                          hasIcon: true,
                          icon: Icon(Icons.person),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomInputField(
                          h: h,
                          w: w,
                          controller: TextEditingController(),
                          maxLength: 11,
                          keyboardType: TextInputType.number,
                          isPassword: false,
                          label: 'CPF',
                          hint: 'CPF',
                          hasIcon: true,
                          icon: Icon(Icons.person),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomInputField(
                          h: h,
                          w: w,
                          controller: TextEditingController(),
                          maxLength: 11,
                          keyboardType: TextInputType.number,
                          isPassword: false,
                          label: 'RE',
                          hint: 'RE',
                          hasIcon: true,
                          icon: Icon(Icons.person),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomInputField(
                          h: h,
                          w: w,
                          controller: TextEditingController(),
                          maxLength: 11,
                          keyboardType: TextInputType.emailAddress,
                          isPassword: false,
                          label: 'Email',
                          hint: 'Email',
                          hasIcon: true,
                          icon: Icon(Icons.person),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomInputField(
                          h: h,
                          w: w,
                          controller: TextEditingController(),
                          maxLength: 9,
                          keyboardType: TextInputType.number,
                          isPassword: false,
                          label: 'Código da Unidade',
                          hint: 'Ex. 609008540',
                          hasIcon: true,
                          icon: Icon(Icons.person),
                        ),
                        SizedBox(
                          height: 0,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: [
                      Checkbox(
                          activeColor: amareloi9t,
                          checkColor: pretoi9t,
                          splashRadius: 5,
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  width: 100,
                                  color: pretoi9t,
                                  style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(3)),
                          materialTapTargetSize: MaterialTapTargetSize.padded,
                          value: true,
                          onChanged: (_) {
                            setState(() {
                              _ = _;
                            });
                          }),
                      Text(
                        'Confirmo que inseri os dados corretamente.',
                        style: TextStyle(color: pretoi9t),
                      ),
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    child: Container(
                      width: double.infinity,
                      height: 60,
                      decoration: BoxDecoration(
                          color: amareloi9t,
                          borderRadius:
                              BorderRadius.all(Radius.elliptical(10, 14))),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/login');
                        },
                        child: Center(
                          child: Text(
                            "Cadastrar",
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
  }
}
