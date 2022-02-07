import 'package:flutter/cupertino.dart';
import 'package:i9t/src/features/trafego/trafego.model.dart';

import 'package:parse_server_sdk/parse_server_sdk.dart';

class TrafegoService extends ChangeNotifier {
  Future<TrafegoModel> criaNovoTrafegoVazio() async {
    final trafegoParse = ParseObject('Trafego');
    final response = await trafegoParse.save();
    return await TrafegoModel.fromJson(await response.results!.last.toJson());
  }

  Future<TrafegoModel> deletaTrafego(TrafegoModel trafegoModel) async {
    final trafegoParse = ParseObject('Trafego')..objectId = trafegoModel.id;
    await trafegoParse.delete().then((value) {
      trafegoModel = TrafegoModel.fromJson(value.result);
    });
    return trafegoModel;
  }
}
