import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';
import 'package:i9t/src/features/condutor/models/condutor.model.dart';
import 'package:i9t/src/features/fct/fct_components/fcts_fechadas/fcts_fechada.service.dart';
import 'package:i9t/src/features/fct/fct_components/fcts_fechadas/fcts_fechadas.states.dart';

class FctsFechadasController extends ValueNotifier<FctsFechadasState> {
  FctsFechadasService service = FctsFechadasService();
  late CondutorModel condutor;

  FctsFechadasController() : super(FctsFechadasInitial());

  carregarFctsFechadas() async {
    SchedulerBinding.instance?.addPostFrameCallback((_) {
      value = FctsFechadasLoading();
    });

    try {
      await service.pegaFtcsConcluidasPorCondutor(condutor).then(
        (v) {
          if (v.length > -1) {
            value = FctsFechadasSuccess(fctsFechadas: v);
          }

          if (v.length == 0) {
            value = FctsFechadasEmpty();
          }
        },
      );
    } catch (e) {
      value = FctsFechadasFailure(error: e.toString());
    }
  }
}
