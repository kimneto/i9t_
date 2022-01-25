import 'package:i9t/src/features/fct/models/fct.model.dart';

abstract class FctAbertaState {
  late String error;
}

class FctAbertaInitial extends FctAbertaState {}

class FctAbertaLoading extends FctAbertaState {}

class FctAbertaFailure extends FctAbertaState {
  @override
  final String error;
  FctAbertaFailure({required this.error});
}

class FctAbertaSuccess extends FctAbertaState {
  final FctModel fctAberta;
  FctAbertaSuccess({required this.fctAberta});
}
