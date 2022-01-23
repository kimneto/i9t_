import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:i9t/src/component/botao_grande.component.dart';
import 'package:i9t/src/component/custom_input_field.dart';
import 'package:i9t/src/component/logo.dart';
import 'package:i9t/src/feature/formulario_de_cadastro_usuario/form_cadastro.controller.dart';
import 'package:i9t/src/feature/formulario_de_cadastro_usuario/states/form_cadastro.state.dart';
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
    final controller = Provider.of<FormCadastroController>(context);

    return ValueListenableBuilder(
      valueListenable: controller,
      builder: (context, value, child) {
        if (value is FormCadastroLoading) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                color: amareloi9t,
                strokeWidth: 5,
              ),
            ),
          );
        }

        if (value is FormCadastroFailure) {
          controller.errorMessage = value.error;
          value = FormCadastroInitial();
        }

        if (value is FormCadastroSuccess) {
          setState(() {
            Navigator.of(context).pop();
          });
        }

        if (value is FormCadastroInitial) {
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
                          child: Logo(tamanho: 40)),
                    ],
                  ),
                  Center(
                    child: Container(
                      width: 320,
                      height: 600,
                      // padding: EdgeInsets.fromLTRB(20, 0, 20, 5),
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
                                fontSize: 26,
                                fontWeight: FontWeight.w900,
                                color: pretoi9t),
                          ),
                          Row(
                            children: [
                              Text(
                                  "Entre com seus dados relacionados a sua função.",
                                  style:
                                      TextStyle(fontSize: 13, color: cinzai9t)),
                            ],
                          ),
                          Text(controller.errorMessage,
                              style: TextStyle(
                                  fontSize: 13,
                                  color: vermelhoi9t,
                                  fontWeight: FontWeight.bold)),
                          Form(
                            key: controller.formKey,
                            child: Container(
                              padding: EdgeInsets.fromLTRB(0, 20, 10, 0),
                              child: Column(
                                children: [
                                  CustomInputField(
                                    h: h,
                                    w: w,
                                    controller:
                                        controller.nomeEditingController,
                                    maxLength: 11,
                                    keyboardType: TextInputType.text,
                                    isPassword: false,
                                    label: 'Nome Completo',
                                    validator: controller.validaCampoNome,
                                    hasIcon: true,
                                    inputFormatters: [],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  CustomInputField(
                                    h: h,
                                    w: w,
                                    controller: controller.cpfEditingController,
                                    maxLength: 11,
                                    keyboardType: TextInputType.number,
                                    isPassword: false,
                                    label: 'CPF',
                                    hint: 'CPF',
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                      CpfInputFormatter(),
                                    ],
                                    hasIcon: true,
                                    icon: Icon(Icons.person),
                                    validator: controller.validaCampoCpf,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  CustomInputField(
                                    h: h,
                                    w: w,
                                    controller:
                                        controller.emailEditingController,
                                    maxLength: 11,
                                    keyboardType: TextInputType.emailAddress,
                                    validator: controller.validaCampoEmail,
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
                                    validator: controller.validaCampoCodUnidade,
                                    controller:
                                        controller.codUnidadeEditingController,
                                    maxLength: 9,
                                    keyboardType: TextInputType.number,
                                    isPassword: false,
                                    label: 'Código da Unidade',
                                    hint: 'Ex. 609008540',
                                    hasIcon: true,
                                    icon: Icon(Icons.person),
                                  ),
                                  SizedBox(
                                    height: 26,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(bottom: 20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
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
                                            borderRadius:
                                                BorderRadius.circular(3)),
                                        materialTapTargetSize:
                                            MaterialTapTargetSize.padded,
                                        value: controller.checkBox,
                                        onChanged: (_) {
                                          setState(() {
                                            controller.checkBox =
                                                !controller.checkBox;
                                          });
                                        }),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Confirmo que meus dados estão corretos.',
                                      style: TextStyle(
                                          color: pretoi9t, fontSize: 13),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Container(
                                    width: double.infinity,
                                    child: BotaoGrandeI9t(
                                      estaAtivo: controller.checkBox,
                                      texto: 'Cadastrar',
                                      aoApertar: () {
                                        controller.cadastrarCondutor();
                                      },
                                    ),
                                  ),
                                ),
                              ],
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
        }

        return Container();
      },
    );
  }
}
