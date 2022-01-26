import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:i9t/src/component/botao_grande.component.dart';
import 'package:i9t/src/component/custom_input_field.dart';
import 'package:i9t/src/shared/tema.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:timelines/timelines.dart';

class CadastroSaida extends StatefulWidget {
  const CadastroSaida({Key? key}) : super(key: key);

  @override
  _CadastroSaidaState createState() => _CadastroSaidaState();
}

class _CadastroSaidaState extends State<CadastroSaida> {
  @override
  Widget build(BuildContext context) {
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
              Navigator.of(context).pop();
            }),
        toolbarHeight: 80,
        elevation: 0,
        foregroundColor: Colors.transparent,
        backgroundColor: Color.fromARGB(0, 255, 255, 255),
        centerTitle: false,
        title: Container(
          child: Text(
            'Saída',
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
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Container(
                    width: 320,
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
                          texto: 'Sair',
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
