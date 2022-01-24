import 'package:flutter/material.dart';

class CadastroOdometroInicial extends StatefulWidget {
  const CadastroOdometroInicial({Key? key}) : super(key: key);

  @override
  _CadastroOdometroInicialState createState() =>
      _CadastroOdometroInicialState();
}

class _CadastroOdometroInicialState extends State<CadastroOdometroInicial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(30),
            child: Center(
              child: Text(
                'CONTROLE DE TRAFEGO CPI9-001/440/21',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ),
          Column(
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
            ],
          ),
          Container(
            padding: EdgeInsets.all(30),
            child: Center(
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: '260852',
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 3, color: Colors.blue),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 3, color: Colors.red),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Column(
              children: [
                MaterialButton(
                  color: Colors.red,
                  child: Text('PARTIR AGORA'),
                  onPressed: () {},
                ),
                MaterialButton(
                  color: Colors.cyan,
                  child: Text('PARTIR DEPOIS'),
                  onPressed: () {},
                ),
                MaterialButton(
                  color: Colors.black,
                  child: Text(
                    'CANCELAR VIAGEM',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
