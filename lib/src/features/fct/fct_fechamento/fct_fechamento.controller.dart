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

  TextEditingController observacoes =
      TextEditingController(text: 'Viatura abastecida, óleo e filtro ok ');
  TextEditingController novidades = TextEditingController(text: 'Nill ');

  final GlobalKey<FormState> formChegadaKey = GlobalKey<FormState>();
  ValueNotifier<bool> checkBox = ValueNotifier(false);

  CondutorController? condutorController;
  HomeController? homeController;
  final fctService = FctService();

  String? validaCampoObservacoes(String? localizacao) {
    if (observacoes.text.isEmpty) {
      return 'Localização é um campo obrigatório.';
    }
  }

  bool validaFormFct() {
    formChegadaKey.currentState!.validate();
    if (formChegadaKey.currentState!.validate()) {
      return true;
    } else
      return false;
  }

  TimeOfDay now = TimeOfDay.now();

  void inseriNovoTrafegoComPdi() async {
    value = FctFechamentoLoadingState();
    try {
      if (true /*validaFormFct()*/) {
        // 1 - CRIA UM MODELO PRO NOVO TRAFEGO,
        FctModel fctModel = FctModel();
        // INSERE DADOS NO NOVO TRAFEGO

//CALCULA NOVA DATA
        DateTime agora = DateTime.now();
        String dia = agora.day.toString();
        String mes = agora.month.toString();
        String ano = agora.year.toString();
        String hora = agora.hour.toString().substring(0, 2).toString();
        String minuto = agora.minute.toString().substring(3, 5).toString();
        String novaData = "${ano}-${mes}-${dia} ${hora}:${minuto}";

        fctService.finalizaFct(fctModel).then((v) {
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
