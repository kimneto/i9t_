import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'autenticapm.model.dart';

class AutenticaPM extends Module {
  Dio dio = Dio();

  AutenticaPMModel autenticaPMModel = AutenticaPMModel(
      tipo: 'nulo',
      mensagem: 'Não foi possível receber informações do Autentica PM!');

  Future<AutenticaPMModel> autenticaMike({
    required String CPF,
    required String Senha,
  }) async {
    try {
      await dio
          .get(
              "https://www.policiamilitar.sp.gov.br/AreaRestrita/LoginAreaRestrita?CPF=${CPF}&Senha=${Senha}")
          .then((value) {
        if (value.statusCode == 200) {
          return autenticaPMModel.fromJson(value.data);
        }

        if (value.statusCode == 302) {
          autenticaPMModel.tipo = 'erro';
          autenticaPMModel.mensagem = 'Dados errados enviados para o Servidor';
          return autenticaPMModel;
        }
      });
    } catch (e) {
      autenticaPMModel.tipo = 'erro';
      autenticaPMModel.mensagem = 'Erro ao tentar autenticar! ==> $e';
      return autenticaPMModel;
    }
    return autenticaPMModel;
  }
}
