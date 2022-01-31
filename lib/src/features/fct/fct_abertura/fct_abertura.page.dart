import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:i9t/src/component/botao_grande.component.dart';
import 'package:i9t/src/component/card_veiculo_selecionado.component.dart';
import 'package:i9t/src/component/custom_input_field.dart';
import 'package:i9t/src/features/condutor/condutor.controller.dart';
import 'package:i9t/src/features/fct/fct_abertura/fct_abertura.controller.dart';
import 'package:i9t/src/features/fct/veiculo/veiculo.model.dart';
import 'package:i9t/src/features/fct/fct_abertura/fct_abertura.state.dart';
import 'package:i9t/src/shared/tema.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class FctAberturaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final fctAberturaController = context.watch<FctAberturaController>();
    fctAberturaController.condutorController =
        context.watch<CondutorController>();

    var state = fctAberturaController.value;

    fctAberturaController.veiculoModel =
        ModalRoute.of(context)?.settings.arguments as VeiculoModel;
    Widget? widget;

    if (state is FctAberturaInitialState) {
      widget = Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () => Modular.to.navigate('/seleciona-veiculo'),
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
            CardVeiculoSelecioando(fctAberturaController.veiculoModel),
            Form(
              key: fctAberturaController.formKey,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: Center(
                      child: CustomInputField(
                        controller:
                            fctAberturaController.localizacaoEditingController,
                        hasIcon: true,
                        isPassword: false,
                        maxLength: 10,
                        keyboardType: TextInputType.text,
                        validator: fctAberturaController.validaCampoLocalizacao,
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
                        controller: fctAberturaController
                            .odometroInicialEditingController,
                        hasIcon: true,
                        isPassword: false,
                        validator:
                            fctAberturaController.validaCampoOdometroInicial,
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
                            value: fctAberturaController.checkBox.value,
                            onChanged: (_) {
                              fctAberturaController.checkBox.value =
                                  !fctAberturaController.checkBox.value;
                            }),
                        valueListenable: fctAberturaController.checkBox,
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
                      valueListenable: fctAberturaController.checkBox,
                      builder: (_, __, ___) => BotaoGrandeI9t(
                          texto: 'Pegar Veículo Agora',
                          aoApertar: () {
                            fctAberturaController.criaNovoFctbertaComTrafego();
                          },
                          estaAtivo: fctAberturaController.checkBox.value),
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
      widget = Scaffold(
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
      Modular.to.navigate("/");
    }

    if (state is FctAberturaLoadingState) {
      widget = Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            color: amareloi9t,
            strokeWidth: 10,
          ),
        ),
      );
    }

    return widget ?? Container();
  }
}
