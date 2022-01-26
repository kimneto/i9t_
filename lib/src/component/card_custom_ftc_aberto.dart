import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:i9t/src/component/botao_grande.component.dart';
import 'package:i9t/src/component/custom_clip.dart';
import 'package:i9t/src/shared/tema.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CardCustomFctAberto extends StatelessWidget {
  Function aoApertar;
  CardCustomFctAberto({required this.aoApertar, required this.entradaSaida});
  int entradaSaida = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 250,
                width: 350,
                padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: cinzalitei9t,
                      blurRadius: 10.0,
                      spreadRadius: 1.0,
                      offset: Offset(
                        10.0,
                        10.0,
                      ),
                    ),
                  ],
                  color: ColorTween(begin: pretoi9t, end: pretoi9t)
                      .evaluate(AlwaysStoppedAnimation(0.1)),
                  border: Border.all(style: BorderStyle.none),
                  borderRadius: BorderRadius.all(Radius.elliptical(38, 40)),
                ),
              ),
              Container(
                height: 250,
                width: 350,
                child: Container(
                  child: Image.asset('assets/vtr.png',
                      scale: 2.8,
                      fit: BoxFit.none,
                      alignment: Alignment(0, -4.5)),
                ),
              ),
              Container(
                width: 350,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 10, left: 20, right: 20),
                      decoration: BoxDecoration(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Row(
                                    children: [
                                      Icon(
                                        FontAwesomeIcons.mapMarkerAlt,
                                        size: 14,
                                        color: cinzalitei9t,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        'São Paulo',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: cinzalitei9t),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        '- FCT CPI9-026/440/22',
                                        style: TextStyle(
                                            fontSize: 14, color: cinzalitei9t),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  child: Text(
                                    'Viatura GM SPIN - Placa: ABC1234',
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: cinzalitei9t,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    'Data Inicial: 01/01/22',
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                        color: cinzalitei9t),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    'Patrimonio: 123456789',
                                    style: TextStyle(
                                        fontSize: 9, color: cinzalitei9t),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.tachometerAlt,
                                      color: cinzalitei9t,
                                      size: 25,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      '120.5 Km',
                                      style: TextStyle(
                                          fontSize: 10, color: cinzalitei9t),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Icon(FontAwesomeIcons.hourglassHalf,
                                        color: cinzalitei9t, size: 25),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      '01:25:00:00',
                                      style: TextStyle(
                                          fontSize: 10, color: cinzalitei9t),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.route,
                                      color: cinzalitei9t,
                                      size: 25,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text('2 Pontos',
                                        style: TextStyle(
                                            fontSize: 10, color: cinzalitei9t)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(90)),
                  color: amareloi9t,
                ),
                margin: EdgeInsets.only(left: 290),
                width: 60,
                height: 60,
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
                        color: pretoi9t,
                        size: 30,
                      ),
                    ],
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/finalizar');
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          entradaSaida == 1
              ? Container(
                  width: 350,
                  child: BotaoGrandeI9t(
                    texto: 'Inserir Chegada',
                    estaAtivo: true,
                    cor: amareloi9t,
                    aoApertar: () =>
                        Navigator.of(context).pushNamed('/chegada'),
                  ),
                )
              : Container(
                  width: 350,
                  child: BotaoGrandeI9t(
                    texto: 'Inserir Saída',
                    estaAtivo: true,
                    aoApertar: () => Navigator.of(context).pushNamed('/saida'),
                  ),
                )
        ],
      ),
    );
  }
}


/*
            Stack(
                fit: StackFit.passthrough,
                children: [
                  Container(
                    color: amareloi9t,
                    width: 40,
                    height: double.infinity,
                  ),
                  ClipPath(
                    clipper: MyCustomClipper(),
                    child: Container(
                      color: pretoi9t,
                      width: 40,
                      child: 
                    ),
                  ),
                ],
              ),
*/
              //
          