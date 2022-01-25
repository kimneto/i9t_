import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:i9t/src/component/botao_grande.component.dart';
import 'package:i9t/src/component/custom_input_field.dart';
import 'package:i9t/src/shared/tema.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:timelines/timelines.dart';

class CadastroChegada extends StatefulWidget {
  const CadastroChegada({Key? key}) : super(key: key);

  @override
  _CadastroChegadaState createState() => _CadastroChegadaState();
}

class _CadastroChegadaState extends State<CadastroChegada> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Stack(
            fit: StackFit.passthrough,
            children: [
              Container(
                color: amareloi9t,
                width: 80,
                height: double.infinity,
              ),
              ClipPath(
                clipper: MyCustomClipper(),
                child: Container(
                  color: pretoi9t,
                  width: 80,
                  child: IconButton(
                    highlightColor: amareloi9t,
                    color: amareloi9t,
                    focusColor: amareloi9t,
                    splashColor: amareloi9t,
                    icon: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          MdiIcons.carOff,
                          color: amareloi9t,
                          size: 30,
                        ),
                        Text('Finalizar',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: amareloi9t,
                              fontSize: 12,
                            ))
                      ],
                    ),
                    onPressed: () {
                      print('SAIR');
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
        leading: IconButton(
            iconSize: 30,
            icon: Icon(
              FontAwesomeIcons.chevronLeft,
              size: 30,
              color: pretoi9t,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            }),
        toolbarHeight: 80,
        elevation: 0,
        foregroundColor: Colors.transparent,
        backgroundColor: Color.fromARGB(0, 255, 255, 255),
        centerTitle: false,
        title: Container(
          child: Text(
            'Percurso',
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Form(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Veículo: Renault Duster - Prefixo 15113',
                        style: TextStyle(
                            color: pretoi9t,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Odômetro Anterior: 120000 Km',
                        style: TextStyle(
                            color: cinzai9t,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                CustomInputField(
                  controller: TextEditingController(),
                  maxLength: 30,
                  keyboardType: TextInputType.text,
                  isPassword: false,
                  label: '* Localização',
                  hasIcon: true,
                  hint: 'Digite o local da parada',
                  inputFormatters: [],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Flexible(
                      child: CustomInputField(
                        onTap: () {},
                        controller: TextEditingController(),
                        maxLength: 11,
                        keyboardType: TextInputType.number,
                        isPassword: false,
                        label: '* Odômetro',
                        hasIcon: true,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(11),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 140,
                      child: CustomInputField(
                        controller: TextEditingController(),
                        maxLength: 11,
                        keyboardType: TextInputType.datetime,
                        isPassword: false,
                        label: 'Hora',
                        hasIcon: true,
                        hint: 'Hora da parada',
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
                          texto: 'Inserir Percurso',
                          aoApertar: () {
                            print('CLICOU');
                          },
                          estaAtivo: true),
                    ),
                  ],
                ),
              ],
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
