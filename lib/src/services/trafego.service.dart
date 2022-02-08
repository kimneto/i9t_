import 'package:i9t/src/features/trafego/trafego.model.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import '../data/resposta_api.model.dart';

class TrafegoService {
  Future<RespostaApiModel> criaNovoTrafego(TrafegoModel trafego) async {
    final function = ParseCloudFunction("cria-trafego");
    final resposta = await function.execute(
      parameters: trafego.toJson(),
    );
    return RespostaApiModel.fromJson(resposta.result);
  }

  Future<TrafegoModel> deletaTrafego(TrafegoModel trafegoModel) async {
    final trafegoParse = ParseObject('Trafego')..objectId = trafegoModel.id;
    await trafegoParse.delete().then((value) {
      trafegoModel = TrafegoModel.fromJson(value.result);
    });
    return trafegoModel;
  }
}
