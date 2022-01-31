import 'package:flutter/cupertino.dart';
import 'package:i9t/src/data/pointer.model.dart';
import 'package:i9t/src/features/trafego/trafego.model.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class TrafegoService extends ChangeNotifier {
  criaNovoTrafegoVazio(TrafegoModel trafego) async {
    final trafegoParse = ParseObject('Trafego');
    await trafegoParse.save().then((value) => return value);
  }
}
