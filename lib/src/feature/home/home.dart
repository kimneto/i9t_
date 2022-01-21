import 'package:flutter/material.dart';

import 'package:i9trafego/src/app/app.controller.dart';
import 'package:i9trafego/src/component/card_custom.dart';
import 'package:i9trafego/src/component/card_custom_ftc_aberto.dart';
import 'package:i9trafego/src/feature/home/home.controller.dart';
import 'package:i9trafego/src/model/condutor.model.dart';
import 'package:i9trafego/src/model/fct.model.dart';
import 'package:i9trafego/src/services/user.service.dart';

import 'package:provider/src/provider.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool botoaAdicionarAtivo = true;
  @override
  Widget build(BuildContext context) {
    final appController = Provider.of<AppController>(context);
    final homeController = Provider.of<HomeController>(context);
    homeController.condutor =
        ModalRoute.of(context)?.settings.arguments as CondutorModel;

    return ValueListenableBuilder(
        valueListenable: homeController,
        builder: (context, value, child) {
          print(value);
          return Scaffold(
            floatingActionButton: Container(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.car_rental,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'NOVA\nVIAGEM',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
              width: 130,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.green[400],
                borderRadius: BorderRadius.all(Radius.elliptical(18, 20)),
              ),
            ),
            appBar: AppBar(
              toolbarHeight: 80,
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: 30,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              elevation: 0,
              foregroundColor: Colors.transparent,
              backgroundColor: Color.fromARGB(0, 255, 255, 255),
              title: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Olá Joaquim',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                  ),
                  Text('Seja bem-vindo novamente.',
                      style: TextStyle(color: Colors.black, fontSize: 13))
                ],
              ),
            ),
            body: ListView(
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Você tem FCT em aberto:',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: CardCustomFctAberto(),
                      ),
                      Container(
                        alignment: AlignmentDirectional.centerStart,
                        padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                        child: Text(
                          'Trafegos finalizados:',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      ListView(
                        shrinkWrap: true,
                        children: [
                          CardCustom(),
                          CardCustom(),
                          CardCustom(),
                          CardCustom(),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}


  /*

  return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('HOME'),
        actions: [],
        leading: IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              homeController.condutorService.pegaCondutores().then((e) {
                e.forEach((element) {
                  print(element.nome);
                });
              });

//              Navigator.popAndPushNamed(context, '/login', arguments: true);
            }),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: FutureBuilder<List<FctModel>>(
                      future: homeController.fctService
                          .pegaFtcsNaoConcluidasPorCondutor(
                              homeController.condutor as CondutorModel),
                      builder: (ctx, snp) {
                        if (snp.hasData) {
                          botoaAdicionarAtivo = false;
                          for (var item in snp.data ?? []) {
                            return CardCustomFctAberto();
                          }
                        } else {
                          return Center(child: CircularProgressIndicator());
                        }
                        return Container();
                      })
                  //
                  ),
              Container(
                //################### LISTA DE FCTS CONCLUIDAS #####################
                child: FutureBuilder(
                  future:
                      homeController.fctService.pegaFtcsConcluidasPorCondutor(
                    homeController.condutor as CondutorModel,
                  ),
                  initialData: [],
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    return ListView(
                      children: [
                        if (snapshot.hasData)
                          for (var item in snapshot.data)
                            CardCustom(
                              titulo: item.documento
                              //subtitulo: item.data
                              ,
                              textoBotao: 'GERAR FCT',
                            ),
                        if (snapshot.hasError)
                          Text(
                            'Erro ao carregar os dados',
                            style: TextStyle(color: Colors.red),
                          ),
                        if (!snapshot.hasData)
                          Center(
                            child: CircularProgressIndicator(),
                          ),
                      ],
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                    );
                  },
                ),

                //##################################################################
              ),
            ],
          ),
        ],
      ),

      //botoaAdicionarAtivo
      floatingActionButton: botoaAdicionarAtivo
          ? FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, '/fct');
              },
              tooltip: 'Adicionar Viagem',
              child: const Icon(Icons.add),
            )
          : null,
    );
  }
}
  */
