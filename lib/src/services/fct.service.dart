import 'package:i9trafego/src/model/fct.model.dart';
import 'package:i9trafego/src/model/condutor.model.dart';
import 'package:i9trafego/src/model/pointer.model.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class FctService {
  final queryFctsService = QueryBuilder(ParseObject('Fct'));
  Future<List<FctModel>> pegaFcts() async {
    List<FctModel> listaFcts = [];
    await ParseObject('Fct').getAll().then((fct) {
      if (fct.success) {
        fct.results?.forEach((element) {
          listaFcts.add(FctModel.fromJson(element.toJson()));
        });
      }
    });
    return listaFcts;
  }

  Future<List<FctModel>> pegaFtcsConcluidasPorCondutor(
      CondutorModel condutor) async {
    List<FctModel> listaFcts = [];

    queryFctsService.whereEqualTo(
        "condutor",
        PointerModel(className: 'Condutor', objectId: condutor.objectId)
            .toJson());
    queryFctsService.whereEqualTo("concluido", true);

    final response = await queryFctsService.query();

    if (response.success) {
      response.results?.forEach((element) {
        listaFcts.add(FctModel.fromJson(element.toJson()));
      });
    }

    return listaFcts;
  }

  Future<List<FctModel>> pegaFtcsNaoConcluidasPorCondutor(
      CondutorModel condutor) async {
    List<FctModel> listaFcts = [];

    queryFctsService.whereEqualTo(
        "condutor",
        PointerModel(
          className: 'Condutor',
          objectId: condutor.objectId,
        ).toJson());
    queryFctsService.whereEqualTo("concluido", false);
    final response = await queryFctsService.query();
    if (response.success) {
      response.results?.forEach((element) {
        listaFcts.add(FctModel.fromJson(element.toJson()));
      });
    }

    return listaFcts;
  }
/*    FctModel usuario = FctModel();

    queryCondutorService.whereEqualTo("objectId", usuario.id);

    final response = await queryCondutorService.query();
    if (response.success) {
      usuario = FctModel.fromJson(await response.result[0].toJson());
    }

    return usuario;
  }*/

}
