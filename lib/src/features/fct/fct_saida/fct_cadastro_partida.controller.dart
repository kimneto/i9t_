import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:i9t/src/features/trafego/trafego.model.dart';
import 'package:i9t/src/services/trafego.service.dart';
import 'fct_cadastro_partida.state.dart';

class FctCadastroPartidaController
    extends ValueNotifier<FctCadastroPartidaState> {
  FctCadastroPartidaController(FctCadastroPartidaState value)
      : super(FctCadastroPartidaInitialState());

  TextEditingController horaEditingController = TextEditingController();
  final GlobalKey<FormState> formPartidaKey = GlobalKey<FormState>();

  final trafegoService = TrafegoService();

  String? validaCampoHora(String? odometro) {
    if (horaEditingController.text.isEmpty) {
      return "Hora é um campo obrigatório.";
    }
    return null;
  }

  bool validaFormFct() {
    formPartidaKey.currentState!.validate();
    if (formPartidaKey.currentState!.validate()) {
      return true;
    } else
      return false;
  }

  TimeOfDay now = TimeOfDay.now();

  void cadastraPartida(List<TrafegoModel> trafegos) async {
    value = FctCadastroPartidaSuccessState();
    TrafegoModel trafegoModel = TrafegoModel();
    value = FctCadastroPartidaLoadingState();
    try {
      if (true /*validaFormFct()*/) {
        // PEGA O ID DO TRAFEGO QUE NÃO ESTA CONCLUIDO  E SETADA FALSE
        trafegos.forEach((element) {
          if (element.concluido == false) {
            trafegoModel.id = element.id;
            trafegoModel.fct = element.fct;

            print(trafegoModel.toJson());
          }
        });

        // CRIA A NOVA DATA

        DateTime agora = DateTime.now();
        String dia = agora.day.toString();
        String mes = agora.month.toString();
        String ano = agora.year.toString();
        String hora = horaEditingController.text.substring(0, 2).toString();
        String minuto = horaEditingController.text.substring(3, 5).toString();
        String novaData = "${ano}-${mes}-${dia} ${hora}:${minuto}";

        trafegoModel.horaPartida = novaData.toString();

        // ATUALIZA O TRAFEGO COM A NOVA DATA E SETA CONCLUIDO COMO TRUE

        print({
          "fctId": trafegoModel.fct!,
          "trafegoId": trafegoModel.id,
          "horaPartida": trafegoModel.horaPartida
        });

        trafegoService.atualizaTrafegoPartida(trafegoModel).then((v) {
          print(v);
          value = FctCadastroPartidaInitialState();
          Modular.to.navigate("/");
        });
      }
    } catch (e) {
      value = FctCadastroPartidaFailureState(error: e.toString());
    }
  }
}
