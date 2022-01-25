import 'package:flutter/material.dart';
import 'package:i9t/src/component/botao_grande.component.dart';
import 'package:i9t/src/features/compartilha/controllers/compartilha.controller.dart';

import 'package:i9t/src/shared/tema.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/src/provider.dart';

class CompartilhaPage extends StatefulWidget {
  CompartilhaPage({Key? key}) : super(key: key);

  @override
  _CompartilhaPageState createState() => _CompartilhaPageState();
}

class _CompartilhaPageState extends State<CompartilhaPage> {
  @override
  Widget build(BuildContext context) {
    final controller = context.read<CompartilhaController>();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              MdiIcons.chevronLeft,
              size: 50,
              color: pretoi9t,
            )),
        title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Ficha de Controle de Trafego',
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.w900, color: pretoi9t)),
          Text('CPI9-001/420/22',
              style: TextStyle(fontSize: 13, color: cinzai9t)),
        ]),
        toolbarHeight: 80,
        elevation: 0,
        backgroundColor: brancoi9t,
        centerTitle: false,
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.all(35),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: cinzai9t,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
                color: brancoi9t,
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('CONDUTOR',
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold)),
                                Text('JOAQUIM MOREIRA DA SILVA NETO',
                                    style: TextStyle(
                                      fontSize: 10,
                                    )),
                                Text('CPF: 022.988.988-00',
                                    style: TextStyle(
                                      fontSize: 10,
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Container(
                                  child: Text('PLACA',
                                      style: TextStyle(
                                          fontSize: 9,
                                          color: cinzai9t,
                                          fontWeight: FontWeight.bold)),
                                ),
                                Container(
                                  child: Text('ABC-1234',
                                      style: TextStyle(
                                          fontSize: 8, color: cinzai9t)),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  child: Text('PATRIMÔNIO',
                                      style: TextStyle(
                                          fontSize: 9,
                                          color: cinzai9t,
                                          fontWeight: FontWeight.bold)),
                                ),
                                Container(
                                  child: Text('ABC-1234',
                                      style: TextStyle(
                                          fontSize: 8, color: cinzai9t)),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  child: Text('TIPO',
                                      style: TextStyle(
                                          fontSize: 9,
                                          color: cinzai9t,
                                          fontWeight: FontWeight.bold)),
                                ),
                                Container(
                                  child: Text('RENAULT DUSTER',
                                      style: TextStyle(
                                          fontSize: 8, color: cinzai9t)),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  child: Text('GRUPO',
                                      style: TextStyle(
                                          fontSize: 9,
                                          color: cinzai9t,
                                          fontWeight: FontWeight.bold)),
                                ),
                                Container(
                                  child: Text('I10050',
                                      style: TextStyle(
                                          fontSize: 8, color: cinzai9t)),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text('ODOMETRO',
                              style: TextStyle(
                                  fontSize: 9,
                                  color: cinzai9t,
                                  fontWeight: FontWeight.bold)),
                          Text('PARTIDA: 255000',
                              style: TextStyle(fontSize: 8, color: cinzai9t)),
                          Text('RETORNO: 256000',
                              style: TextStyle(fontSize: 8, color: cinzai9t)),
                          Text('DIFERENÇA: 1000',
                              style: TextStyle(fontSize: 8, color: cinzai9t)),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Text('PARTIDA',
                                  style: TextStyle(
                                      fontSize: 9,
                                      color: cinzai9t,
                                      fontWeight: FontWeight.bold)),
                              Text('01/05/20 17:30',
                                  style:
                                      TextStyle(fontSize: 8, color: cinzai9t))
                            ],
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Column(
                            children: [
                              Text('RETORNO',
                                  style: TextStyle(
                                      fontSize: 9,
                                      color: cinzai9t,
                                      fontWeight: FontWeight.bold)),
                              Text('01/05/20 17:30',
                                  style:
                                      TextStyle(fontSize: 8, color: cinzai9t))
                            ],
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text('Tempo de Utilização 5h',
                              style: TextStyle(fontSize: 6, color: cinzai9t))
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Text('HORARIOS',
                        style: TextStyle(
                            fontSize: 9,
                            color: cinzai9t,
                            fontWeight: FontWeight.bold)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text('DESTINO',
                              style: TextStyle(
                                  fontSize: 9,
                                  color: cinzai9t,
                                  fontWeight: FontWeight.bold)),
                          Text('SÃO PAULO',
                              style: TextStyle(fontSize: 8, color: cinzai9t)),
                          Text('SÃO PAULO',
                              style: TextStyle(fontSize: 8, color: cinzai9t)),
                          Text('SÃO PAULO',
                              style: TextStyle(fontSize: 8, color: cinzai9t))
                        ],
                      ),
                      Column(
                        children: [
                          Column(
                            children: [
                              Row(children: [
                                Column(
                                  children: [
                                    Text('CHEGADA',
                                        style: TextStyle(
                                            fontSize: 8,
                                            color: cinzai9t,
                                            fontWeight: FontWeight.bold)),
                                    Text('10:00',
                                        style: TextStyle(
                                            fontSize: 8, color: cinzai9t)),
                                    Text('10:00',
                                        style: TextStyle(
                                            fontSize: 8, color: cinzai9t)),
                                    Text('10:00',
                                        style: TextStyle(
                                            fontSize: 8, color: cinzai9t)),
                                  ],
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  children: [
                                    Text('SAIDA',
                                        style: TextStyle(
                                            fontSize: 8,
                                            color: cinzai9t,
                                            fontWeight: FontWeight.bold)),
                                    Text('10:00',
                                        style: TextStyle(
                                            fontSize: 8, color: cinzai9t)),
                                    Text('10:00',
                                        style: TextStyle(
                                            fontSize: 8, color: cinzai9t)),
                                    Text('10:00',
                                        style: TextStyle(
                                            fontSize: 8, color: cinzai9t)),
                                  ],
                                )
                              ]),
                            ],
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Text('HODOMETRO',
                              style: TextStyle(
                                  fontSize: 9,
                                  color: cinzai9t,
                                  fontWeight: FontWeight.bold)),
                          Text('65050',
                              style: TextStyle(fontSize: 8, color: cinzai9t)),
                          Text('65050',
                              style: TextStyle(fontSize: 8, color: cinzai9t)),
                          Text('65050',
                              style: TextStyle(fontSize: 8, color: cinzai9t))
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    width: 300,
                    height: 100,
                    decoration:
                        BoxDecoration(border: Border.all(color: cinzai9t)),
                    child: Column(
                      children: [
                        Text('OBSERVAÇÕES',
                            style: TextStyle(
                                fontSize: 8,
                                color: cinzai9t,
                                fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text('Veículo lavado e abastecido, nill de avaria',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: cinzai9t,
                                )),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.only(left: 30, right: 30, top: 10),
                child: BotaoGrandeI9t(
                    texto: 'Gerar FCT em PDF',
                    aoApertar: () => controller.geraPdf(),
                    estaAtivo: true))
          ],
        ),
      ),
    );
  }
}
