import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:i9t/src/component/botao_grande.component.dart';
import 'package:i9t/src/component/custom_input_field.dart';
import 'package:i9t/src/component/logo.dart';
import 'package:i9t/src/features/condutor/controllers/cadastro_condutor.controller.dart';
import 'package:i9t/src/features/condutor/state/cadastro.states.dart';
import 'package:i9t/src/shared/tema.dart';

class CadastroCondutor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    final controller = context.watch<CadastroCondutorController>();

    return ValueListenableBuilder(
      valueListenable: controller,
      builder: (context, value, child) {
        if (value is CadastroCondutorLoading) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                color: amareloi9t,
                strokeWidth: 10,
              ),
            ),
          );
        }

        if (value is CadastroCondutorFailure) {
          controller.errorMessage = value.error;
          value = CadastroCondutorInitial();
        }

        if (value is CadastroCondutorSuccess) {
          Future.delayed(Duration.zero, () async {
            Modular.to.pop();
          });
        }

        if (value is CadastroCondutorInitial) {
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
                            onPressed: () => Modular.to.pop(),
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
                                    ValueListenableBuilder(
                                        valueListenable: controller.checkBox,
                                        builder: (_, value, child) {
                                          return Checkbox(
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
                                              value: controller.checkBox.value,
                                              onChanged: (_) {
                                                controller.checkBox.value =
                                                    !controller.checkBox.value;
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
                                      child: ValueListenableBuilder(
                                          valueListenable: controller.checkBox,
                                          builder: (_, value, child) {
                                            return BotaoGrandeI9t(
                                                estaAtivo:
                                                    controller.checkBox.value,
                                                texto: 'Cadastrar',
                                                aoApertar: () => controller
                                                    .cadastrarCondutor());
                                          })),
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
