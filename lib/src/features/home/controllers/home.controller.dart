import 'package:flutter/cupertino.dart';
import 'package:i9t/src/features/home/states/home.states.dart';
import 'package:i9t/src/features/condutor/models/condutor.model.dart';
import 'package:i9t/src/features/fct/models/fct.model.dart';
import 'package:i9t/src/features/condutor/services/condutor.service.dart';

class HomeController extends ValueNotifier<HomeState> {
  HomeController() : super(HomeInitial());
  bool botoaAdicionarAtivo = false;
}
