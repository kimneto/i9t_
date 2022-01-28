import 'package:flutter/material.dart';
import 'package:i9t/src/features/fct/models/fct.model.dart';
import 'package:i9t/src/features/fct/states/cadastro_odometro_inicial.state.dart';
import 'package:i9t/src/features/veiculo/model/veiculo.model.dart';

class CadastroOdometroInicialController
    extends ValueNotifier<CadastroOdometroInicialState> {
  CadastroOdometroInicialController(CadastroOdometroInicialState value)
      : super(CadastroOdometroInicialInitialState());

  TextEditingController localizacaoEditingController = TextEditingController();
  TextEditingController odometroInicial = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  ValueNotifier<bool> checkBox = ValueNotifier(false);
  final fct = FctModel();
  VeiculoModel veiculoModel = VeiculoModel();

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
      fct.veiculo = veiculoModel;
      fct.concluido = false;
      fct.dataInicio = DateTime.now().toString();

      //  condutorModel.nome = nomeEditingController.text.toUpperCase();
      //  condutorModel.email = emailEditingController.text.toLowerCase();
      //  condutorModel.cpf = CPFValidator.strip(cpfEditingController.text);
      //  condutorModel.codUnidade = int.parse(codUnidadeEditingController.text);
      return true;
    } else
      return false;
  }
}
