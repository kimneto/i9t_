import 'package:flutter/material.dart';
import 'package:i9t/src/component/botao_adicionar_viagem.component.dart';
import 'package:i9t/src/features/condutor/controllers/condutor.controller.dart';
import 'package:i9t/src/features/fct/components/fct_aberta/fct_aberta.components.dart';
import 'package:i9t/src/features/fct/components/fcts_fechadas/fcts_fechadas.components.dart';

import 'package:i9t/src/shared/functions.dart';
import 'package:i9t/src/shared/tema.dart';

import 'package:provider/src/provider.dart';
import '../../../component/card_custom.dart';
import '../../../component/card_custom_ftc_aberto.dart';
import '../../fct/models/fct.model.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool botoaAdicionarAtivo = false;

  @override
  Widget build(BuildContext context) {
    CondutorController condutorController = context.watch<CondutorController>();

    return Scaffold(
      floatingActionButton:
          botoaAdicionarAtivo ? BotaoAdicionarViagem() : Container(),
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
                      Navigator.of(context).popAndPushNamed('/logout');
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
          FctAbertaComponents(),
          FctsFechadasComponents(),
        ],
      ),
    );
  }
}
