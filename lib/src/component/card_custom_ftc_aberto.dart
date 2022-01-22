import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:i9t/src/shared/tema.dart';

class CardCustomFctAberto extends StatelessWidget {
  double w, h;

  CardCustomFctAberto({required this.w, required this.h});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 400,
          width: 350,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: cinzalitei9t,
                blurRadius: 10.0, // has the effect of softening the shadow
                spreadRadius: 1.0, // has the effect of extending the shadow
                offset: Offset(
                  10.0, // horizontal, move right 10
                  10.0, // vertical, move down 10
                ),
              ),
            ],
            color: ColorTween(begin: pretoi9t, end: pretoi9t)
                .evaluate(AlwaysStoppedAnimation(0.1)),
            border: Border.all(style: BorderStyle.none),
            borderRadius: BorderRadius.all(Radius.elliptical(38, 40)),
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Row(
              children: [
                Container(
                  //  color: Colors.red,
                  padding: EdgeInsets.only(top: 100),
                  width: 120,
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            FontAwesomeIcons.tachometerAlt,
                            color: cinzalitei9t,
                            size: h * 0.035,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '120.5 Km',
                            style: TextStyle(
                                fontSize: h * 0.015,
                                fontWeight: FontWeight.bold,
                                color: cinzalitei9t),
                          ),
                          Text('Utilizados',
                              style: TextStyle(
                                  fontSize: h * 0.015, color: cinzalitei9t))
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            FontAwesomeIcons.route,
                            color: cinzalitei9t,
                            size: h * 0.035,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '2',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: cinzalitei9t),
                          ),
                          Text('Pontos',
                              style:
                                  TextStyle(fontSize: 13, color: cinzalitei9t)),
                          SizedBox(
                            height: 30,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(FontAwesomeIcons.hourglassHalf,
                                  color: cinzalitei9t, size: 30),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                '01:25:00:00',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: cinzalitei9t),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(bottom: 65),
                    alignment: Alignment.bottomCenter,
                    child: Image.asset(
                      'assets/vtr.png',
                      colorBlendMode: BlendMode.softLight,
                      scale: 4,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 100),
                  width: 120,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 55,
                      ),
                      Column(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        //
        Positioned(
          top: 20,
          left: 26,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text(
                  'São Paulo',
                  style: TextStyle(
                      fontSize: h * 0.032,
                      fontWeight: FontWeight.bold,
                      color: cinzalitei9t),
                ),
              ),
              Container(
                child: Text(
                  'Viatura GM SPIN - Placa: ABC1234',
                  style: TextStyle(fontSize: h * 0.020, color: cinzalitei9t),
                ),
              ),
              Container(
                child: Text(
                  'Data Inicial: 01/01/22',
                  style: TextStyle(
                      fontSize: h * 0.020,
                      fontWeight: FontWeight.bold,
                      color: cinzalitei9t),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                margin: EdgeInsets.only(left: 190, top: h * 0.30),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 5,
                    ),
                    Center(
                      child: Text('Inserir\nParada',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: pretoi9t)),
                    ),
                  ],
                ),
                width: 120,
                height: 60,
                decoration: BoxDecoration(
                  color: amareloi9t,
                  borderRadius: BorderRadius.all(Radius.elliptical(18, 20)),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}


/*
Column(
          children: [
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: Container(
                  width: double.infinity,
                  child: Text('Ficha de Controle Tráfego CPI9-001/430/21')),
            )
          ],
        )
 Row(
        children: [
          Flexible(
            flex: 4,
            fit: FlexFit.tight,
            child: Container(
              alignment: Alignment.topLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Novo Destino: ?',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Total',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            fit: FlexFit.tight,
            flex: 2,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MaterialButton(
                      color: Colors.red,
                      textColor: cinzalitei9t,
                      onPressed: () {},
                      child: Text('DESTINO')),
                  MaterialButton(
                      color: Colors.green,
                      textColor: cinzalitei9t,
                      onPressed: () {
                        Navigator.pushNamed(context, '/parada');
                      },
                      child: Text('CHEGADA')),
                ],
              ),
            ),
          ),
        ],
      ),

*/
