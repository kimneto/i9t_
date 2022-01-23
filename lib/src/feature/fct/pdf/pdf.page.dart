import 'package:flutter/material.dart';
import 'package:i9t/src/component/botao_grande.component.dart';
import 'package:i9t/src/feature/fct/pdf/pdf.controller.dart';
import 'package:i9t/src/shared/tema.dart';
import 'package:provider/src/provider.dart';

class PdfPage extends StatefulWidget {
  PdfPage({Key? key}) : super(key: key);

  @override
  _PdfPageState createState() => _PdfPageState();
}

class _PdfPageState extends State<PdfPage> {
  @override
  Widget build(BuildContext context) {
    final controller = context.watch<PdfController>();
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: Column(
          children: [
            Text('Ficha de Controle de Trafego'),
            Text('CPI-9'),
            Text('CPI9-001/420/22'),
          ],
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('CONDUTOR'),
                          Text('JOAQUIM MOREIRA DA SILVA NETO'),
                          Text('CPF: 022.988.988-00'),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        children: [Text('PARTIDA'), Text('01/05/20 17:30')],
                      ),
                      Column(
                        children: [Text('RETORNO'), Text('01/05/20 17:30')],
                      )
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
                      Container(
                        child: Text('PLACA'),
                        width: 100,
                      ),
                      Container(
                        child: Text('PATRIMÔNIO'),
                        width: 100,
                      ),
                      Container(
                        child: Text('TIPO'),
                        width: 100,
                      ),
                      Container(
                        child: Text('GRUPO'),
                        width: 100,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        child: Text('xczxc5czx'),
                        width: 100,
                      ),
                      Container(
                        child: Text('sdasdsadasas'),
                        width: 100,
                      ),
                      Container(
                        child: Text('TsadsaIPO'),
                        width: 100,
                      ),
                      Container(
                        child: Text('GRUPO'),
                        width: 100,
                      )
                    ],
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text('ODOMETRO'),
                    Text('PARTIDA: 255000'),
                    Text('RETORNO: 256000'),
                    Text('DIFERENÇA: 1000'),
                  ],
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              width: double.infinity,
              child: Text('O CONDUTOR PREENCHERÁ'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text('DESTINO'),
                    Text('SÃO PAULO'),
                    Text('SÃO PAULO'),
                    Text('SÃO PAULO')
                  ],
                ),
                Column(
                  children: [
                    Text('HORARIOS'),
                    Column(
                      children: [
                        Row(children: [Text('CHEGADA'), Text('SAIDA')]),
                        Row(children: [Text('17:30'), Text('15:00')]),
                        Row(children: [Text('17:30'), Text('15:00')]),
                        Row(children: [Text('17:30'), Text('15:00')]),
                      ],
                    )
                  ],
                ),
                Column(
                  children: [
                    Text('HODOMETRO'),
                    Text('65050'),
                    Text('65050'),
                    Text('65050')
                  ],
                )
              ],
            ),
            Column(
              children: [
                Text('OBSERVAÇÕES'),
                Text('65050'),
                Text('65050'),
                Text('65050')
              ],
            ),
            Container(
                padding: EdgeInsets.all(10),
                child: BotaoGrandeI9t(
                    texto: 'GERAR ARQUIVO PDF',
                    aoApertar: () {},
                    estaAtivo: true))
          ],
        ),
      ),
    );
  }
}
