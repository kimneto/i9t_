import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:i9t/src/component/botao_grande.component.dart';
import 'package:i9t/src/component/custom_input_field.dart';
import 'package:i9t/src/shared/tema.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:timelines/timelines.dart';

import '../fct_components/fct_aberta/fct_aberta.controller.dart';
import 'fct_cadastro_chegada.controller.dart';
import 'fct_cadastro_chegada.state.dart';

class CadastroChegada extends StatefulWidget {
  const CadastroChegada({Key? key}) : super(key: key);

  @override
  _CadastroChegadaState createState() => _CadastroChegadaState();
}

class _CadastroChegadaState extends State<CadastroChegada> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final fctCadastroChegadaController =
        context.read<FctCadastroChegadaController>();
    final fctAbertaController = context.read<FctAbertaController>();
    fctCadastroChegadaController.fctAbertaController = fctAbertaController;
  }

  @override
  Widget build(BuildContext context) {
    final fctCadastroChegadaController =
        context.watch<FctCadastroChegadaController>();

    var state = fctCadastroChegadaController.value;

    Widget? widget;

    if (state is FctCadastroChegadaFailureState) {
      widget = Container(
        margin: EdgeInsets.fromLTRB(20, 8, 20, 8),
        height: 100,
        decoration: BoxDecoration(
            color: cinzaultralitei9t,
            border: Border.all(
              style: BorderStyle.none,
              width: 1,
            ),
            borderRadius: BorderRadius.all(Radius.elliptical(16, 20))),
        child: Center(
          child: Column(
            children: [
              Icon(
                MdiIcons.bug,
                color: amareloi9t,
                size: 40,
              ),
              Text(
                ' Não conseguimos carregar os seus tráfegos.\nTente novamente mais tarde.',
                textAlign: TextAlign.center,
                style: TextStyle(color: amareloi9t, fontSize: 12),
              ),
              Text(
                '${state.error}',
                style: TextStyle(color: cinzalitei9t, fontSize: 9),
              ),
            ],
          ),
        ),
      );
    }

    if (state is FctCadastroChegadaLoadingState) {
      widget = Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            color: amareloi9t,
            strokeWidth: 10,
          ),
        ),
      );
    }
    if (state is FctCadastroChegadaInitialState) {
      widget = Scaffold(
        appBar: AppBar(
          leading: IconButton(
              iconSize: 30,
              icon: Icon(
                FontAwesomeIcons.chevronLeft,
                size: 30,
                color: pretoi9t,
              ),
              onPressed: () {
                Modular.to.pop();
              }),
          toolbarHeight: 80,
          elevation: 0,
          foregroundColor: Colors.transparent,
          backgroundColor: Color.fromARGB(0, 255, 255, 255),
          centerTitle: false,
          title: Container(
            child: Text(
              'Chegada',
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: pretoi9t, fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: false,
          children: [
            Container(
              width: 300,
              padding: EdgeInsets.all(30),
              child: Form(
                key: fctCadastroChegadaController.formChegadaKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Cadastre sua chegada ao PDI "Ponto de Interesse"',
                          style: TextStyle(
                              color: pretoi9t,
                              fontSize: 13,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomInputField(
                      controller: fctCadastroChegadaController
                          .pontoParadaEditingController,
                      maxLength: 30,
                      validator:
                          fctCadastroChegadaController.validaCampoLocalizacao,
                      keyboardType: TextInputType.text,
                      isPassword: false,
                      label: '* Localização',
                      hasIcon: true,
                      hint: 'Digite o local da parada',
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(30),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: CustomInputField(
                            validator: fctCadastroChegadaController
                                .validaCampoHodometro,
                            onTap: () {},
                            controller: fctCadastroChegadaController
                                .hodometroEditingController,
                            maxLength: 11,
                            keyboardType: TextInputType.number,
                            isPassword: false,
                            label: '* Hodômetro',
                            hasIcon: true,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(8),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 165,
                          child: CustomInputField(
                            controller: fctCadastroChegadaController
                                .horaEditingController,
                            maxLength: 11,
                            keyboardType: TextInputType.datetime,
                            isPassword: false,
                            validator:
                                fctCadastroChegadaController.validaCampoHora,
                            label: '* Hora',
                            hasIcon: true,
                            hint: 'Hora da chegada',
                            onTap: () {},
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              HoraInputFormatter(),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Flexible(
                          flex: 1,
                          child: BotaoGrandeI9t(
                              texto: 'Inserir Chegada',
                              aoApertar: () {
                                fctCadastroChegadaController
                                    .inseriNovoTrafegoComPdi();
                              },
                              estaAtivo: true),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: Column(
                children: [
                  Center(
                    child: Text(
                      'Percurso',
                      style: TextStyle(
                          color: pretoi9t,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 450,
                    height: 450,
                    child: Timeline.tileBuilder(
                      theme: TimelineThemeData(
                          color: amareloi9t,
                          direction: Axis.vertical,
                          connectorTheme:
                              ConnectorThemeData(color: cinzalitei9t)),
                      builder: TimelineTileBuilder.fromStyle(
                        indicatorStyle: IndicatorStyle.dot,
                        contentsAlign: ContentsAlign.alternating,
                        oppositeContentsBuilder: (context, index) => Container(
                          padding: EdgeInsets.all(20),
                          child: Text('São Paulo - 12:35',
                              style: TextStyle(
                                  color: pretoi9t,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold)),
                        ),
                        itemCount: 10,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
    return widget ?? Container();
  }
}
