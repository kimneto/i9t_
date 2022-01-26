import 'package:flutter/material.dart';
import 'package:i9t/src/component/card_custom_ftc_aberto.dart';
import 'package:i9t/src/component/loading_card_custom_ftc_aberto.dart';
import 'package:i9t/src/features/condutor/controllers/condutor.controller.dart';
import 'package:i9t/src/features/condutor/models/condutor.model.dart';
import 'package:i9t/src/features/home/controllers/home.controller.dart';
import 'package:i9t/src/shared/tema.dart';
import 'package:provider/src/provider.dart';
import 'controllers/fct_aberta.controller.dart';
import 'state/fct_aberta.states.dart';

class FctAbertaComponents extends StatelessWidget {
  FctAbertaComponents({required this.condutorModel});
  final CondutorModel condutorModel;

  @override
  Widget build(BuildContext context) {
    final fctAbertaController = context.watch<FctAbertaController>();
    final homeController = context.watch<HomeController>();
    final condutorController = context.read<CondutorController>();
    fctAbertaController.condutor = condutorController.condutor;

    if (fctAbertaController.value is FctAbertaSuccess) {
      homeController.value = false;
      return CardCustomFctAberto(
        aoApertar: () {
          Navigator.pushNamed(context, '/parada');
        },
        entradaSaida: 1,
      );
    }

    if (fctAbertaController.value is FctAbertaInitial) {
      homeController.value = false;
      fctAbertaController.carregaFctAberta();
    }

    if (fctAbertaController.value is FctAbertaFailure) {
      homeController.value = true;
      return Container();
    }

    if (fctAbertaController.value is FctAbertaLoading) {
      homeController.value = false;
      return LoadingCardCustomFtcAberta();
    }

    return Container();
  }
}
