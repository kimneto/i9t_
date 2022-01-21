import 'package:flutter/cupertino.dart';
import 'package:i9trafego/src/model/viatura.model.dart';
import 'package:i9trafego/src/services/viatura.service.dart';

class FormFctSelecionaVtrController extends ChangeNotifier {
  ViaturaService vtrService = ViaturaService();
  ViaturaModel vtrModel = ViaturaModel();
}
