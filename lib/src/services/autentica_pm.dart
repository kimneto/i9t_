import 'package:dio/dio.dart';
import 'package:i9t/src/model/request_autenticapm-model.dart';
import 'package:i9t/src/shared/settings.dart';

class AutenticaPM {
  Dio dio = Dio();

  RequestAutenticaPMModel requestAutenticaPMModel = RequestAutenticaPMModel(
      tipo: 'nulo',
      mensagem: 'Não foi possível receber informações do Autentica PM!');

  Future<RequestAutenticaPMModel> autenticaMike({
    required String CPF,
    required String Senha,
  }) async {
    try {
      await dio
          .request(
        "https://www.policiamilitar.sp.gov.br/AreaRestrita/LoginAreaRestrita?CPF=${CPF}&Senha=${Senha}",
      )
          .then((value) {
        if (value.statusCode == 200) {
          return requestAutenticaPMModel.fromJson(value.data);
        }

        if (value.statusCode == 302) {
          requestAutenticaPMModel.tipo = 'erro';
          requestAutenticaPMModel.mensagem =
              'Dados errados enviados para o Servidor';
          return requestAutenticaPMModel;
        }
      });
    } catch (e) {
      requestAutenticaPMModel.tipo = 'erro';
      requestAutenticaPMModel.mensagem = 'Erro ao tentar autenticar! ==> $e';
      return requestAutenticaPMModel;
    }
    return requestAutenticaPMModel;
  }
}
