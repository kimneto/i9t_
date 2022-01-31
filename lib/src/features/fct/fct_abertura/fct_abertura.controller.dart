import 'package:flutter/material.dart';
import 'package:i9t/src/features/condutor/controllers/condutor.controller.dart';
import 'package:i9t/src/features/fct/fct_components/fct_aberta/fct_aberta.service.dart';
import 'package:i9t/src/features/fct/models/veiculo.model.dart';
import 'package:i9t/src/features/fct/models/fct.model.dart';
import 'package:i9t/src/features/fct/fct_abertura/fct_abertura.state.dart';

class FctAberturaController extends ValueNotifier<FctAberturaState> {
  FctAberturaController(FctAberturaState value)
      : super(FctAberturaInitialState());

  TextEditingController localizacaoEditingController =
      TextEditingController(text: 'Marte');
  TextEditingController odometroInicial = TextEditingController(text: '999999');

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  ValueNotifier<bool> checkBox = ValueNotifier(false);
  final fct = FctModel();
  VeiculoModel veiculoModel = VeiculoModel();
  FctAbertaService fctAbertaService = FctAbertaService();
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
    if (odometroInicial.text.isEmpty) {
      return "Odômetro é um campo obrigatório.";
    }
    return null;
  }

  bool validaFormCondutor() {
    formKey.currentState!.validate();
    if (formKey.currentState!.validate()) {
      return true;
    } else
      return false;
  }

  void criaNovoFctbertaComTrafego() async {
    // 1 - PEGA O ULTIMO FCT POR DATA ANO CORRENTE
    int numeroDoc = 0;
    await fctAbertaService.pegaFctsPorAno(DateTime.now().year).then((fcts) {
      if (fcts.length > 0) {
        numeroDoc = fcts.length + 1;
      } else {
        numeroDoc = 1;
      }
    });

    try {
      fct.veiculoModel = veiculoModel;
      fct.condutorModel = condutorController!.condutor;
      fct.concluido = false;
      fct.documento = await fct.geradorNumeroDocumentoFct(numeroDoc);
      //fct.trafego = false;

      if (validaFormCondutor()) {
        value = FctAberturaLoadingState();
        fctAbertaService.criaNovoFctAberto(fct, numeroDoc).then(
          (v) {
            if (v.concluido != null) {
              value = FctAberturaSuccessState(fct: fct);
            } else {
              value = FctAberturaFailureState(error: 'Algo deu errado!');
            }
          },
        );
      }
    } catch (e) {
      value = FctAberturaFailureState(error: e.toString());
    }
  }
}
