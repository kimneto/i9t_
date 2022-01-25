import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:i9t/src/component/card_custom.dart';
import 'package:i9t/src/features/compartilha/pages/compartilha.page.dart';
import 'package:i9t/src/features/condutor/controllers/condutor.controller.dart';
import 'package:i9t/src/features/condutor/models/condutor.model.dart';
import 'package:i9t/src/shared/tema.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/src/provider.dart';
import 'controllers/fcts_fechadas.controller.dart';
import 'state/fcts_fechadas.states.dart';

class FctsFechadasComponents extends StatelessWidget {
  FctsFechadasComponents(
      {required this.condutorModel,
      this.dataPartida,
      this.primeiraParada,
      this.veiculo,
      this.prefixo,
      this.tempoDeUso,
      this.distanciaDeUso,
      this.numeroDocumento});
  final CondutorModel condutorModel;
  String? dataPartida;
  String? primeiraParada;
  String? veiculo;
  String? prefixo;
  String? tempoDeUso;
  String? distanciaDeUso;
  String? numeroDocumento;

  @override
  Widget build(BuildContext context) {
    final fctsFechadasController = context.watch<FctsFechadasController>();
    final condutorController = context.watch<CondutorController>();
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
                    primeiraParada: 'São Paulo',
                    prefixo: 'I10005'.toString(),
                    veiculo: 'Fiat Uno',
                    distanciaDeUso: fctsFechadasController
                        .value.fctsFechadas[int].kmUtilizacao
                        .toString(),
                    tempoDeUso: fctsFechadasController
                        .value.fctsFechadas[int].tempoUtilizacao
                        .toString(),
                    dataPartida: fctsFechadasController
                        .value.fctsFechadas[int].dataInicio,
                    numeroDocumento: fctsFechadasController
                        .value.fctsFechadas[int].documento,
                    aoApertar: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => CompartilhaPage(),
                          ),
                        ),
                    level: (fctsFechadasController
                                .value.fctsFechadas[int].kmUtilizacao! >
                            20)
                        ? Icon(MdiIcons.trophy, color: Colors.amber)
                        : Icon(MdiIcons.medal, color: Colors.grey));
              }),
          SizedBox(
            height: 30,
          )
        ],
      );
    }

    if (fctsFechadasController.value is FctsFechadasInitial) {
      fctsFechadasController.carregarFctsFechadas();
    }

    if (fctsFechadasController.value is FctsFechadasFailure) {
      return Container(
        child: Text(
          '${fctsFechadasController.value.error}',
          style: TextStyle(color: amareloi9t),
        ),
      );
    }

    if (fctsFechadasController.value is FctsFechadasLoading) {
      return Center(
        child: CircularProgressIndicator(
          color: amareloi9t,
          strokeWidth: 10,
        ),
      );
    }
    return Container();
  }
}
