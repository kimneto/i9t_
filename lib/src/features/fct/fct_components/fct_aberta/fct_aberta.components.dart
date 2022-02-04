import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:i9t/src/component/card_custom_ftc_aberto.dart';
import 'package:i9t/src/component/loading_card_custom_ftc_aberto.dart';
import 'package:i9t/src/features/condutor/condutor.controller.dart';
import 'package:i9t/src/features/home/home.controller.dart';
import 'fct_aberta.controller.dart';
import 'fct_aberta.states.dart';

class FctAbertaComponents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final condutorController = context.watch<CondutorController>();
    final fctAbertaController = context.watch<FctAbertaController>();
    final homeController = context.watch<HomeController>();

    fctAbertaController.condutorController.condutor =
        condutorController.condutor;
    var state = fctAbertaController.value;
    if (state is FctAbertaSuccessState) {
      homeController.value = false;
      return CardCustomFctAberto(
        aoApertar: () {
          Modular.to.navigate("/chegada");
        },
        entradaSaida: 1,
      );
    }

    if (state is FctAbertaInitialState) {
      Future.delayed(Duration.zero, () async {
        fctAbertaController.carregaFctAberta();
      });
    }

    if (state is FctAbertaFailureState) {
      Future.delayed(Duration.zero, () async {
        return Container();
      });
    }

    if (state is FctAbertaLoadingState) {
      Future.delayed(Duration.zero, () async {
        LoadingCardCustomFtcAberta();
      });
    }

    return Container();
  }
}
