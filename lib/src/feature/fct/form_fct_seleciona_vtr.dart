import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormFctSelecionaVtr extends StatefulWidget {
  FormFctSelecionaVtr({Key? key}) : super(key: key);

  @override
  _FormFctSelecionaVtrState createState() => _FormFctSelecionaVtrState();
}

class _FormFctSelecionaVtrState extends State<FormFctSelecionaVtr> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(30),
            child: Center(
              child: Text('Selecione a Viatura'),
            ),
          ),
          Container(
            height: 100,
            padding: EdgeInsets.all(30),
            child: Center(
              child: DropdownButton(
                value: 1,
                hint: Text('Selecione uma viatura'),
                enableFeedback: true,
                underline: Container(
                  height: 2,
                  color: Colors.red[600],
                ),
                isDense: false,
                isExpanded: true,
                borderRadius: BorderRadius.circular(10),
                icon: Icon(Icons.car_repair),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
                iconSize: 20,
                items: [
                  DropdownMenuItem(
                    child: Text('15113 - VW TAOS',
                        style: TextStyle(fontSize: 20, color: Colors.red)),
                    value: 1,
                  ),
                  DropdownMenuItem(
                    child: Text('09257 - FORD BRONCO'),
                    value: 2,
                  ),
                  DropdownMenuItem(
                    child: Text('03559 - HAMMER'),
                    value: 3,
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    value = value;
                  });
                },
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(30),
            child: Center(
              child: Column(
                children: [
                  Text('VW TAOS PREFIXO 15113'),
                  Text('PATRIMONIO 2000000000'),
                  Text('PLACA 0x0000'),
                  SizedBox(
                    height: 20,
                  ),
                  Text('HODOMETRO ATUAL'),
                  Text('260 000'),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Row(
                      children: [
                        Checkbox(value: false, onChanged: (_) {}),
                        Text(
                            'Confirmo estar devidamente habilitado\n  e apto a condução deste veículo.'),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(30),
                    child: MaterialButton(
                        color: Colors.amber,
                        child: Text('CONFIRMAR'),
                        onPressed: () {
                          Navigator.pushNamed(context, '/hodometro');
                        }),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
