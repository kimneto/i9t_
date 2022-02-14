import 'package:flutter/material.dart';
import 'package:i9t/src/features/home/home.state.dart';
import '../../services/fct.service.dart';
import '../condutor/condutor.controller.dart';
import '../fct/models/fct.model.dart';

class HomeController extends ValueNotifier<HomeState> {
  HomeController(HomeState value) : super(HomeInitialState());

  FctService fctService = FctService();
  late CondutorController condutorController;

  ValueNotifier<FctModel> fctAberta = ValueNotifier(FctModel());
  ValueNotifier<int> giraCartao = ValueNotifier(2);
  List<FctModel> fcts = [];

  carregaFctAberta() async {
    await fctService.pegaFtcAbertaPorCondutor(condutorController.condutor).then(
      (res) {
        if (res.sucesso == true && res.data[0] != null) {
          fctAberta.value = FctModel.fromJson(res.data[0]);
          fctAberta.value.trafegoModel!.forEach((element) {
            if (element.concluido == false) {
              giraCartao.value = 1;
            } else {
              giraCartao.value = 0;
            }
          });
        }
      },
    );
  }

  Future carregaFctsFechadas() async {
    await fctService
        .pegaFtcsFechadasPorCondutor(condutorController.condutor)
        .then(
      (res) {
        fcts = [];
        if (res.erro == null && res.sucesso == true) {
          for (var item in res.data) {
            fcts.add(FctModel.fromJson(item));
          }
          return fcts;
        } else {
          throw Exception(res.erro);
        }
      },
    );
  }
}
