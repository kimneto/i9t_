import 'package:flutter/cupertino.dart';
import 'package:i9trafego/src/feature/home/states/home.states.dart';
import 'package:i9trafego/src/model/condutor.model.dart';
import 'package:i9trafego/src/services/fct.service.dart';
import 'package:i9trafego/src/services/user.service.dart';

class HomeController extends ValueNotifier<HomeState> {
  HomeController() : super(HomeInitial());

  FctService fctService = FctService();
  CondutorService condutorService = CondutorService();
  CondutorModel? condutor;
}
