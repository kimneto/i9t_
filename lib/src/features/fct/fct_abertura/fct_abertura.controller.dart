import 'package:flutter/material.dart';
import 'package:i9t/src/features/condutor/condutor.controller.dart';
import 'package:i9t/src/services/fct.service.dart';
import 'package:i9t/src/features/fct/models/fct.model.dart';
import 'package:i9t/src/features/fct/veiculo/veiculo.model.dart';
import 'package:i9t/src/features/fct/fct_abertura/fct_abertura.state.dart';
import 'package:i9t/src/features/trafego/trafego.model.dart';
import 'package:i9t/src/services/trafego.service.dart';

class FctAberturaController extends ValueNotifier<FctAberturaState> {
  FctAberturaController(FctAberturaState value)
      : super(FctAberturaInitialState());

  TextEditingController localizacaoEditingController =
      TextEditingController(text: 'Marte');
  TextEditingController odometroInicialEditingController =
      TextEditingController(text: '999999');

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  ValueNotifier<bool> checkBox = ValueNotifier(false);

  VeiculoModel veiculoModel = VeiculoModel();
  FctService fctAbertaService = FctService();
  TrafegoService trafegoService = TrafegoService();
  TrafegoModel trafegoModel = TrafegoModel();

  CondutorController? condutorController;

  String? validaCampoLocalizacao(String? localizacao) {
    if (localizacaoEditingController.text.isEmpty) {
      return 'Localização é um campo obrigatório.';
    }

    if (localizacaoEditingController.text
        .contains(RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]'))) {
      return 'Somente letras são permitidas.';
    }
  }

  String? validaCampoOdometroInicial(String? odometro) {
    if (odometroInicialEditingController.text.isEmpty) {
      return "Odômetro é um campo obrigatório.";
    }
    return null;
  }

  bool validaFormFct() {
    formKey.currentState!.validate();
    if (formKey.currentState!.validate()) {
      return true;
    } else
      return false;
  }

  void criaNovoFctbertaComTrafego() async {
    value = FctAberturaLoadingState();
    // 1 - PEGA O ULTIMO FCT POR DATA ANO CORRENTE
    String? documento;

    final fct = FctModel();
    try {
      if (validaFormFct()) {
        //1- PEGA O ULTIMO FCT POR DATA ANO CORRENTE E GERA NUMERO DE DOCUMENTO
        await fctAbertaService
            .pegaNumeroDocumentoFct(DateTime.now().year.toString())
            .then((value) {
          documento = value.data.toString();
        });

        //2 - PREENCHE DADOS DO FCT INCIAL

        fct.veiculoModel = veiculoModel;
        fct.condutorModel = condutorController!.condutor;
        fct.concluido = false;
        fct.documento = documento;

        //4- CRIA FCT
        fctAbertaService.criaNovoFctAberto(fct).then(
          (result) async {
            if (result.erro == null) {
              value = FctAberturaSuccessState();
              await trafegoService.criaNovoTrafego(trafegoModel).then(
                    (res) => trafegoModel = TrafegoModel.fromJson(res.data),
                  );
            } else {
              await trafegoService.deletaTrafego(trafegoModel);
              value = FctAberturaFailureState(error: 'Algo deu errado!');
            }
          },
        );
      }
    } catch (e) {
      await trafegoService.deletaTrafego(trafegoModel);
      value = FctAberturaFailureState(error: e.toString());
    }
  }
}
