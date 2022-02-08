import 'package:flutter/material.dart';
import 'package:i9t/src/features/condutor/condutor.controller.dart';
import 'package:i9t/src/services/fct.service.dart';
import 'package:i9t/src/features/fct/models/fct.model.dart';
import 'package:i9t/src/features/fct/veiculo/veiculo.model.dart';

import 'package:i9t/src/features/trafego/trafego.model.dart';
import 'package:i9t/src/services/trafego.service.dart';

import '../fct_components/fct_aberta/fct_aberta.controller.dart';
import 'fct_cadastro_chegada.state.dart';

class FctCadastroChegadaController
    extends ValueNotifier<FctCadastroChegadaState> {
  FctCadastroChegadaController(FctCadastroChegadaState value)
      : super(FctCadastroChegadaInitialState());

  TextEditingController localizacaoEditingController =
      TextEditingController(text: 'Marte');
  TextEditingController hodometroEditingController =
      TextEditingController(text: '999999');
  TextEditingController horaEditingController =
      TextEditingController(text: '22:00');

  final GlobalKey<FormState> formChegadaKey = GlobalKey<FormState>();
  ValueNotifier<bool> checkBox = ValueNotifier(false);

  CondutorController? condutorController;
  FctAbertaController? fctAbertaController;

  String? validaCampoLocalizacao(String? localizacao) {
    if (localizacaoEditingController.text.isEmpty) {
      return 'Localização é um campo obrigatório.';
    }
  }

  String? validaCampoHodometro(String? odometro) {
    if (hodometroEditingController.text.isEmpty) {
      return "Hodômetro é um campo obrigatório.";
    }
    return null;
  }

  String? validaCampoHora(String? odometro) {
    if (horaEditingController.text.isEmpty) {
      return "Hora é um campo obrigatório.";
    }
    return null;
  }

  bool validaFormFct() {
    formChegadaKey.currentState!.validate();
    if (formChegadaKey.currentState!.validate()) {
      return true;
    } else
      return false;
  }

  void inseriNovoTrafegoComPdi() async {
    value = FctCadastroChegadaLoadingState();
    String? documento;

    final fct = FctModel();
    if (validaFormFct()) {}
  }
}
