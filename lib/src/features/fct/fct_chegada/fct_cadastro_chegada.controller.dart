import 'package:flutter/material.dart';
import 'package:i9t/src/data/data.model.dart';
import 'package:i9t/src/features/condutor/condutor.controller.dart';
import 'package:i9t/src/features/fct/models/fct.model.dart';
import 'package:i9t/src/features/trafego/trafego.model.dart';
import 'package:i9t/src/services/trafego.service.dart';
import '../fct_components/fct_aberta/fct_aberta.controller.dart';
import 'fct_cadastro_chegada.state.dart';

class FctCadastroChegadaController
    extends ValueNotifier<FctCadastroChegadaState> {
  FctCadastroChegadaController(FctCadastroChegadaState value)
      : super(FctCadastroChegadaInitialState());

  TextEditingController pontoParadaEditingController =
      TextEditingController(text: 'Dtic');
  TextEditingController hodometroEditingController =
      TextEditingController(text: '999999');
  TextEditingController horaEditingController =
      TextEditingController(text: '22:00');

  final GlobalKey<FormState> formChegadaKey = GlobalKey<FormState>();
  ValueNotifier<bool> checkBox = ValueNotifier(false);

  CondutorController? condutorController;
  FctAbertaController? fctAbertaController;
  final trafegoService = TrafegoService();

  String? validaCampoLocalizacao(String? localizacao) {
    if (pontoParadaEditingController.text.isEmpty) {
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
    try {
      if (true /*validaFormFct()*/) {
        // 1 - CRIA UM MODELO PRO NOVO TRAFEGO,
        TrafegoModel trafegoModel = TrafegoModel();
        // INSERE DADOS NO NOVO TRAFEGO
        trafegoModel.hodometro = hodometroEditingController.text;
        trafegoModel.pontoParada = pontoParadaEditingController.text;
        DateTime dateTime = DateTime.now();
        trafegoModel.horaChegada = DataModel(
            dataTempo: DateTime.parse(horaEditingController.text).toString());
        trafegoModel.idFct = fctAbertaController?.fctAberta.fctModel!.id;

        trafegoService
            .criaNovoTrafego(trafegoModel)
            .then((value) => print(value));
      }
    } catch (e) {
      value = FctCadastroChegadaFailureState(error: e.toString());
    }
  }
}
