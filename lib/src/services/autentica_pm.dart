import 'package:dio/dio.dart';
import 'package:i9trafego/src/model/request_autenticapm-model.dart';
import 'package:i9trafego/src/shared/settings.dart';

class AutenticaPM {
  Dio dio = Dio();

  RequestAutenticaPMModel requestAutenticaPMModel = RequestAutenticaPMModel(
      tipo: 'nulo',
      mensagem: 'Não foi possível receber informações do Autentica PM!');

  Future<RequestAutenticaPMModel> autenticaMike({
    required String CPF,
    required String Senha,
  }) async {
    await dio
        .request(
      "https://www.policiamilitar.sp.gov.br/AreaRestrita/LoginAreaRestrita?CPF=${CPF}&Senha=${Senha}",
    )
        .then((value) {
      print(value.data);
      if (value.statusCode == 200) {
        return requestAutenticaPMModel.fromJson(value.data);
      }
    });
    return requestAutenticaPMModel;
  }
}
