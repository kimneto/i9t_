import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:i9t/src/component/botao_nova_fct.component.dart';
import 'package:i9t/src/features/condutor/condutor.controller.dart';
import 'package:i9t/src/features/home/home.controller.dart';
import 'package:i9t/src/features/login/login.controller.dart';
import 'package:i9t/src/shared/functions.dart';
import 'package:i9t/src/shared/tema.dart';
import '../../component/card_custom.dart';
import '../../component/card_custom_ftc_aberto.dart';

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
              estaAtivo: (homeController == 1) ? true : false,
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
          CardCustomFctAberto(
            botaoImparDestino: () => Modular.to.navigate('/chegada'),
            botaoParDestino: () => Modular.to.navigate('/saida'),
            documento: homeController.fctAberta.documento,
            pontoInicial:
                homeController.fctAberta.trafegoModel![1].pontoParada ??
                    homeController.fctAberta.trafegoModel![0].pontoParada,
            veiculoPlaca: homeController.fctAberta.veiculoModel?.placa,
            veiculoGrupo: homeController.fctAberta.veiculoModel?.grupo,
            veiculoTipo: homeController.fctAberta.veiculoModel?.tipo,
            veiculoPatrimonio:
                homeController.fctAberta.veiculoModel?.patrimonio,
            dataInicial: homeController.fctAberta.trafegoModel?[0].horaPartida!
                .substring(0, 10),
            aoApertar: () {
              Modular.to.navigate("/chegada");
            },
            entradaSaida: homeController.giraCartao,
          ),
          ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: homeController.fctsFechadas.length,
              itemBuilder: (ctx, int) {
                return CardCustom(
                  primeiraParada:
                      "1º Parada: ${homeController.fctsFechadas[int].trafegoModel![1].pontoParada}",
                  prefixo:
                      "${homeController.fctsFechadas[int].veiculoModel?.grupo}",
                  veiculo:
                      "Veiculo ${homeController.fctsFechadas[int].veiculoModel?.tipo}"
                          .toString(),
                  distanciaDeUso: homeController.fctsFechadas[int]
                      .geraKmUtilizacao()
                      .then((value) => value)
                      .toString(),
                  tempoDeUso: homeController.fctsFechadas[int]
                      .geraTempoDeUtilizacao("dataInicial", " dataFinal")
                      .then((value) => value)
                      .toString(),
                  dataPartida: homeController
                      .fctsFechadas[int].trafegoModel![0].horaPartida
                      .toString(),
                  numeroDocumento:
                      homeController.fctsFechadas[int].documento.toString(),
                  aoApertar: () => Modular.to.pushNamed('/compartilha',
                      arguments: homeController.fctsFechadas[int]),
                  /* level: (homeController
                                    .fctsFechadas[int].kmUtilizacao !=
                                null ||
                            homeController.fctsFechadas[int].kmUtilizacao! > 20)
                        ? Icon(MdiIcons.trophy, color: Colors.amber)
                        : Icon(MdiIcons.medal, color: Colors.grey)*/
                );
              }),
        ],
      ),
    );
  }
}
