import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:i9t/src/component/card_custom_ftc_aberto.dart';
import 'package:i9t/src/component/loading_card_custom_ftc_aberto.dart';
import 'package:i9t/src/features/condutor/controllers/condutor.controller.dart';

import 'fct_aberta.controller.dart';
import 'fct_aberta.states.dart';

class FctAbertaComponents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final condutorController = context.watch<CondutorController>();
    final fctAbertaController = context.watch<FctAbertaController>();
    fctAbertaController.condutorController.condutor =
        condutorController.condutor;

    if (fctAbertaController.value is FctAbertaSuccessState) {
      return CardCustomFctAberto(
        aoApertar: () {
          //    Modular.to.pushNamed('./parada');
        },
        entradaSaida: 1,
      );
    }

    if (fctAbertaController.value is FctAbertaInitialState) {
      fctAbertaController.carregaFctAberta();
    }

    if (fctAbertaController.value is FctAbertaFailureState) {
      return Container();
    }

    if (fctAbertaController.value is FctAbertaLoadingState) {
      return LoadingCardCustomFtcAberta();
    }

    return Container();
  }
}
