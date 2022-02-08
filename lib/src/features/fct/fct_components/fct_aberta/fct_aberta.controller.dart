import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:i9t/src/features/condutor/condutor.controller.dart';
import 'package:i9t/src/features/fct/fct_components/fct_aberta/fct_aberta.states.dart';
import 'package:i9t/src/features/fct/models/fct.model.dart';

import '../../../../services/fct.service.dart';

class FctAbertaController extends ValueNotifier<FctAbertaState> {
  FctAbertaController(this.fctAberta) : super(FctAbertaInitialState());
  FctModel fctAberta;
  FctService fctService = FctService();
  final condutorController = Modular.get<CondutorController>();

  carregaFctAberta() async {
    try {
      value = FctAbertaLoadingState();
      await fctService
          .pegaFtcsPorCondutor(condutorController.condutor, false)
          .then(
        (res) {
          if (res.sucesso != false) {
            fctAberta = FctModel.fromJson(res.data[0]);
            value = FctAbertaSuccessState(fctAberta: fctAberta);
          } else {
            value = FctAbertaFailureState(error: "Erro ao carregar FCT");
          }
        },
      );
    } catch (e) {
      value = FctAbertaFailureState(error: e.toString());
    }
  }
}
