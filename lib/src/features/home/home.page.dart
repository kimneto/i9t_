import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:i9t/src/component/botao_nova_fct.component.dart';
import 'package:i9t/src/features/condutor/condutor.controller.dart';
import 'package:i9t/src/features/fct/fct_components/fct_aberta/fct_aberta.components.dart';
import 'package:i9t/src/features/fct/fct_components/fcts_fechadas/fcts_fechadas.components.dart';
import 'package:i9t/src/features/home/home.controller.dart';
import 'package:i9t/src/features/login/login.controller.dart';
import 'package:i9t/src/shared/functions.dart';
import 'package:i9t/src/shared/tema.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final loginController = context.read<LoginController>();
    final condutorController = context.watch<CondutorController>();
    final homeController = context.watch<HomeController>();
    return Scaffold(
      floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: ValueListenableBuilder(
            valueListenable: homeController,
            builder: (context, value, child) => BotaoNovaFct(
              aoApertar: () {
                SchedulerBinding.instance?.addPostFrameCallback((_) {
                  Modular.to.navigate('/seleciona-veiculo');
                });
              },
              estaAtivo: (homeController.value == 1) ? true : false,
            ),
          )),
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
                      loginController.estaLogado = false;

                      SchedulerBinding.instance?.addPostFrameCallback((_) {
                        Modular.to.navigate(
                          '/login',
                        );
                      });
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
