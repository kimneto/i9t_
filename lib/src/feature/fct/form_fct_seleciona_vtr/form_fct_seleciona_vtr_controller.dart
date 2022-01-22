import 'package:flutter/cupertino.dart';
import 'package:i9t/src/model/viatura.model.dart';
import 'package:i9t/src/services/viatura.service.dart';

class FormFctSelecionaVtrController extends ChangeNotifier {
  ViaturaService vtrService = ViaturaService();
  ViaturaModel vtrModel = ViaturaModel();
}
