import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:i9t/src/features/condutor/condutor.controller.dart';
import 'package:i9t/src/features/fct/fct_components/fct_aberta/fct_aberta.service.dart';
import 'package:i9t/src/features/fct/fct_components/fct_aberta/fct_aberta.states.dart';
import 'package:i9t/src/features/fct/models/fct.model.dart';

class FctAbertaController extends ValueNotifier<FctAbertaState> {
  FctAbertaController(this.fctAberta) : super(FctAbertaInitialState());

  FctModel fctAberta;
  FctAbertaService fctAbertaservice = FctAbertaService();
  final condutorController = Modular.get<CondutorController>();

  carregaFctAberta() async {
    try {
      value = FctAbertaLoadingState();
      await fctAbertaservice
          .pegaFtcsNaoConcluidasPorCondutor(condutorController.condutor)
          .then(
        (v) {
          if (v != null) {
            //fctAberta = v;
            value = FctAbertaSuccessState(fctAberta: fctAberta);
          } else {
            value = FctAbertaFailureState(error: '');
          }
        },
      );
    } catch (e) {
      value = FctAbertaFailureState(error: e.toString());
    }
  }
}
