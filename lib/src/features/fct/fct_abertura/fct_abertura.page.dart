import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:i9t/src/component/botao_grande.component.dart';
import 'package:i9t/src/component/card_veiculo_selecionado.component.dart';
import 'package:i9t/src/component/custom_input_field.dart';
import 'package:i9t/src/features/condutor/controllers/condutor.controller.dart';

import 'package:i9t/src/features/fct/fct_abertura/fct_abertura.controller.dart';
import 'package:i9t/src/features/fct/models/veiculo.model.dart';
import 'package:i9t/src/features/fct/fct_abertura/fct_abertura.state.dart';

import 'package:i9t/src/shared/tema.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class FctAberturaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = context.watch<FctAberturaController>();
    controller.condutorController = context.watch<CondutorController>();

    var state = controller.value;
    controller.veiculoModel =
        ModalRoute.of(context)?.settings.arguments as VeiculoModel;

    if (state is FctAberturaInitialState) {
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () => Modular.to.navigate('./seleciona-veiculo'),
              icon: Icon(
                MdiIcons.chevronLeft,
                size: 50,
                color: pretoi9t,
              )),
          title:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "Abertura de Controle de Tráfego",
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.w900, color: pretoi9t),
            ),
            Text("Digite o valor encontrado no painel do veículo.",
                style: TextStyle(fontSize: 13, color: cinzai9t)),
          ]),
          toolbarHeight: 80,
          elevation: 0,
          backgroundColor: brancoi9t,
          centerTitle: false,
        ),
        body: ListView(
          children: [
            CardVeiculoSelecioando(controller.veiculoModel),
            Form(
              key: controller.formKey,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: Center(
                      child: CustomInputField(
                        controller: controller.localizacaoEditingController,
                        hasIcon: true,
                        isPassword: false,
                        maxLength: 10,
                        keyboardType: TextInputType.text,
                        validator: controller.validaCampoLocalizacao,
                        label: 'Localização',
                        icon: Icon(
                          FontAwesomeIcons.tachometerAlt,
                          color: pretoi9t,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        left: 20, right: 20, top: 10, bottom: 10),
                    child: Center(
                      child: CustomInputField(
                        controller: controller.odometroInicialEditingController,
                        hasIcon: true,
                        isPassword: false,
                        validator: controller.validaCampoOdometroInicial,
                        maxLength: 10,
                        keyboardType: TextInputType.number,
                        label: 'Odômetro Inicial',
                        icon: Icon(
                          FontAwesomeIcons.tachometerAlt,
                          color: pretoi9t,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 00.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ValueListenableBuilder(
                        builder: (_, __, ___) => Checkbox(
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
                            value: controller.checkBox.value,
                            onChanged: (_) {
                              controller.checkBox.value =
                                  !controller.checkBox.value;
                            }),
                        valueListenable: controller.checkBox,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Confirmo que sou  habilitado e estou apto em todos \nos sentidos  para a condução deste veículo.',
                        style: TextStyle(color: pretoi9t, fontSize: 13),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                bottom: 30,
                top: 30,
              ),
              child: Center(
                child: Column(
                  children: [
                    ValueListenableBuilder(
                      valueListenable: controller.checkBox,
                      builder: (_, __, ___) => BotaoGrandeI9t(
                          texto: 'Pegar Veículo Agora',
                          aoApertar: () {
                            controller.criaNovoFctbertaComTrafego();
                          },
                          estaAtivo: controller.checkBox.value),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }

    if (state is FctAberturaFailureState) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                FontAwesomeIcons.spider,
                color: amareloi9t,
                size: 60,
              ),
              SizedBox(
                height: 10,
              ),
              Text('${state.error}', style: TextStyle(color: cinzai9t)),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 60.0, right: 60.0),
              )
            ],
          ),
        ),
      );
    }

    if (state is FctAberturaSuccessState) {
      SchedulerBinding.instance?.addPostFrameCallback((_) {
        Modular.to.navigate("/home");
      });
    }

    if (state is FctAberturaLoadingState) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            color: amareloi9t,
            strokeWidth: 10,
          ),
        ),
      );
    } else
      return Container();
  }
}



/*
 Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: pretoi9t,
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(10, 14))),
                    child: InkWell(
                      onTap: () {},
                      child: Center(
                        child: Text(
                          'Registrar Veículo, sem o odômetro',
                          style: TextStyle(
                              color: brancoi9t,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )
*/
