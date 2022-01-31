import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:i9t/src/features/condutor/controllers/condutor.controller.dart';
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
          if (v.objectId != null) {
            fctAberta = v;
            value = FctAbertaSuccessState(fctAberta: v);
          } else {
            value = FctAbertaFailureState(error: '${v.condutorModel}');
          }
        },
      );
    } catch (e) {
      value = FctAbertaFailureState(error: e.toString());
    }
  }
}
