import 'package:flutter/material.dart';
import 'package:i9t/src/data/data.model.dart';
import 'package:i9t/src/features/condutor/condutor.controller.dart';
import 'package:i9t/src/features/fct/models/fct.model.dart';
import 'package:i9t/src/features/trafego/trafego.model.dart';
import 'package:i9t/src/services/trafego.service.dart';
import '../fct_components/fct_aberta/fct_aberta.controller.dart';
import 'fct_cadastro_saida.state.dart';

class FctCadastroSaidaController extends ValueNotifier<FctCadastroSaidaState> {
  FctCadastroSaidaController(FctCadastroSaidaState value)
      : super(FctCadastroSaidaInitialState());

  TextEditingController horaEditingController =
      TextEditingController(text: '22:00');

  final GlobalKey<FormState> formSaidaKey = GlobalKey<FormState>();
  ValueNotifier<bool> checkBox = ValueNotifier(false);

  CondutorController? condutorController;
  FctAbertaController? fctAbertaController;
  final trafegoService = TrafegoService();

  String? validaCampoHora(String? odometro) {
    if (horaEditingController.text.isEmpty) {
      return "Hora é um campo obrigatório.";
    }
    return null;
  }

  bool validaFormFct() {
    formSaidaKey.currentState!.validate();
    if (formSaidaKey.currentState!.validate()) {
      return true;
    } else
      return false;
  }

  TimeOfDay now = TimeOfDay.now();

  void inseriNovoTrafegoComPdi() async {
    value = FctCadastroSaidaLoadingState();
    try {
      if (true /*validaFormFct()*/) {
        // 1 - CRIA UM MODELO PRO NOVO TRAFEGO,
        TrafegoModel trafegoModel = TrafegoModel();
        // INSERE DADOS NO NOVO TRAFEGO
        trafegoModel.horaPartida = horaEditingController.text;

//CALCULA NOVA DATA
        DateTime agora = DateTime.now();
        String dia = agora.day.toString();
        String mes = agora.month.toString();
        String ano = agora.year.toString();
        String hora = horaEditingController.text.substring(0, 2).toString();
        String minuto = horaEditingController.text.substring(3, 5).toString();
        String novaData = "${ano}-${mes}-${dia} ${hora}:${minuto}";

        trafegoModel.horaPartida = novaData.toString();
        trafegoModel.fctId = fctAbertaController?.fctAberta.id;
        print(fctAbertaController?.fctAberta.toJson());

        trafegoService
            .criaNovoTrafego(trafegoModel)
            .then((value) => print(value));
      }
      value = FctCadastroSaidaSuccessState();
    } catch (e) {
      value = FctCadastroSaidaFailureState(error: e.toString());
    }
  }
}

pegaHoraAtualComData() {
  DateTime agora = DateTime.now();

  String dia = agora.day.toString();
  String mes = agora.month.toString();
  String ano = agora.year.toString();
}
