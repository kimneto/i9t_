import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';
import 'package:i9t/src/features/condutor/condutor.model.dart';

import 'package:i9t/src/features/fct/fct_components/fcts_fechadas/fcts_fechadas.states.dart';
import '../../../../services/fct.service.dart';
import '../../models/fct.model.dart';

class FctsFechadasController extends ValueNotifier<FctsFechadasState> {
  FctService service = FctService();
  late CondutorModel condutor;

  FctsFechadasController() : super(FctsFechadasInitial());

  carregarFctsFechadas() async {
    SchedulerBinding.instance?.addPostFrameCallback((_) {
      value = FctsFechadasLoading();
    });

    await service.pegaFtcsFchadasPorCondutor(condutor).then((res) {
      try {
        List<FctModel> fcts = [];
        if (res.erro == null && res.sucesso == true) {
          res.data.forEach((fct) {
            if (fct != null) {
              fcts.add(
                FctModel.fromJson(fct),
              );
            }

            if (fcts.isEmpty) {
              value = FctsFechadasEmpty();
            }
          });
          value = FctsFechadasSuccess(fctsFechadas: fcts);
        }
      } catch (e) {
        value = FctsFechadasFailure(error: e.toString());
      }
    });
  }
}
