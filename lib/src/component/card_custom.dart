import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:i9t/src/shared/tema.dart';

class CardCustom extends StatelessWidget {
  String? titulo, subtitulo, textoBotao;
  Function? aoApertar;
  CardCustom({
    this.titulo,
    this.subtitulo,
    this.textoBotao,
    this.aoApertar,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 8, 20, 8),
      height: 100,
      decoration: BoxDecoration(
          color: cinzaultralitei9t,
          border: Border.all(
            style: BorderStyle.none,
            width: 1,
          ),
          borderRadius: BorderRadius.all(Radius.elliptical(16, 20))),

      /* decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            style: BorderStyle.solid,
            width: 1,
            color: Colors.blue,
      */
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(
            flex: 1,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      enableFeedback: true,
                      icon: Icon(
                        FontAwesomeIcons.solidFilePdf,
                        color: pretoi9t,
                        size: 28,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/imprime-fct');
                      }),
                  Text(
                    'Gerar FCT',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(top: 0.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Data: 25/12/21', style: TextStyle(fontSize: 12)),
                  Text(
                    'Rio das Pedras',
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    'GW TAOS - I-25550',
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    '550 Minutos - 450 Kms',
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    'FCT: CPI9-001/420/22',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: Center(
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10.0,
                      spreadRadius: 1.0,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.white,
                ),
                child: Icon(
                  FontAwesomeIcons.trophy,
                  color: amareloi9t,
                  size: 25,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
