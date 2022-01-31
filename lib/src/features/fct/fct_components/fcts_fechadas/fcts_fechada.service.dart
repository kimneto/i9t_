import 'package:flutter/cupertino.dart';
import 'package:i9t/src/data/pointer.model.dart';
import 'package:i9t/src/features/fct/models/fct.model.dart';
import 'package:i9t/src/features/condutor/condutor.model.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class FctsFechadasService extends ChangeNotifier {
  final queryFctsService = QueryBuilder(ParseObject('Fct'));

  Future<List<FctModel>> pegaFtcsConcluidasPorCondutor(
      CondutorModel condutor) async {
    List<FctModel> listaFcts = [];

    queryFctsService.whereEqualTo(
        "condutor",
        PointerModel(className: 'Condutor', objectId: condutor.objectId)
            .toJson());
    queryFctsService.whereEqualTo("concluido", true);
    queryFctsService.orderByDescending('documento');

    final response = await queryFctsService.query();

    if (response.success) {
      response.results?.forEach((element) {
        listaFcts.add(FctModel.fromJson(element.toJson()));
      });
    }

    return listaFcts;
  }
}
