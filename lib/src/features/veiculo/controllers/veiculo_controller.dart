import 'package:flutter/cupertino.dart';
import 'package:i9t/src/features/veiculo/model/veiculo.model.dart';
import 'package:i9t/src/features/veiculo/services/veiculo.service.dart';

class VeiculoController extends ChangeNotifier {
  VeiculoService vtrService = VeiculoService();
  VeiculoModel vtrModel = VeiculoModel();
}
