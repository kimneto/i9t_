import 'package:flutter/material.dart';
import 'package:i9t/src/component/botao_nova_fct.component.dart';
import 'package:i9t/src/features/condutor/controllers/condutor.controller.dart';
import 'package:i9t/src/features/fct/components/fct_aberta/fct_aberta.components.dart';
import 'package:i9t/src/features/fct/components/fcts_fechadas/fcts_fechadas.components.dart';
import 'package:i9t/src/features/home/controllers/home.controller.dart';

import 'package:i9t/src/shared/functions.dart';
import 'package:i9t/src/shared/tema.dart';

import 'package:provider/src/provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CondutorController condutorController = context.watch<CondutorController>();
    HomeController homeController = context.watch<HomeController>();

    return Scaffold(
      floatingActionButton: BotaoNovaFct(
        aoApertar: () {
          Navigator.of(context).pushNamed('/seleciona-veiculo');
        },
        estaAtivo: homeController.value,
      ),
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 20, right: 20),
            child: Column(
              children: [
                IconButton(
                    iconSize: 30,
                    icon: Icon(
                      Icons.logout,
                      size: 30,
                      color: pretoi9t,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    }),
              ],
            ),
          )
        ],
        toolbarHeight: 80,
        elevation: 0,
        foregroundColor: Colors.transparent,
        backgroundColor: Color.fromARGB(0, 255, 255, 255),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Olá ${pegaPrimeiroNomeEDeixaAPrimeiraLetraMaiuscula('${condutorController.condutor.nome}')}',
              style: TextStyle(
                  color: pretoi9t, fontSize: 28, fontWeight: FontWeight.bold),
            ),
            Text('Seja bem-vindo novamente.',
                style: TextStyle(color: pretoi9t, fontSize: 13)),
          ],
        ),
      ),
      body: ListView(
        children: [
          FctAbertaComponents(
            condutorModel: condutorController.condutor,
          ),
          FctsFechadasComponents(
            condutorModel: condutorController.condutor,
          ),
        ],
      ),
    );
  }
}
