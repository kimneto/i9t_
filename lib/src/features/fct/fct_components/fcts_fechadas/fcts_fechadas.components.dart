import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/src/presenter/widgets/modular_app.dart';
import 'package:i9t/src/component/card_custom.dart';
import 'package:i9t/src/component/loading_card_custom_fct_fechado.dart';
import 'package:i9t/src/features/compartilha/pages/compartilha.page.dart';
import 'package:i9t/src/features/condutor/condutor.controller.dart';
import 'package:i9t/src/shared/tema.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'fcts_fechadas.controller.dart';
import 'fcts_fechadas.states.dart';
import 'package:intl/intl.dart';

class FctsFechadasComponents extends StatefulWidget {
  FctsFechadasComponents({
    this.dataPartida,
    this.primeiraParada,
    this.veiculo,
    this.prefixo,
    this.tempoDeUso,
    this.distanciaDeUso,
    this.numeroDocumento,
  });

  String? dataPartida;
  String? primeiraParada;
  String? veiculo;
  String? prefixo;
  String? tempoDeUso;
  String? distanciaDeUso;
  String? numeroDocumento;

  @override
  State<FctsFechadasComponents> createState() => _FctsFechadasComponentsState();
}

class _FctsFechadasComponentsState extends State<FctsFechadasComponents> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final condutorController = context.read<CondutorController>();
    final fctsFechadasController = context.read<FctsFechadasController>();
    fctsFechadasController.condutor = condutorController.condutor;
  }

  @override
  Widget build(BuildContext context) {
    final condutorController = context.watch<CondutorController>();
    final fctsFechadasController = context.watch<FctsFechadasController>();

    if (fctsFechadasController.value is FctsFechadasSuccess) {
      return Column(
        children: [
          ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: fctsFechadasController.value.fctsFechadas.length,
              itemBuilder: (ctx, int) {
                return CardCustom(
                  primeiraParada:
                      "1º Parada: ${fctsFechadasController.value.fctsFechadas[int].trafegoModel![1].pontoParada}",
                  prefixo:
                      "${fctsFechadasController.value.fctsFechadas[int].veiculoModel?.grupo}",
                  veiculo:
                      "Veiculo ${fctsFechadasController.value.fctsFechadas[int].veiculoModel?.tipo}"
                          .toString(),
                  distanciaDeUso: fctsFechadasController.value.fctsFechadas[int]
                      .geraKmUtilizacao()
                      .then((value) => value)
                      .toString(),
                  tempoDeUso: fctsFechadasController.value.fctsFechadas[int]
                      .geraTempoDeUtilizacao("dataInicial", " dataFinal")
                      .then((value) => value)
                      .toString(),
                  dataPartida: fctsFechadasController
                      .value.fctsFechadas[int].trafegoModel![0].horaPartida
                      .toString(),
                  numeroDocumento: fctsFechadasController
                      .value.fctsFechadas[int].documento
                      .toString(),
                  aoApertar: () => Modular.to.pushNamed('/compartilha',
                      arguments:
                          fctsFechadasController.value.fctsFechadas[int]),
                  /* level: (fctsFechadasController
                                    .value.fctsFechadas[int].kmUtilizacao !=
                                null ||
                            fctsFechadasController.value.fctsFechadas[int].kmUtilizacao! > 20)
                        ? Icon(MdiIcons.trophy, color: Colors.amber)
                        : Icon(MdiIcons.medal, color: Colors.grey)*/
                );
              }),
          SizedBox(
            height: 30,
          )
        ],
      );
    }

    if (fctsFechadasController.value is FctsFechadasEmpty) {
      return Container(
        height: 300,
        child: Center(
          child: Icon(
            MdiIcons.fileHidden,
            color: cinzalitei9t,
            size: 50,
          ),
        ),
      );
    }

    if (fctsFechadasController.value is FctsFechadasInitial) {
      fctsFechadasController.carregarFctsFechadas();
    }

    if (fctsFechadasController.value is FctsFechadasFailure) {
      return Container(
        margin: EdgeInsets.fromLTRB(20, 8, 20, 8),
        height: 100,
        decoration: BoxDecoration(
            color: cinzaultralitei9t,
            border: Border.all(
              style: BorderStyle.none,
              width: 1,
            ),
            borderRadius: BorderRadius.all(Radius.elliptical(16, 20))),
        child: Center(
          child: Column(
            children: [
              Icon(
                MdiIcons.bug,
                color: amareloi9t,
                size: 40,
              ),
              Text(
                ' Não conseguimos carregar os seus tráfegos.\nTente novamente mais tarde.',
                textAlign: TextAlign.center,
                style: TextStyle(color: amareloi9t, fontSize: 12),
              ),
              Text(
                '${fctsFechadasController.value.error}',
                style: TextStyle(color: cinzalitei9t, fontSize: 9),
              ),
            ],
          ),
        ),
      );
    }

    if (fctsFechadasController.value is FctsFechadasLoading) {
      Column(
        children: [
          LoadingCardCustomFctFechado(),
          LoadingCardCustomFctFechado(),
        ],
      );
    }
    return Container();
  }
}
