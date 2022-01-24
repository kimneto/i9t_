import 'package:i9t/src/features/fct/models/fct.model.dart';

abstract class FctAbertaState {}

class FctAbertaInitial extends FctAbertaState {}

class FctAbertaLoading extends FctAbertaState {}

class FctAbertaFailure extends FctAbertaState {
  final String error;

  FctAbertaFailure({required this.error});
}

class FctAbertaSuccess extends FctAbertaState {
  final FctModel fctAberta;

  FctAbertaSuccess({required this.fctAberta});
}
