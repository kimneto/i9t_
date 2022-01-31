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

class FinalizaFctPage extends StatelessWidget {
  const FinalizaFctPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [],
        leading: IconButton(
            iconSize: 30,
            icon: Icon(
              FontAwesomeIcons.chevronLeft,
              size: 30,
              color: brancoi9t,
            ),
            onPressed: () {
              Modular.to.pop();
            }),
        toolbarHeight: 80,
        elevation: 0,
        backgroundColor: pretoi9t,
        centerTitle: false,
        title: Container(
          child: Text(
            'Finalização de FCT',
            textAlign: TextAlign.start,
            style: TextStyle(
                color: brancoi9t, fontSize: 22, fontWeight: FontWeight.bold),
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
                Padding(
                  padding: const EdgeInsets.only(top: 0.0, bottom: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 1,
                        child: Container(
                          height: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: pretoi9t,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                MdiIcons.mapMarkerDistance,
                                color: cinzaultralitei9t,
                                size: 40,
                              ),
                              Center(
                                child: Text('152',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: cinzaultralitei9t,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Text('Kilometros',
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: cinzaultralitei9t,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Flexible(
                        flex: 1,
                        child: Container(
                          height: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: amareloi9t,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                MdiIcons.clockOutline,
                                color: pretoi9t,
                                size: 40,
                              ),
                              Center(
                                child: Text('350',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: pretoi9t,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Text('Minutos',
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: pretoi9t,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Flexible(
                      child: CustomInputField(
                        onTap: () {},
                        maxLines: 8,
                        controller: TextEditingController(
                            text: 'Viatura abastecida, óleo e filtro ok '),
                        maxLength: 500,
                        keyboardType: TextInputType.multiline,
                        isPassword: false,
                        label: 'Observações',
                        hasIcon: true,
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
                          texto: 'Finalizar',
                          aoApertar: () {
                            Modular.to.popAndPushNamed('/');
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
