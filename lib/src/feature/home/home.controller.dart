import 'package:flutter/cupertino.dart';
import 'package:i9t/src/feature/home/states/home.states.dart';
import 'package:i9t/src/model/condutor.model.dart';
import 'package:i9t/src/services/fct.service.dart';
import 'package:i9t/src/services/condutor.service.dart';

class HomeController extends ValueNotifier<HomeState> {
  HomeController() : super(HomeInitial());

  FctService fctService = FctService();
  CondutorService condutorService = CondutorService();
  CondutorModel? condutor;
}
