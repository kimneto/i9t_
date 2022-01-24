import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:i9t/src/features/condutor/state/cadastro.states.dart';
import 'package:i9t/src/features/condutor/models/condutor.model.dart';
import 'package:i9t/src/features/condutor/services/condutor.service.dart';

class CadastroCondutorController extends ValueNotifier<CadastroCondutorState> {
  CadastroCondutorController(CadastroCondutorState value)
      : super(CadastroCondutorInitial());

  TextEditingController nomeEditingController = TextEditingController();
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController cpfEditingController = TextEditingController();
  TextEditingController codUnidadeEditingController = TextEditingController();
  bool checkBox = false;
  String errorMessage = "";
  CondutorService condutorService = CondutorService();
  CondutorModel condutorModel = CondutorModel();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? validaCampoNome(String? nome) {
    if (nomeEditingController.text.isEmpty) {
      return 'Nome é um campo obrigatório';
    }

    if (!nomeEditingController.text.contains(' ')) {
      return 'Digite seu nome completo';
    }

    if (nomeEditingController.text
        .contains(RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]'))) {
      return 'Somente letras são permitidas';
    }
  }

  String? validaCampoCpf(String? cpf) {
    if (!CPFValidator.isValid(CPFValidator.strip(cpfEditingController.text))) {
      return "CPF inválido";
    }

    if (cpfEditingController.text.isEmpty) {
      return "Campo obrigatório";
    }
    return null;
  }

  String? validaCampoEmail(String? email) {
    if (emailEditingController.text.isEmpty) {
      return "Campo obrigatório";
    }

    if (!emailEditingController.text.contains(RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"))) {
      return "Email inválido";
    }
    return null;
  }

  String? validaCampoCodUnidade(String? codUnidade) {
    if (codUnidadeEditingController.text.isEmpty) {
      return "Campo obrigatório";
    }

    if (!codUnidadeEditingController.text.contains(RegExp(r'[0-9]'))) {
      return 'Somente números são permitidas';
    }

    if (codUnidadeEditingController.text.length != 9) {
      return 'O Código da Unidade deve ter 9 dígitos';
    }
    return null;
  }

  bool validaFormCondutor() {
    formKey.currentState!.validate();
    if (formKey.currentState!.validate()) {
      condutorModel.nome = nomeEditingController.text.toUpperCase();
      condutorModel.email = emailEditingController.text.toLowerCase();
      condutorModel.cpf = CPFValidator.strip(cpfEditingController.text);
      condutorModel.codUnidade = int.parse(codUnidadeEditingController.text);
      return true;
    } else
      return false;
  }

  cadastrarCondutor() async {
    bool estaValidado = await validaFormCondutor();

    try {
      if (estaValidado) {
        // value = CadastroCondutorLoading();
        await condutorService
            .pegaCondutorPorCpf(condutorModel.cpf.toString())
            .then((v) {
          if (v.cpf != null) {
            value =
                CadastroCondutorFailure(error: 'Esse CPF já está cadastrado');
          } else {
            condutorService.cadastraCondutor(condutorModel);
            value = CadastroCondutorSuccess(condutor: condutorModel);
          }
        });
      }
    } catch (e) {
      throw Exception("I9T Erro ==> ${e.toString()}");
    }
  }
}
