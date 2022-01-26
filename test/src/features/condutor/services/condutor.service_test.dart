import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:i9t/src/features/veiculo/model/veiculo.model.dart';

import 'package:i9t/src/features/veiculo/services/veiculo.service.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final keyApplicationId = '0Gi3NSxdGbl32WhRCVTErJCjnXYYeTwH40AJjIXc';
  final keyClientKey = 'ZVzkDOCQ8eaPUtfQRIjqMTuqGTej9KXL58777Q7r';
  final keyParseServerUrl = 'https://parseapi.back4app.com/parse/';

  await Parse().initialize(
    keyApplicationId,
    keyParseServerUrl,
    clientKey: keyClientKey,
    debug: true,
  );

  final queryVeiculoService = QueryBuilder(ParseObject('Veiculo'));

  test('Pegar Condutor por CPF', () async {
    List<VeiculoModel> listaVeiculos = [];
    queryVeiculoService.whereNotEqualTo('statusVtr', '0');
    final response = await queryVeiculoService.query();
    if (response.error is! ParseError) {
      response.results!
          .map((e) => {listaVeiculos.add(VeiculoModel.fromJson(e.toJson()))});
    }
    print(listaVeiculos);
  });
}
