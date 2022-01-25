import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:i9t/src/shared/tema.dart';

class CardCustom extends StatelessWidget {
  Function? aoApertar;
  String? dataPartida;
  String? primeiraParada;
  String? veiculo;
  String? prefixo;
  String? tempoDeUso;
  String? distanciaDeUso;
  String? numeroDocumento;
  String? id;
  Widget? level;

  CardCustom({
    this.id,
    this.dataPartida,
    this.primeiraParada,
    this.veiculo,
    this.prefixo,
    this.tempoDeUso,
    this.distanciaDeUso,
    this.numeroDocumento,
    required this.aoApertar,
    this.level,
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
                        aoApertar!();
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
                  Text('Data: $dataPartida', style: TextStyle(fontSize: 12)),
                  Text(
                    '$primeiraParada',
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    '$veiculo - $prefixo',
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    '$tempoDeUso Minutos - $distanciaDeUso Kms',
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    'FCT: $numeroDocumento',
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
                child: level,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
