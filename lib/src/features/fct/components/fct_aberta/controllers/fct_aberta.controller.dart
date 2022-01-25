import 'package:flutter/material.dart';
import 'package:i9t/src/features/condutor/models/condutor.model.dart';
import 'package:i9t/src/features/fct/components/fct_aberta/services/fct_aberta.service.dart';
import 'package:i9t/src/features/fct/components/fct_aberta/state/fct_aberta.states.dart';
import 'package:i9t/src/features/fct/models/fct.model.dart';

class FctAbertaController extends ValueNotifier<FctAbertaState> {
  final FctAbertaService service;
  late CondutorModel condutor;
  FctAbertaController(this.service, this.condutor) : super(FctAbertaInitial());

  late FctModel fctAberta;

  carregaFctAberta() async {
    try {
      value = FctAbertaLoading();
      await service.pegaFtcsNaoConcluidasPorCondutor(condutor).then(
        (v) {
          if (v.objectId != null) {
            fctAberta = v;
            value = FctAbertaSuccess(fctAberta: v);
          } else {
            value = FctAbertaFailure(error: '${v.condutor}');
          }
        },
      );
    } catch (e) {
      value = FctAbertaFailure(error: e.toString());
    }
  }
}
