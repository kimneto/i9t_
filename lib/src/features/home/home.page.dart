import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:i9t/src/features/condutor/condutor.controller.dart';
import 'package:i9t/src/features/home/home.controller.dart';
import 'package:i9t/src/features/home/home.state.dart';
import 'package:i9t/src/features/login/login.controller.dart';
import 'package:i9t/src/shared/functions.dart';
import 'package:i9t/src/shared/tema.dart';
import '../../component/botao_nova_fct.component.dart';
import '../../component/card_custom.dart';
import '../../component/card_custom_ftc_aberto.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginController = context.read<LoginController>();
    final condutorController = context.read<CondutorController>();
    final homeController = context.watch<HomeController>();
    homeController.condutorController = condutorController;

    homeController.carregaFctsFechadas();
    homeController.carregaFctAberta();

    Widget? widget;
    var state = homeController.value;

    if (state is HomeInitialState) {
      widget = Scaffold(
        floatingActionButton: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: ValueListenableBuilder(
              valueListenable: homeController.giraCartao,
              builder: (context, value, child) => BotaoNovaFct(
                aoApertar: () {
                  SchedulerBinding.instance?.addPostFrameCallback((_) {
                    Modular.to.navigate('/seleciona-veiculo');
                  });
                },
                estaAtivo:
                    (homeController.giraCartao.value == 2) ? true : false,
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
            ValueListenableBuilder(
                valueListenable: homeController.fctAberta,
                builder: <FctModel>(ctx, fctAberta, widget) {
                  if (fctAberta.id == null) {
                    return Container();
                  } else {
                    return CardCustomFctAberto(
                      botaoImparDestino: () => Modular.to.navigate('/chegada'),
                      botaoParDestino: () => Modular.to.navigate('/partida'),
                      documento: fctAberta.documento,
                      pontoInicial: !fctAberta.trafegoModel.isEmpty
                          ? fctAberta.trafegoModel[0].pontoParada
                          : "Carregando",
                      veiculoPlaca: fctAberta.veiculoModel?.placa,
                      veiculoGrupo: fctAberta.veiculoModel?.grupo,
                      veiculoTipo: fctAberta.veiculoModel?.tipo,
                      veiculoPatrimonio: fctAberta.veiculoModel?.patrimonio,
                      dataInicial: "",
                      aoApertar: () {
                        Modular.to.navigate("/chegada");
                      },
                      entradaSaida: homeController.giraCartao.value,
                    );
                  }
                }),
            FutureBuilder(
              future: homeController.carregaFctsFechadas(),
              builder: <FctModel>(ctx, snp) => ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: homeController.fcts.length,
                itemBuilder: (ctx, int) {
                  return CardCustom(
                    primeiraParada: homeController
                                .fcts[int].trafegoModel!.length >=
                            1
                        ? "1º Parada: ${homeController.fcts[int].trafegoModel![1].pontoParada}"
                        : homeController.fcts[int].trafegoModel!.isNotEmpty
                            ? "Estacionado em: ${homeController.fcts[int].trafegoModel![0].pontoParada}"
                            : "",
                    prefixo: "${homeController.fcts[int].veiculoModel?.grupo}",
                    veiculo:
                        "Veiculo ${homeController.fcts[int].veiculoModel?.tipo}"
                            .toString(),
                    distanciaDeUso: homeController.fcts[int]
                        .geraKmUtilizacao()
                        .then((value) => value)
                        .toString(),
                    tempoDeUso: homeController.fcts[int]
                        .geraTempoDeUtilizacao("dataInicial", " dataFinal")
                        .then((value) => value)
                        .toString(),
                    dataPartida: homeController
                            .fcts[int].trafegoModel!.isNotEmpty
                        ? homeController.fcts[int].trafegoModel![0].horaPartida
                            .toString()
                        : "",
                    numeroDocumento:
                        homeController.fcts[int].documento.toString(),
                    aoApertar: () => Modular.to.pushNamed('/compartilha',
                        arguments: homeController.fcts[int]),
                    /* level: (homeController
                                      .fctsFechadas[int].kmUtilizacao !=
                                  null ||
                              homeController.fcts[int].kmUtilizacao! > 20)
                          ? Icon(MdiIcons.trophy, color: Colors.amber)
                          : Icon(MdiIcons.medal, color: Colors.grey)*/
                  );
                },
              ),
            )
          ],
        ),
      );
    }
    return widget ?? Container();
  }
}
