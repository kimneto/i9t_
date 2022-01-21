import 'package:flutter/material.dart';

class FormFctPontoParada extends StatefulWidget {
  const FormFctPontoParada({Key? key}) : super(key: key);

  @override
  _FormFctPontoParadaState createState() => _FormFctPontoParadaState();
}

class _FormFctPontoParadaState extends State<FormFctPontoParada> {
  TimeOfDay initialTime = TimeOfDay.now();

  pickedTime(BuildContext context) async {
    await showTimePicker(
      context: context,
      initialTime: initialTime,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário de FCT'),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back)),
      ),
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
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 150,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'SÃO PAULO',
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(width: 3, color: Colors.blue),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(width: 3, color: Colors.red),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 100,
                      child: TextFormField(
                        onTap: () => pickedTime(context),
                        keyboardType: TextInputType.datetime,
                        decoration: InputDecoration(
                          contentPadding: new EdgeInsets.symmetric(
                              vertical: 25.0, horizontal: 10.0),
                          labelText: '14:30',
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(width: 3, color: Colors.blue),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(width: 3, color: Colors.red),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Center(
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        contentPadding: new EdgeInsets.symmetric(
                            vertical: 25.0, horizontal: 10.0),
                        labelText: '260852',
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 3, color: Colors.blue),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 3, color: Colors.red),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Column(
              children: [
                MaterialButton(
                  color: Colors.red,
                  child: Text('CONFIRMAR'),
                  onPressed: () {},
                ),
                MaterialButton(
                  color: Colors.cyan,
                  child: Text('INSERIR DEPOIS'),
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
