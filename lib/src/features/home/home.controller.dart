import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:i9t/src/features/condutor/condutor.model.dart';

import '../../services/fct.service.dart';
import '../condutor/condutor.controller.dart';
import '../fct/models/fct.model.dart';

class HomeController extends ValueNotifier {
  HomeController(value) : super(value);
  FctModel fctAberta = FctModel();
  List<FctModel> fctsFechadas = [];

  FctService fctService = FctService();
  final condutorController = Modular.get<CondutorController>();
  final homeController = Modular.get<HomeController>();
  final condutor = CondutorModel();

  int giraCartao = 2;

  carregaFctAberta() async {
    try {
      await fctService
          .pegaFtcsPorCondutor(condutorController.condutor, false)
          .then((res) {
        if (res.sucesso != false) {
          fctAberta = FctModel.fromJson(res.data[0]);
        }
      });
    } catch (e) {}
  }

  carregarFctsFechadas() async {
    await fctService.pegaFtcsConcluidasPorCondutor(condutor, true).then((res) {
      try {
        List<FctModel> fcts = [];
        if (res.erro == null && res.sucesso == true) {
          res.data.forEach((fct) {
            if (fct != null) {
              fcts.add(
                FctModel.fromJson(fct),
              );
            } else if (fcts.isEmpty) {
            } else {}
          });
        }
      } catch (e) {}
    });
  }
}
