import 'package:flutter/material.dart';

class CardCustomFctAberto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 200,
          width: 400,
          decoration: BoxDecoration(
            color: Colors.blue[100],
            image: DecorationImage(
                scale: 3.0,
                image: AssetImage('assets/vtr.png'),
                fit: BoxFit.none,
                alignment: AlignmentDirectional(1.8, 0)),
            border: Border.all(style: BorderStyle.none),
            borderRadius: BorderRadius.all(Radius.elliptical(38, 40)),
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(200, 0, 20, 0),
          ),
        ),
        //
        Positioned(
          top: 12,
          left: 16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text(
                  'São Paulo',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                child: Text(
                  'Viatura GM SPIN - Placa: ABC1234',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Container(
                child: Text(
                  'Data Inicial: 01/01/22',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 5,
                        ),
                        Center(
                          child: Text('INSERIR\nPARADA',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                        ),
                      ],
                    ),
                    width: 130,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.elliptical(18, 20)),
                    ),
                  ),
                ],
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
                      textColor: Colors.white,
                      onPressed: () {},
                      child: Text('DESTINO')),
                  MaterialButton(
                      color: Colors.green,
                      textColor: Colors.white,
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
