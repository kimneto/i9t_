import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:i9t/src/component/botao_grande.component.dart';
import 'package:i9t/src/component/custom_input_field.dart';
import 'package:i9t/src/shared/tema.dart';
import 'package:timelines/timelines.dart';

import '../fct_components/fct_aberta/fct_aberta.controller.dart';
import 'fct_cadastro_chegada.controller.dart';

class CadastroChegada extends StatefulWidget {
  const CadastroChegada({Key? key}) : super(key: key);

  @override
  _CadastroChegadaState createState() => _CadastroChegadaState();
}

class _CadastroChegadaState extends State<CadastroChegada> {
  @override
  Widget build(BuildContext context) {
    final fctCadastroChegadaController =
        context.watch<FctCadastroChegadaController>();
    final fctAbertaController = context.watch<FctAbertaController>();
    fctCadastroChegadaController.fctAbertaController = fctAbertaController;
    return Scaffold(
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
                        .localizacaoEditingController,
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
                          validator:
                              fctCadastroChegadaController.validaCampoHodometro,
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
                              fctCadastroChegadaController.validaFormFct();
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
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.addPolygon([
      Offset(0, 0),
      Offset(80, 0),
      Offset(80, 80),
      Offset(80, 80),
      Offset(18, 80),
      Offset(0, 63),
    ], true);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    throw UnimplementedError();
  }
}
