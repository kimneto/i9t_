import 'package:flutter/cupertino.dart';
import 'package:i9t/src/data/pointer.model.dart';
import 'package:i9t/src/features/fct/models/fct.model.dart';
import 'package:i9t/src/features/condutor/models/condutor.model.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class FctAbertaService extends ChangeNotifier {
  final queryFctsService = QueryBuilder(ParseObject('Fct'));

  Future<FctModel> pegaFtcsNaoConcluidasPorCondutor(
      CondutorModel condutor) async {
    FctModel fctModel = FctModel();
    var fct;

    queryFctsService.whereEqualTo(
        "condutor",
        PointerModel(className: 'Condutor', objectId: condutor.objectId)
            .toJson());

    queryFctsService.whereEqualTo("concluido", false);

    final response = await queryFctsService.query();

    if (response.success) {
      fct = response.results!.last;

      fctModel = FctModel.fromJson(fct.toJson());
    }

    return fctModel;
  }
}
