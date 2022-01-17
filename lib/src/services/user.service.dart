import 'dart:async';

import 'package:i9trafego/src/model/user.model.dart';

class UserService {
  Future<UserModel> getUser(String CPF) async => await Future.delayed(
        Duration(seconds: 1),
        () => UserModel(
          id: 1,
          cpf: '30459220829',
          email: 'joaquim.moreiraneto@gmail.com',
          name: 'JOAQUIM MOREIRA DA SILVA NETO',
          re: '135256-3',
        ),
      );
}
