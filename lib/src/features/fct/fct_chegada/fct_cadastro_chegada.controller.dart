import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:i9t/src/features/condutor/condutor.controller.dart';
import 'package:i9t/src/features/home/home.controller.dart';
import 'package:i9t/src/features/trafego/trafego.model.dart';
import 'package:i9t/src/services/trafego.service.dart';
import 'fct_cadastro_chegada.state.dart';

class FctCadastroChegadaController
    extends ValueNotifier<FctCadastroChegadaState> {
  FctCadastroChegadaController(FctCadastroChegadaState value)
      : super(FctCadastroChegadaInitialState());

  TextEditingController pontoParadaEditingController =
      TextEditingController(text: 'Novas');
  TextEditingController hodometroEditingController =
      TextEditingController(text: '999999');
  TextEditingController horaEditingController =
      TextEditingController(text: '22:00');

  final GlobalKey<FormState> formChegadaKey = GlobalKey<FormState>();
  ValueNotifier<bool> checkBox = ValueNotifier(false);

  CondutorController? condutorController;
  HomeController? homeController;
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
    return throw "";
  }

  String? validaCampoHora(String? odometro) {
    if (horaEditingController.text.isEmpty) {
      return "Hora é um campo obrigatório.";
    }
    return throw "";
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
    value = FctCadastroChegadaLoadingState();
    try {
      if (true /*validaFormFct()*/) {
        // 1 - CRIA UM MODELO PRO NOVO TRAFEGO,
        TrafegoModel trafegoModel = TrafegoModel();
        // INSERE DADOS NO NOVO TRAFEGO

        trafegoModel.hodometro = int.parse(hodometroEditingController.text);
        trafegoModel.pontoParada = pontoParadaEditingController.text;

//CALCULA NOVA DATA
        DateTime agora = DateTime.now();
        String dia = agora.day.toString();
        String mes = agora.month.toString();
        String ano = agora.year.toString();
        String hora = horaEditingController.text.substring(0, 2).toString();
        String minuto = horaEditingController.text.substring(3, 5).toString();
        String novaData = "${ano}-${mes}-${dia} ${hora}:${minuto}";

        trafegoModel.horaChegada = novaData.toString();
        trafegoModel.fct = homeController?.fctAberta.value.id;
        print(trafegoModel.toJson());

        trafegoService.criaNovoTrafego(trafegoModel).then((v) {
          if (v.sucesso == true) {
            value = FctCadastroChegadaInitialState();
            Modular.to.navigate("/");
          }
        });
      }
    } catch (e) {
      value = FctCadastroChegadaFailureState(error: e.toString());
    }
  }
}
