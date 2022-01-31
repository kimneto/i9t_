import 'package:i9t/src/features/fct/models/fct.model.dart';

abstract class FctAbertaState {
  late String error;
}

class FctAbertaInitialState extends FctAbertaState {}

class FctAbertaLoadingState extends FctAbertaState {}

class FctAbertaFailureState extends FctAbertaState {
  @override
  final String error;
  FctAbertaFailureState({required this.error});
}

class FctAbertaSuccessState extends FctAbertaState {
  final FctModel fctAberta;
  FctAbertaSuccessState({required this.fctAberta});
}
