import 'package:flutter/cupertino.dart';
import 'package:i9t/src/features/condutor/models/condutor.model.dart';
import 'package:i9t/src/features/fct/components/fcts_fechadas/state/fcts_fechadas.states.dart';
import 'package:i9t/src/features/fct/components/fcts_fechadas/services/fcts_fechada.service.dart';
import 'package:i9t/src/features/fct/models/fct.model.dart';

class FctsFechadasController extends ValueNotifier<FctsFechadasState> {
  final FctsFechadasService service;
  late CondutorModel condutor;

  FctsFechadasController(this.service) : super(FctsFechadasInitial());

  carregarFctsFechadas() async {
    value = FctsFechadasLoading();
    try {
      await service.pegaFtcsConcluidasPorCondutor(condutor).then(
        (v) {
          if (v.length > -1) {
            value = FctsFechadasSuccess(fctsFechadas: v);
          }
        },
      );
    } catch (e) {
      value = FctsFechadasFailure(error: e.toString());
    }
  }
}
