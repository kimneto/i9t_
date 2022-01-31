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
    queryFctsService.whereEqualTo(
        "condutor",
        PointerModel(className: 'Condutor', objectId: condutor.objectId)
            .toJson());
    queryFctsService.whereEqualTo("concluido", false);
    final response = await queryFctsService.query();
    if (response.success && response.results != null) {
      fctModel = await FctModel.fromJson(response.results!.last.toJson());
    }

    return fctModel;
  }

  Future<FctModel> criaNovoFctAberto(FctModel fct, int numeroDocumento) async {
    final fctParse = ParseObject('Fct');
    await fctParse
      ..set(
          'condutor',
          PointerModel(
              className: 'Condutor', objectId: fct.condutorModel?.objectId))
      ..set(
          'veiculo',
          PointerModel(
              className: 'Veiculo', objectId: fct.veiculoModel?.objectId))
      ..set('dataInicio', DateTime.now())
      ..set(
          'trafego',
          PointerModel(
              className: 'Trafego', objectId: fct.trafegoModel?.objectId))
      ..set('documento', fct.documento)
      ..set('hodometroInicial', fct.hodometroInicial)
      ..set('pontoInicial', fct.pontoInicial);
    await fctParse.save();
    return fct;
  }

  Future<List<FctModel>> pegaFctsPorAno(int ano) async {
    List<FctModel> listaFcts = [];
// PEGA AS FCTS ACIMA DO DIA 1 DO MES 1 DO AO CORRENTE
    queryFctsService.whereGreaterThanOrEqualsTo(
        'dataInicio', DateTime(ano, 1, 1));
// PEGA AS FCTS ABAOXO DO DIA 31 DO MES 12 DO AO CORRENTE
    queryFctsService.whereLessThanOrEqualTo(
        'dataInicio', DateTime(ano, 31, 12));
// EXECUTA A QUERY
    final response = await queryFctsService.query();
// VARIAVEL COM O PROXIMO NUMERO DA FCT SE FOR NULO INSERE O 1
    // int proximoNumeroFct = response.results?.length ?? 1;

    if (response.success) {
      response.results?.forEach((fct) {
        listaFcts.add(FctModel.fromJson(fct.toJson()));
      });
    }
    return listaFcts;
  }

  Future<List<FctModel>> pegaFcts() async {
    List<FctModel> listaVeiculos = [];
    await ParseObject('Fct').getAll().then((Veiculos) {
      if (Veiculos.success) {
        Veiculos.results!.map((e) {
          listaVeiculos.add(FctModel.fromJson(e.toJson()));
        });
      }
    });
    return listaVeiculos;
  }
}
