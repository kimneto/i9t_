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

class FctsFechadasComponents extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final condutorController = context.watch<CondutorController>();
    final fctsFechadasController = context.watch<FctsFechadasController>();

    fctsFechadasController.condutor = condutorController.condutor;

    if (fctsFechadasController.value is FctsFechadasSuccess) {
      return Column(
        children: [
          ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: fctsFechadasController.value.fctsFechadas.length,
              itemBuilder: (ctx, int) {
                return CardCustom(
                  primeiraParada: fctsFechadasController
                      .value.fctsFechadas[int].pontoInicial,
                  prefixo: 'I10005'.toString(),
                  veiculo: 'Fiat Uno',
                  distanciaDeUso: fctsFechadasController
                      .value.fctsFechadas[int].kmUtilizacao
                      .toString(),
                  tempoDeUso: fctsFechadasController
                      .value.fctsFechadas[int].tempoUtilizacao
                      .toString(),
                  dataPartida: fctsFechadasController
                              .value.fctsFechadas[int].dataInicio !=
                          null
                      ? DateFormat(
                          'ddMMMyy hh:mm',
                        )
                          .format(DateTime.parse(fctsFechadasController
                              .value.fctsFechadas[int].dataInicio!.iso
                              .toString()))
                          .toUpperCase()
                      : " Nula",
                  numeroDocumento: fctsFechadasController
                      .value.fctsFechadas[int].documento
                      .toString(),
                  aoApertar: () => Modular.to.push(
                    MaterialPageRoute(
                      builder: (context) => CompartilhaPage(),
                    ),
                  ),
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
