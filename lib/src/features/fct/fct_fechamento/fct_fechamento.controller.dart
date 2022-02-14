import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:i9t/src/features/condutor/condutor.controller.dart';
import 'package:i9t/src/features/home/home.controller.dart';
import 'package:i9t/src/features/trafego/trafego.model.dart';
import 'package:i9t/src/services/trafego.service.dart';
import '../../../services/fct.service.dart';
import '../models/fct.model.dart';
import 'fct_fechamento.state.dart';

class FctFechamentoController extends ValueNotifier<FctFechamentoState> {
  FctFechamentoController(FctFechamentoState value)
      : super(FctFechamentoInitialState());

  TextEditingController defeitos =
      TextEditingController(text: 'Viatura abastecida, óleo e filtro ok ');
  TextEditingController novidades = TextEditingController(text: 'Nill ');

  final GlobalKey<FormState> formFinalizaKey = GlobalKey<FormState>();
  ValueNotifier<bool> checkBox = ValueNotifier(false);

  CondutorController? condutorController;
  HomeController? homeController;
  final fctService = FctService();

  String? validaCampoObservacoes(String? localizacao) {
    if (defeitos.text.isEmpty) {
      return 'Localização é um campo obrigatório.';
    }
  }

  bool validaFormFct() {
    formFinalizaKey.currentState!.validate();
    if (formFinalizaKey.currentState!.validate()) {
      return true;
    } else
      return false;
  }

  void finalizaFct() async {
    value = FctFechamentoLoadingState();
    try {
      if (true /*validaFormFct()*/) {
        FctModel fct = FctModel();
        fct.id = fct.novidadesVerificadas = novidades.text;
        fct.defeitosVerificados = defeitos.text;
        fctService.finalizaFct(fct).then((v) {
          if (v.sucesso == true) {
            value = FctFechamentoInitialState();
            Modular.to.navigate("/");
          }
        });
      }
    } catch (e) {
      value = FctFechamentoFailureState(error: e.toString());
    }
  }
}
