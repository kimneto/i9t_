import 'package:flutter/material.dart';

import 'package:i9trafego/src/app/app.controller.dart';

import 'package:provider/src/provider.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final appController = Provider.of<AppController>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Meus Trafegos'),
        actions: [
          Row(
            children: [
              Switch(
                  value: appController.isThemeDark,
                  onChanged: (value) {
                    appController.setThemeDark(value);
                  }),
            ],
          )
        ],
        leading: IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Navigator.popAndPushNamed(context, '/login', arguments: true);
            }),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  height: 130,
                  decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 10,
                            offset: Offset(2, 4))
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Row(
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
                ),
              ),
              ListView(
                children: listaCard(context),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/fct');
        },
        tooltip: 'Adicionar Viagem',
        child: const Icon(Icons.add),
      ),
    );
  }
}

List<Widget> listaCard(BuildContext context) {
  List<Widget> lista = [
    cardCustom(),
    cardCustom(),
    cardCustom(),
    cardCustom(),
    cardCustom(),
    cardCustom(),
    cardCustom(),
  ];
  return lista;
}

Widget cardCustom() {
  return Card(
    margin: EdgeInsets.fromLTRB(17, 0, 17, 10),
    elevation: 5.0,
    child: ListTile(
      leading: Icon(Icons.directions_car),
      title: Text(
        'DESTINO INICIAL: SÃO PAULO - DATA: 01/01/2020',
        style: TextStyle(fontSize: 12),
      ),
      subtitle: Text(
        'VTR: 14-95 - VW KOMBI - UTILIZAÇÃO: 2H 45M 27S  - 135KM',
        style: TextStyle(fontSize: 10),
      ),
      isThreeLine: true,
      trailing: GestureDetector(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Column(
            children: [
              Icon(
                Icons.picture_as_pdf_sharp,
                color: Colors.red,
              ),
              Text(
                'Gerar FCT',
                style: TextStyle(fontSize: 10),
              )
            ],
          ),
        ),
      ),
    ),
  );
}
