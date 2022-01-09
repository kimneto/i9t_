import 'package:flutter/material.dart';

import 'package:i9trafego/src/app/app.controller.dart';

import 'package:provider/src/provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appController = context.watch<AppController>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Meus Trafegos'),
        actions: [
          Row(
            children: [
              Text('Escuro'),
              Switch(
                  value: appController.isThemeDark,
                  onChanged: (value) => {appController.setThemeDark(value)}),
            ],
          )
        ],
        leading: IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              Navigator.popAndPushNamed(context, '/login', arguments: true);
            }),
      ),
      body: ListView(
        children: listaCard(context),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Adicionar Viagem',
        child: const Icon(Icons.add),
      ),
    );
  }
}

List<Widget> listaCard(BuildContext context) {
  List<Widget> lista = [
    Card(
      margin: EdgeInsets.fromLTRB(17, 5, 17, 5),
      elevation: 5.0,
      child: GestureDetector(
        onTap: () {},
        child: ListTile(
          leading: Icon(Icons.directions_car),
          title: Text('Viagem 1'),
          subtitle: Text('A sufficiently long subtitle warrants three lines.'),
          isThreeLine: true,
        ),
      ),
    ),
    Card(
      margin: EdgeInsets.fromLTRB(17, 0, 17, 10),
      elevation: 5.0,
      child: ListTile(
        leading: Icon(Icons.directions_car),
        title: Text('Three-line ListTile'),
        subtitle: Text('A sufficiently long subtitle warrants three lines.'),
        isThreeLine: true,
      ),
    ),
    Card(
      margin: EdgeInsets.fromLTRB(17, 0, 17, 10),
      elevation: 5.0,
      child: ListTile(
        leading: Icon(Icons.directions_car),
        title: Text('Three-line ListTile'),
        subtitle: Text('A sufficiently long subtitle warrants three lines.'),
        isThreeLine: true,
      ),
    ),
    Card(
      margin: EdgeInsets.fromLTRB(17, 0, 17, 10),
      elevation: 5.0,
      child: ListTile(
        leading: Icon(Icons.directions_car),
        title: Text('Three-line ListTile'),
        subtitle: Text('A sufficiently long subtitle warrants three lines.'),
        isThreeLine: true,
      ),
    ),
    Card(
      margin: EdgeInsets.fromLTRB(17, 0, 17, 10),
      elevation: 5.0,
      child: ListTile(
        leading: Icon(Icons.directions_car),
        title: Text('Three-line ListTile'),
        subtitle: Text('A sufficiently long subtitle warrants three lines.'),
        isThreeLine: true,
      ),
    ),
    Card(
      margin: EdgeInsets.fromLTRB(17, 0, 17, 10),
      elevation: 5.0,
      child: ListTile(
        leading: Icon(Icons.directions_car),
        title: Text('Three-line ListTile'),
        subtitle: Text('A sufficiently long subtitle warrants three lines.'),
        isThreeLine: true,
      ),
    ),
    Card(
      margin: EdgeInsets.fromLTRB(17, 0, 17, 10),
      elevation: 5.0,
      child: ListTile(
        leading: Icon(Icons.directions_car),
        title: Text('Three-line ListTile'),
        subtitle: Text('A sufficiently long subtitle warrants three lines.'),
        isThreeLine: true,
      ),
    ),
    Card(
      margin: EdgeInsets.fromLTRB(17, 0, 17, 10),
      elevation: 5.0,
      child: ListTile(
        leading: Icon(Icons.directions_car),
        title: Text('Three-line ListTile'),
        subtitle: Text('A sufficiently long subtitle warrants three lines.'),
        isThreeLine: true,
      ),
    ),
    Card(
      margin: EdgeInsets.fromLTRB(17, 0, 17, 10),
      elevation: 5.0,
      child: ListTile(
        leading: Icon(Icons.directions_car),
        title: Text('Three-line ListTile'),
        subtitle: Text('A sufficiently long subtitle warrants three lines.'),
        isThreeLine: true,
      ),
    ),
    Card(
      margin: EdgeInsets.fromLTRB(17, 0, 17, 10),
      elevation: 5.0,
      child: ListTile(
        leading: Icon(Icons.directions_car),
        title: Text('Three-line ListTile'),
        subtitle: Text('A sufficiently long subtitle warrants three lines.'),
        isThreeLine: true,
      ),
    ),
    Card(
      margin: EdgeInsets.fromLTRB(17, 0, 17, 10),
      elevation: 5.0,
      child: ListTile(
        leading: Icon(Icons.directions_car),
        title: Text('Three-line ListTile'),
        subtitle: Text('A sufficiently long subtitle warrants three lines.'),
        isThreeLine: true,
      ),
    ),
  ];
  return lista;
}
